/// ISO 4217 code applied to new monetary records (Ghanaian cedi).
const defaultCurrencyCode = 'GHS';

/// ISO 3166-1 alpha-2 code applied to new properties.
const defaultCountryCode = 'GH';

final _currencyPattern = RegExp(r'^[A-Z]{3}$');

/// Whether [code] looks like an ISO 4217 currency code.
bool isValidCurrencyCode(String code) => _currencyPattern.hasMatch(code);
