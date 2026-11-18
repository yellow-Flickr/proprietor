import 'package:flutter_test/flutter_test.dart';
import 'package:proprietor/src/core/domain/domain_exception.dart';
import 'package:proprietor/src/features/payments/application/payment_service.dart';
import 'package:proprietor/src/features/payments/domain/payment.dart';
import 'package:proprietor/src/features/payments/domain/rent_obligation.dart';
import 'package:proprietor/src/features/tenants/domain/tenancy.dart';

import '../../helpers/test_app.dart';

void main() {
  late TestApp app;
  late Portfolio p;
  late Tenancy tenancy;
  late RentObligation jan;
  late RentObligation feb;

  Future<RentObligation> addMonth(int month) => app.obligations.addObligation(
    tenancyId: tenancy.id,
    periodStart: DateTime.utc(2026, month, 1),
    periodEnd: DateTime.utc(2026, month + 1, 0),
    dueDate: DateTime.utc(2026, month, 1),
    amountDueMinor: 150000,
  );

  Future<Payment> pay(int amount, [List<AllocationInput> to = const []]) =>
      app.payments.recordPayment(
        tenancyId: tenancy.id,
        amountReceivedMinor: amount,
        receivedDate: DateTime.utc(2026, 1, 3),
        paymentMethod: PaymentMethod.mobileMoney,
        allocations: to,
      );

  AllocationInput to(RentObligation o, int amount) =>
      AllocationInput(rentObligationId: o.id, amountMinor: amount);

  setUp(() async {
    app = TestApp(); // today = 2026-11-16
    p = await app.seedPortfolio();
    tenancy = await app.createTenancy(p);
    jan = await addMonth(1);
    feb = await addMonth(2);
  });

  test('a partial payment leaves the obligation partially paid', () async {
    app.now = DateTime.utc(2025, 12, 20, 11); // before the due date
    await pay(100000, [to(jan, 100000)]);

    final balance = await app.obligations.getBalance(jan.id);
    expect(balance.amountPaidMinor, 100000);
    expect(balance.outstandingMinor, 50000);
    expect(
      balance.statusOn(DateTime.utc(2025, 12, 20)),
      ObligationPaymentStatus.partiallyPaid,
    );
    expect(
      balance.statusOn(DateTime.utc(2026, 1, 2)),
      ObligationPaymentStatus.overdue,
    );
  });

  test('one payment can settle several periods', () async {
    final payment = await pay(300000, [to(jan, 150000), to(feb, 150000)]);

    final balances = await app.obligations.getBalances(tenancy.id);
    final today = DateTime.utc(2026, 11, 16);
    expect(
      balances.map((b) => b.statusOn(today)),
      everyElement(ObligationPaymentStatus.paid),
    );
    expect(await app.payments.unallocatedAmount(payment.id), 0);
  });

  test('unallocated money stays visible', () async {
    final payment = await pay(200000, [to(jan, 150000)]);
    expect(await app.payments.unallocatedAmount(payment.id), 50000);
  });

  test('cannot allocate more than the payment amount', () async {
    final payment = await pay(100000, [to(jan, 60000)]);
    expect(
      () => app.payments.allocate(
        paymentId: payment.id,
        rentObligationId: feb.id,
        amountMinor: 50000,
      ),
      throwsA(isA<ConflictException>()),
    );
  });

  test('cannot allocate more than the obligation amount', () async {
    await pay(100000, [to(jan, 100000)]);
    final second = await pay(100000);
    expect(
      () => app.payments.allocate(
        paymentId: second.id,
        rentObligationId: jan.id,
        amountMinor: 60000,
      ),
      throwsA(isA<ConflictException>()),
    );
  });

  test('a failed allocation rolls back the whole payment', () async {
    await expectLater(
      pay(100000, [to(jan, 200000)]),
      throwsA(isA<ConflictException>()),
    );
    expect(await app.payments.watchPayments(tenancy.id).first, isEmpty);
  });

  test('cannot allocate to another tenancy\'s obligation', () async {
    final otherUnit = await app.properties.createProperty(
      landlordId: p.landlord.id,
      name: 'Second House',
      propertyType: p.property.propertyType,
    );
    final unitId =
        (await app.properties.watchUnits(otherUnit.id).first).single.id;
    final otherTenancy = await app.createTenancy(p, unitId: unitId);
    final otherObligation = await app.obligations.addObligation(
      tenancyId: otherTenancy.id,
      periodStart: DateTime.utc(2026, 1, 1),
      periodEnd: DateTime.utc(2026, 1, 31),
      dueDate: DateTime.utc(2026, 1, 1),
      amountDueMinor: 150000,
    );

    final payment = await pay(100000);
    expect(
      () => app.payments.allocate(
        paymentId: payment.id,
        rentObligationId: otherObligation.id,
        amountMinor: 100000,
      ),
      throwsA(isA<ValidationException>()),
    );
  });

  test('a reversed payment no longer counts and cannot be allocated', () async {
    final payment = await pay(150000, [to(jan, 150000)]);
    await app.payments.reversePayment(payment.id, reason: 'Entered twice');

    final balance = await app.obligations.getBalance(jan.id);
    expect(balance.amountPaidMinor, 0);
    expect(await app.payments.unallocatedAmount(payment.id), 0);
    expect(
      () => app.payments.allocate(
        paymentId: payment.id,
        rentObligationId: feb.id,
        amountMinor: 1,
      ),
      throwsA(isA<ConflictException>()),
    );
    // History is kept.
    final stored = await app.payments.getPayment(payment.id);
    expect(stored.recordStatus, PaymentRecordStatus.reversed);
    expect(stored.reversalReason, 'Entered twice');
  });

  test('rejects a duplicate obligation for the same period', () {
    expect(() => addMonth(1), throwsA(isA<ConflictException>()));
  });

  test('payments and obligations need a confirmed tenancy', () async {
    final draft = await app.createTenancy(
      p,
      start: DateTime.utc(2027, 1, 1),
      end: DateTime.utc(2027, 12, 31),
      confirm: false,
    );
    expect(
      () => app.payments.recordPayment(
        tenancyId: draft.id,
        amountReceivedMinor: 1000,
        receivedDate: DateTime.utc(2027, 1, 1),
        paymentMethod: PaymentMethod.cash,
      ),
      throwsA(isA<ConflictException>()),
    );
  });

  test('payment currency must match the tenancy', () {
    expect(
      () => app.payments.recordPayment(
        tenancyId: tenancy.id,
        amountReceivedMinor: 1000,
        currency: 'USD',
        receivedDate: DateTime.utc(2026, 1, 1),
        paymentMethod: PaymentMethod.bankTransfer,
      ),
      throwsA(isA<ValidationException>()),
    );
  });
}
