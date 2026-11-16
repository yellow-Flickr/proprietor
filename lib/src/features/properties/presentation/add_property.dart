import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:proprietor/src/shared/widgets/circles_paint.dart';

class AddProperty extends ConsumerStatefulWidget {
  const AddProperty({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddPropertyState();

  static const routeName = '/add_property';
}

class _AddPropertyState extends ConsumerState<AddProperty> {
  final List<String> _list = [
    'Single Room Flat1',
    'Single Room Flat2',
    'Single Room Flat3',
    'Single Room Flat4',
    'Single Room Flat5'
  ];
  List<String> infoSource = [
    "Friend/Family",
    "Facebook",
    "Online",
    "Radio",
    "Billboard",
    "Trotro",
    "Newspaper",
    "Sales Agent",
    "Other"
  ];
  String policy = 'Yes';
  String infoSourceValue = 'Facebook';
  int stepIndex = 0;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        // title: const Text('Add Property'),
        // shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.only(bottomRight: Radius.circular(0))),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(6.5.h),
          child: CustomPaint(
            painter: CirclesPaint(),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                decoration: BoxDecoration(
                    //color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            width: 10.w,
                            height: 10.w,
                            child: Icon(
                              Icons.groups_2_sharp,
                              color: theme.primaryColor,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Add Property',
                                style: theme.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                'The people who you want to campaign to.',
                                style: theme.textTheme.bodySmall
                                    ?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
      body: Theme(
        data: theme.copyWith(canvasColor: theme.primaryColor),
        child: Stepper(
           
          type: StepperType.horizontal,
          // margin: EdgeInsets.zero,
          elevation: 0,
          currentStep: stepIndex,
          onStepContinue: () {
            setState(() {
              stepIndex < 2 ? stepIndex++ : stepIndex;
            });
          },
          onStepCancel: () {
            setState(() {
              stepIndex > 0 ? stepIndex-- : stepIndex;
            });
          },
          steps: [
            Step(
              title: const SizedBox.shrink(),
              label: Text(
                "First",
                style: theme.textTheme.labelSmall,
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  // shrinkWrap: true,
                  children: [
                    TextField(
                      style: theme.textTheme.bodySmall,
                      decoration: InputDecoration(
                          labelStyle: theme.textTheme.bodySmall,
                          labelText: 'Property Name',
                          isDense: true),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextField(
                      style: theme.textTheme.bodySmall,
                      decoration: InputDecoration(
                          labelStyle: theme.textTheme.bodySmall,
                          labelText: 'Address',
                          isDense: true),
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextField(
                      style: theme.textTheme.bodySmall,
                      decoration: InputDecoration(
                          labelStyle: theme.textTheme.labelSmall,
                          labelText: 'Region/State',
                          isDense: true),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: theme.textTheme.bodySmall,
                            decoration: InputDecoration(
                                labelStyle: theme.textTheme.labelSmall,
                                labelText: 'City',
                                isDense: true),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Expanded(
                          child: TextField(
                            style: theme.textTheme.bodySmall,
                            decoration: InputDecoration(
                                labelStyle: theme.textTheme.bodySmall,
                                labelText: 'GPS Coordinate',
                                isDense: true),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DropdownButtonFormField(
                      value: _list.first,
                      style: theme.textTheme.bodySmall,
                      decoration: const InputDecoration(isDense: true,labelText: 'Property Type'),
                      
                      items: _list
                          .map((toElement) => DropdownMenuItem(
                                value: toElement,
                                child: Text(toElement),
                              ))
                          .toList(),
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: theme.textTheme.bodySmall,
                            decoration: InputDecoration(
                                labelStyle: theme.textTheme.bodySmall,
                                labelText: 'No. of Bedrooms',
                                isDense: true),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Expanded(
                          child: TextField(
                            style: theme.textTheme.bodySmall,
                            decoration: InputDecoration(
                                labelStyle: theme.textTheme.bodySmall,
                                labelText: 'No. of Bathrooms',
                                isDense: true),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: theme.textTheme.bodySmall,
                            decoration: InputDecoration(
                                labelStyle: theme.textTheme.bodySmall,
                                labelText: 'Approx. Total Area/Size (sq.meter)',
                                isDense: true),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Expanded(
                          child: TextField(
                            style: theme.textTheme.bodySmall,
                            decoration: InputDecoration(
                                labelStyle: theme.textTheme.bodySmall,
                                labelText: 'Rent Amount',
                                isDense: true),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextField(
                      style: theme.textTheme.bodySmall,
                      decoration: InputDecoration(
                          labelStyle: theme.textTheme.bodySmall,
                          labelText: 'Description',
                          isDense: true),
                      maxLines: 4,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add Image',
                          style: theme.textTheme.labelSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          width: 35.w,
                          height: 30.w,
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                              color: theme.highlightColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Icon(Icons.add_a_photo_outlined),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            ),
            Step(
              title: const SizedBox.shrink(),
              label: Text(
                "First",
                style: theme.textTheme.labelSmall,
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  // shrinkWrap: true,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lease Term',
                          style: theme.textTheme.labelMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        DateTimeField(
                          keyboardType: TextInputType.datetime,
                          style: theme.textTheme.bodySmall,
                          decoration: InputDecoration(
                              labelStyle: theme.textTheme.bodySmall,
                              labelText: 'Date available (Optional)',
                              isDense: true),
                          onShowPicker:
                              (BuildContext context, DateTime? currentValue) =>
                                  showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            initialDate: DateTime.now(),
                            lastDate: DateTime(2099),
                          ),
                          format: DateFormat("EEEE, MMMM d, yyyy"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rent & Deposit',
                          style: theme.textTheme.labelMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                style: theme.textTheme.bodySmall,
                                keyboardType: const TextInputType.numberWithOptions(),
                                decoration: InputDecoration(
                                    prefixText: 'GHs ',
                                    labelStyle: theme.textTheme.labelSmall,
                                    labelText: 'Rent Amount',
                                    isDense: true),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Expanded(
                              child: TextField(
                                style: theme.textTheme.bodySmall,
                                keyboardType: const TextInputType.numberWithOptions(),
                                decoration: InputDecoration(
                                    prefixText: 'GHs ',
                                    labelStyle: theme.textTheme.bodySmall,
                                    labelText: 'Security Deposit',
                                    isDense: true),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Policies',
                      style: theme.textTheme.labelMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Do you allow smoking on your property?',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Theme(
                          data: theme.copyWith(
                              listTileTheme:
                                  ListTileThemeData(horizontalTitleGap: 1.w)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: RadioListTile<String>(
                                    contentPadding: EdgeInsets.zero,
                                    dense: true,
                                    visualDensity: VisualDensity.compact,
                                    title: Text(
                                      'Yes',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    value: 'Yes',
                                    groupValue: policy,
                                    onChanged: (String? value) {
                                      setState(() {
                                        policy = value!;
                                      });
                                    },
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: RadioListTile<String>(
                                    contentPadding: EdgeInsets.zero,
                                    dense: true,
                                    title: Text(
                                      'No',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    value: 'No',
                                    groupValue: policy,
                                    onChanged: (String? value) {
                                      setState(() {
                                        policy = value!;
                                      });
                                    },
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: RadioListTile<String>(
                                    contentPadding: EdgeInsets.zero,
                                    visualDensity: VisualDensity.compact,
                                    value: 'Outside Only',
                                    title: Text(
                                      'Outside Only',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    groupValue: policy,
                                    onChanged: (String? value) {
                                      setState(() {
                                        policy = value!;
                                      });
                                    },
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Do you allow smoking on your property?',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Theme(
                          data: theme.copyWith(
                              listTileTheme:
                                  ListTileThemeData(horizontalTitleGap: 1.w)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: RadioListTile<String>(
                                    contentPadding: EdgeInsets.zero,
                                    dense: true,
                                    visualDensity: VisualDensity.compact,
                                    title: Text(
                                      'Yes',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    value: 'Yes',
                                    groupValue: policy,
                                    onChanged: (String? value) {
                                      setState(() {
                                        policy = value!;
                                      });
                                    },
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: RadioListTile<String>(
                                    contentPadding: EdgeInsets.zero,
                                    dense: true,
                                    title: Text(
                                      'No',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    value: 'No',
                                    groupValue: policy,
                                    onChanged: (String? value) {
                                      setState(() {
                                        policy = value!;
                                      });
                                    },
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: RadioListTile<String>(
                                    contentPadding: EdgeInsets.zero,
                                    visualDensity: VisualDensity.compact,
                                    value: 'Outside Only',
                                    title: Text(
                                      'Outside Only',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    groupValue: policy,
                                    onChanged: (String? value) {
                                      setState(() {
                                        policy = value!;
                                      });
                                    },
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Do you allow smoking on your property?',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Theme(
                          data: theme.copyWith(
                              listTileTheme:
                                  ListTileThemeData(horizontalTitleGap: 1.w)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: RadioListTile<String>(
                                    contentPadding: EdgeInsets.zero,
                                    dense: true,
                                    visualDensity: VisualDensity.compact,
                                    title: Text(
                                      'Yes',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    value: 'Yes',
                                    groupValue: policy,
                                    onChanged: (String? value) {
                                      setState(() {
                                        policy = value!;
                                      });
                                    },
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: RadioListTile<String>(
                                    contentPadding: EdgeInsets.zero,
                                    dense: true,
                                    title: Text(
                                      'No',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    value: 'No',
                                    groupValue: policy,
                                    onChanged: (String? value) {
                                      setState(() {
                                        policy = value!;
                                      });
                                    },
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: RadioListTile<String>(
                                    contentPadding: EdgeInsets.zero,
                                    visualDensity: VisualDensity.compact,
                                    value: 'Outside Only',
                                    title: Text(
                                      'Outside Only',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    groupValue: policy,
                                    onChanged: (String? value) {
                                      setState(() {
                                        policy = value!;
                                      });
                                    },
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            ),
            Step(
              title: const SizedBox.shrink(),
              label: Text(
                "First",
                style: theme.textTheme.labelSmall,
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  // shrinkWrap: true,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Utilities paid by landlord',
                          style: theme.textTheme.labelMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        GridView(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 50.w,
                                  childAspectRatio: 5),
                          shrinkWrap: true,
                          children: List.generate(
                              infoSource.length,
                              (index) => CheckboxListTile(
                                    contentPadding: EdgeInsets.zero,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text(infoSource[index],
                                        style: theme.textTheme.bodySmall),
                                    value: index.isOdd,
                                    // groupValue: infoSourceValue,
                                    onChanged: (value) {},
                                  )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Utilities paid by landlord',
                          style: theme.textTheme.labelMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        GridView(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 50.w,
                                  childAspectRatio: 5),
                          shrinkWrap: true,
                          children: List.generate(
                              infoSource.length,
                              (index) => CheckboxListTile(
                                    contentPadding: EdgeInsets.zero,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text(infoSource[index],
                                        style: theme.textTheme.bodySmall),
                                    value: index.isOdd,
                                    // groupValue: infoSourceValue,
                                    onChanged: (value) {},
                                  )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Utilities paid by landlord',
                          style: theme.textTheme.labelMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        GridView(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 50.w,
                                  childAspectRatio: 5),
                          shrinkWrap: true,
                          children: List.generate(
                              infoSource.length,
                              (index) => CheckboxListTile(
                                    contentPadding: EdgeInsets.zero,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text(infoSource[index],
                                        style: theme.textTheme.bodySmall),
                                    value: index.isOdd,
                                    // groupValue: infoSourceValue,
                                    onChanged: (value) {},
                                  )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Utilities paid by landlord',
                          style: theme.textTheme.labelMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        GridView(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 50.w,
                                  childAspectRatio: 5),
                          shrinkWrap: true,
                          children: List.generate(
                              infoSource.length,
                              (index) => CheckboxListTile(
                                    contentPadding: EdgeInsets.zero,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text(infoSource[index],
                                        style: theme.textTheme.bodySmall),
                                    value: index.isOdd,
                                    // groupValue: infoSourceValue,
                                    onChanged: (value) {},
                                  )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
