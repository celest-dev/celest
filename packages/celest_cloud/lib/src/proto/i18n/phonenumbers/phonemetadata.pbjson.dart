//
//  Generated code. Do not modify.
//  source: i18n/phonenumbers/phonemetadata.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use numberFormatDescriptor instead')
const NumberFormat$json = {
  '1': 'NumberFormat',
  '2': [
    {'1': 'pattern', '3': 1, '4': 2, '5': 9, '10': 'pattern'},
    {'1': 'format', '3': 2, '4': 2, '5': 9, '10': 'format'},
    {
      '1': 'leading_digits_pattern',
      '3': 3,
      '4': 3,
      '5': 9,
      '10': 'leadingDigitsPattern'
    },
    {
      '1': 'national_prefix_formatting_rule',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'nationalPrefixFormattingRule'
    },
    {
      '1': 'national_prefix_optional_when_formatting',
      '3': 6,
      '4': 1,
      '5': 8,
      '7': 'false',
      '10': 'nationalPrefixOptionalWhenFormatting'
    },
    {
      '1': 'domestic_carrier_code_formatting_rule',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'domesticCarrierCodeFormattingRule'
    },
  ],
};

/// Descriptor for `NumberFormat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List numberFormatDescriptor = $convert.base64Decode(
    'CgxOdW1iZXJGb3JtYXQSGAoHcGF0dGVybhgBIAIoCVIHcGF0dGVybhIWCgZmb3JtYXQYAiACKA'
    'lSBmZvcm1hdBI0ChZsZWFkaW5nX2RpZ2l0c19wYXR0ZXJuGAMgAygJUhRsZWFkaW5nRGlnaXRz'
    'UGF0dGVybhJFCh9uYXRpb25hbF9wcmVmaXhfZm9ybWF0dGluZ19ydWxlGAQgASgJUhxuYXRpb2'
    '5hbFByZWZpeEZvcm1hdHRpbmdSdWxlEl0KKG5hdGlvbmFsX3ByZWZpeF9vcHRpb25hbF93aGVu'
    'X2Zvcm1hdHRpbmcYBiABKAg6BWZhbHNlUiRuYXRpb25hbFByZWZpeE9wdGlvbmFsV2hlbkZvcm'
    '1hdHRpbmcSUAolZG9tZXN0aWNfY2Fycmllcl9jb2RlX2Zvcm1hdHRpbmdfcnVsZRgFIAEoCVIh'
    'ZG9tZXN0aWNDYXJyaWVyQ29kZUZvcm1hdHRpbmdSdWxl');

@$core.Deprecated('Use phoneNumberDescDescriptor instead')
const PhoneNumberDesc$json = {
  '1': 'PhoneNumberDesc',
  '2': [
    {
      '1': 'national_number_pattern',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'nationalNumberPattern'
    },
    {'1': 'possible_length', '3': 9, '4': 3, '5': 5, '10': 'possibleLength'},
    {
      '1': 'possible_length_local_only',
      '3': 10,
      '4': 3,
      '5': 5,
      '10': 'possibleLengthLocalOnly'
    },
    {'1': 'example_number', '3': 6, '4': 1, '5': 9, '10': 'exampleNumber'},
  ],
};

/// Descriptor for `PhoneNumberDesc`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List phoneNumberDescDescriptor = $convert.base64Decode(
    'Cg9QaG9uZU51bWJlckRlc2MSNgoXbmF0aW9uYWxfbnVtYmVyX3BhdHRlcm4YAiABKAlSFW5hdG'
    'lvbmFsTnVtYmVyUGF0dGVybhInCg9wb3NzaWJsZV9sZW5ndGgYCSADKAVSDnBvc3NpYmxlTGVu'
    'Z3RoEjsKGnBvc3NpYmxlX2xlbmd0aF9sb2NhbF9vbmx5GAogAygFUhdwb3NzaWJsZUxlbmd0aE'
    'xvY2FsT25seRIlCg5leGFtcGxlX251bWJlchgGIAEoCVINZXhhbXBsZU51bWJlcg==');

@$core.Deprecated('Use phoneMetadataDescriptor instead')
const PhoneMetadata$json = {
  '1': 'PhoneMetadata',
  '2': [
    {
      '1': 'general_desc',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneNumberDesc',
      '10': 'generalDesc'
    },
    {
      '1': 'fixed_line',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneNumberDesc',
      '10': 'fixedLine'
    },
    {
      '1': 'mobile',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneNumberDesc',
      '10': 'mobile'
    },
    {
      '1': 'toll_free',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneNumberDesc',
      '10': 'tollFree'
    },
    {
      '1': 'premium_rate',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneNumberDesc',
      '10': 'premiumRate'
    },
    {
      '1': 'shared_cost',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneNumberDesc',
      '10': 'sharedCost'
    },
    {
      '1': 'personal_number',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneNumberDesc',
      '10': 'personalNumber'
    },
    {
      '1': 'voip',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneNumberDesc',
      '10': 'voip'
    },
    {
      '1': 'pager',
      '3': 21,
      '4': 1,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneNumberDesc',
      '10': 'pager'
    },
    {
      '1': 'uan',
      '3': 25,
      '4': 1,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneNumberDesc',
      '10': 'uan'
    },
    {
      '1': 'emergency',
      '3': 27,
      '4': 1,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneNumberDesc',
      '10': 'emergency'
    },
    {
      '1': 'voicemail',
      '3': 28,
      '4': 1,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneNumberDesc',
      '10': 'voicemail'
    },
    {
      '1': 'short_code',
      '3': 29,
      '4': 1,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneNumberDesc',
      '10': 'shortCode'
    },
    {
      '1': 'standard_rate',
      '3': 30,
      '4': 1,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneNumberDesc',
      '10': 'standardRate'
    },
    {
      '1': 'carrier_specific',
      '3': 31,
      '4': 1,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneNumberDesc',
      '10': 'carrierSpecific'
    },
    {
      '1': 'sms_services',
      '3': 33,
      '4': 1,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneNumberDesc',
      '10': 'smsServices'
    },
    {
      '1': 'no_international_dialling',
      '3': 24,
      '4': 1,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneNumberDesc',
      '10': 'noInternationalDialling'
    },
    {'1': 'id', '3': 9, '4': 2, '5': 9, '10': 'id'},
    {'1': 'country_code', '3': 10, '4': 1, '5': 5, '10': 'countryCode'},
    {
      '1': 'international_prefix',
      '3': 11,
      '4': 1,
      '5': 9,
      '10': 'internationalPrefix'
    },
    {
      '1': 'preferred_international_prefix',
      '3': 17,
      '4': 1,
      '5': 9,
      '10': 'preferredInternationalPrefix'
    },
    {'1': 'national_prefix', '3': 12, '4': 1, '5': 9, '10': 'nationalPrefix'},
    {
      '1': 'preferred_extn_prefix',
      '3': 13,
      '4': 1,
      '5': 9,
      '10': 'preferredExtnPrefix'
    },
    {
      '1': 'national_prefix_for_parsing',
      '3': 15,
      '4': 1,
      '5': 9,
      '10': 'nationalPrefixForParsing'
    },
    {
      '1': 'national_prefix_transform_rule',
      '3': 16,
      '4': 1,
      '5': 9,
      '10': 'nationalPrefixTransformRule'
    },
    {
      '1': 'same_mobile_and_fixed_line_pattern',
      '3': 18,
      '4': 1,
      '5': 8,
      '7': 'false',
      '10': 'sameMobileAndFixedLinePattern'
    },
    {
      '1': 'number_format',
      '3': 19,
      '4': 3,
      '5': 11,
      '6': '.i18n.phonenumbers.NumberFormat',
      '10': 'numberFormat'
    },
    {
      '1': 'intl_number_format',
      '3': 20,
      '4': 3,
      '5': 11,
      '6': '.i18n.phonenumbers.NumberFormat',
      '10': 'intlNumberFormat'
    },
    {
      '1': 'main_country_for_code',
      '3': 22,
      '4': 1,
      '5': 8,
      '7': 'false',
      '10': 'mainCountryForCode'
    },
    {'1': 'leading_digits', '3': 23, '4': 1, '5': 9, '10': 'leadingDigits'},
    {
      '1': 'mobile_number_portable_region',
      '3': 32,
      '4': 1,
      '5': 8,
      '7': 'false',
      '10': 'mobileNumberPortableRegion'
    },
  ],
  '9': [
    {'1': 26, '2': 27},
  ],
  '10': ['leading_zero_possible'],
};

/// Descriptor for `PhoneMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List phoneMetadataDescriptor = $convert.base64Decode(
    'Cg1QaG9uZU1ldGFkYXRhEkUKDGdlbmVyYWxfZGVzYxgBIAEoCzIiLmkxOG4ucGhvbmVudW1iZX'
    'JzLlBob25lTnVtYmVyRGVzY1ILZ2VuZXJhbERlc2MSQQoKZml4ZWRfbGluZRgCIAEoCzIiLmkx'
    'OG4ucGhvbmVudW1iZXJzLlBob25lTnVtYmVyRGVzY1IJZml4ZWRMaW5lEjoKBm1vYmlsZRgDIA'
    'EoCzIiLmkxOG4ucGhvbmVudW1iZXJzLlBob25lTnVtYmVyRGVzY1IGbW9iaWxlEj8KCXRvbGxf'
    'ZnJlZRgEIAEoCzIiLmkxOG4ucGhvbmVudW1iZXJzLlBob25lTnVtYmVyRGVzY1IIdG9sbEZyZW'
    'USRQoMcHJlbWl1bV9yYXRlGAUgASgLMiIuaTE4bi5waG9uZW51bWJlcnMuUGhvbmVOdW1iZXJE'
    'ZXNjUgtwcmVtaXVtUmF0ZRJDCgtzaGFyZWRfY29zdBgGIAEoCzIiLmkxOG4ucGhvbmVudW1iZX'
    'JzLlBob25lTnVtYmVyRGVzY1IKc2hhcmVkQ29zdBJLCg9wZXJzb25hbF9udW1iZXIYByABKAsy'
    'Ii5pMThuLnBob25lbnVtYmVycy5QaG9uZU51bWJlckRlc2NSDnBlcnNvbmFsTnVtYmVyEjYKBH'
    'ZvaXAYCCABKAsyIi5pMThuLnBob25lbnVtYmVycy5QaG9uZU51bWJlckRlc2NSBHZvaXASOAoF'
    'cGFnZXIYFSABKAsyIi5pMThuLnBob25lbnVtYmVycy5QaG9uZU51bWJlckRlc2NSBXBhZ2VyEj'
    'QKA3VhbhgZIAEoCzIiLmkxOG4ucGhvbmVudW1iZXJzLlBob25lTnVtYmVyRGVzY1IDdWFuEkAK'
    'CWVtZXJnZW5jeRgbIAEoCzIiLmkxOG4ucGhvbmVudW1iZXJzLlBob25lTnVtYmVyRGVzY1IJZW'
    '1lcmdlbmN5EkAKCXZvaWNlbWFpbBgcIAEoCzIiLmkxOG4ucGhvbmVudW1iZXJzLlBob25lTnVt'
    'YmVyRGVzY1IJdm9pY2VtYWlsEkEKCnNob3J0X2NvZGUYHSABKAsyIi5pMThuLnBob25lbnVtYm'
    'Vycy5QaG9uZU51bWJlckRlc2NSCXNob3J0Q29kZRJHCg1zdGFuZGFyZF9yYXRlGB4gASgLMiIu'
    'aTE4bi5waG9uZW51bWJlcnMuUGhvbmVOdW1iZXJEZXNjUgxzdGFuZGFyZFJhdGUSTQoQY2Fycm'
    'llcl9zcGVjaWZpYxgfIAEoCzIiLmkxOG4ucGhvbmVudW1iZXJzLlBob25lTnVtYmVyRGVzY1IP'
    'Y2FycmllclNwZWNpZmljEkUKDHNtc19zZXJ2aWNlcxghIAEoCzIiLmkxOG4ucGhvbmVudW1iZX'
    'JzLlBob25lTnVtYmVyRGVzY1ILc21zU2VydmljZXMSXgoZbm9faW50ZXJuYXRpb25hbF9kaWFs'
    'bGluZxgYIAEoCzIiLmkxOG4ucGhvbmVudW1iZXJzLlBob25lTnVtYmVyRGVzY1IXbm9JbnRlcm'
    '5hdGlvbmFsRGlhbGxpbmcSDgoCaWQYCSACKAlSAmlkEiEKDGNvdW50cnlfY29kZRgKIAEoBVIL'
    'Y291bnRyeUNvZGUSMQoUaW50ZXJuYXRpb25hbF9wcmVmaXgYCyABKAlSE2ludGVybmF0aW9uYW'
    'xQcmVmaXgSRAoecHJlZmVycmVkX2ludGVybmF0aW9uYWxfcHJlZml4GBEgASgJUhxwcmVmZXJy'
    'ZWRJbnRlcm5hdGlvbmFsUHJlZml4EicKD25hdGlvbmFsX3ByZWZpeBgMIAEoCVIObmF0aW9uYW'
    'xQcmVmaXgSMgoVcHJlZmVycmVkX2V4dG5fcHJlZml4GA0gASgJUhNwcmVmZXJyZWRFeHRuUHJl'
    'Zml4Ej0KG25hdGlvbmFsX3ByZWZpeF9mb3JfcGFyc2luZxgPIAEoCVIYbmF0aW9uYWxQcmVmaX'
    'hGb3JQYXJzaW5nEkMKHm5hdGlvbmFsX3ByZWZpeF90cmFuc2Zvcm1fcnVsZRgQIAEoCVIbbmF0'
    'aW9uYWxQcmVmaXhUcmFuc2Zvcm1SdWxlElAKInNhbWVfbW9iaWxlX2FuZF9maXhlZF9saW5lX3'
    'BhdHRlcm4YEiABKAg6BWZhbHNlUh1zYW1lTW9iaWxlQW5kRml4ZWRMaW5lUGF0dGVybhJECg1u'
    'dW1iZXJfZm9ybWF0GBMgAygLMh8uaTE4bi5waG9uZW51bWJlcnMuTnVtYmVyRm9ybWF0UgxudW'
    '1iZXJGb3JtYXQSTQoSaW50bF9udW1iZXJfZm9ybWF0GBQgAygLMh8uaTE4bi5waG9uZW51bWJl'
    'cnMuTnVtYmVyRm9ybWF0UhBpbnRsTnVtYmVyRm9ybWF0EjgKFW1haW5fY291bnRyeV9mb3JfY2'
    '9kZRgWIAEoCDoFZmFsc2VSEm1haW5Db3VudHJ5Rm9yQ29kZRIlCg5sZWFkaW5nX2RpZ2l0cxgX'
    'IAEoCVINbGVhZGluZ0RpZ2l0cxJICh1tb2JpbGVfbnVtYmVyX3BvcnRhYmxlX3JlZ2lvbhggIA'
    'EoCDoFZmFsc2VSGm1vYmlsZU51bWJlclBvcnRhYmxlUmVnaW9uSgQIGhAbUhVsZWFkaW5nX3pl'
    'cm9fcG9zc2libGU=');

@$core.Deprecated('Use phoneMetadataCollectionDescriptor instead')
const PhoneMetadataCollection$json = {
  '1': 'PhoneMetadataCollection',
  '2': [
    {
      '1': 'metadata',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneMetadata',
      '10': 'metadata'
    },
  ],
};

/// Descriptor for `PhoneMetadataCollection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List phoneMetadataCollectionDescriptor =
    $convert.base64Decode(
        'ChdQaG9uZU1ldGFkYXRhQ29sbGVjdGlvbhI8CghtZXRhZGF0YRgBIAMoCzIgLmkxOG4ucGhvbm'
        'VudW1iZXJzLlBob25lTWV0YWRhdGFSCG1ldGFkYXRh');
