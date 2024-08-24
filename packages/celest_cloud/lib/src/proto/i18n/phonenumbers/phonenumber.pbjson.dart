//
//  Generated code. Do not modify.
//  source: i18n/phonenumbers/phonenumber.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use phoneNumberDescriptor instead')
const PhoneNumber$json = {
  '1': 'PhoneNumber',
  '2': [
    {'1': 'country_code', '3': 1, '4': 2, '5': 5, '10': 'countryCode'},
    {'1': 'national_number', '3': 2, '4': 2, '5': 4, '10': 'nationalNumber'},
    {'1': 'extension', '3': 3, '4': 1, '5': 9, '10': 'extension'},
    {
      '1': 'italian_leading_zero',
      '3': 4,
      '4': 1,
      '5': 8,
      '10': 'italianLeadingZero'
    },
    {
      '1': 'number_of_leading_zeros',
      '3': 8,
      '4': 1,
      '5': 5,
      '7': '1',
      '10': 'numberOfLeadingZeros'
    },
    {'1': 'raw_input', '3': 5, '4': 1, '5': 9, '10': 'rawInput'},
    {
      '1': 'country_code_source',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.i18n.phonenumbers.PhoneNumber.CountryCodeSource',
      '10': 'countryCodeSource'
    },
    {
      '1': 'preferred_domestic_carrier_code',
      '3': 7,
      '4': 1,
      '5': 9,
      '10': 'preferredDomesticCarrierCode'
    },
  ],
  '4': [PhoneNumber_CountryCodeSource$json],
};

@$core.Deprecated('Use phoneNumberDescriptor instead')
const PhoneNumber_CountryCodeSource$json = {
  '1': 'CountryCodeSource',
  '2': [
    {'1': 'UNSPECIFIED', '2': 0},
    {'1': 'FROM_NUMBER_WITH_PLUS_SIGN', '2': 1},
    {'1': 'FROM_NUMBER_WITH_IDD', '2': 5},
    {'1': 'FROM_NUMBER_WITHOUT_PLUS_SIGN', '2': 10},
    {'1': 'FROM_DEFAULT_COUNTRY', '2': 20},
  ],
};

/// Descriptor for `PhoneNumber`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List phoneNumberDescriptor = $convert.base64Decode(
    'CgtQaG9uZU51bWJlchIhCgxjb3VudHJ5X2NvZGUYASACKAVSC2NvdW50cnlDb2RlEicKD25hdG'
    'lvbmFsX251bWJlchgCIAIoBFIObmF0aW9uYWxOdW1iZXISHAoJZXh0ZW5zaW9uGAMgASgJUgll'
    'eHRlbnNpb24SMAoUaXRhbGlhbl9sZWFkaW5nX3plcm8YBCABKAhSEml0YWxpYW5MZWFkaW5nWm'
    'VybxI4ChdudW1iZXJfb2ZfbGVhZGluZ196ZXJvcxgIIAEoBToBMVIUbnVtYmVyT2ZMZWFkaW5n'
    'WmVyb3MSGwoJcmF3X2lucHV0GAUgASgJUghyYXdJbnB1dBJgChNjb3VudHJ5X2NvZGVfc291cm'
    'NlGAYgASgOMjAuaTE4bi5waG9uZW51bWJlcnMuUGhvbmVOdW1iZXIuQ291bnRyeUNvZGVTb3Vy'
    'Y2VSEWNvdW50cnlDb2RlU291cmNlEkUKH3ByZWZlcnJlZF9kb21lc3RpY19jYXJyaWVyX2NvZG'
    'UYByABKAlSHHByZWZlcnJlZERvbWVzdGljQ2FycmllckNvZGUimwEKEUNvdW50cnlDb2RlU291'
    'cmNlEg8KC1VOU1BFQ0lGSUVEEAASHgoaRlJPTV9OVU1CRVJfV0lUSF9QTFVTX1NJR04QARIYCh'
    'RGUk9NX05VTUJFUl9XSVRIX0lERBAFEiEKHUZST01fTlVNQkVSX1dJVEhPVVRfUExVU19TSUdO'
    'EAoSGAoURlJPTV9ERUZBVUxUX0NPVU5UUlkQFA==');
