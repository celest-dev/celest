//
//  Generated code. Do not modify.
//  source: i18n/phonenumbers/phonemetadata.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class NumberFormat extends $pb.GeneratedMessage {
  factory NumberFormat({
    $core.String? pattern,
    $core.String? format,
    $core.Iterable<$core.String>? leadingDigitsPattern,
    $core.String? nationalPrefixFormattingRule,
    $core.String? domesticCarrierCodeFormattingRule,
    $core.bool? nationalPrefixOptionalWhenFormatting,
  }) {
    final $result = create();
    if (pattern != null) {
      $result.pattern = pattern;
    }
    if (format != null) {
      $result.format = format;
    }
    if (leadingDigitsPattern != null) {
      $result.leadingDigitsPattern.addAll(leadingDigitsPattern);
    }
    if (nationalPrefixFormattingRule != null) {
      $result.nationalPrefixFormattingRule = nationalPrefixFormattingRule;
    }
    if (domesticCarrierCodeFormattingRule != null) {
      $result.domesticCarrierCodeFormattingRule =
          domesticCarrierCodeFormattingRule;
    }
    if (nationalPrefixOptionalWhenFormatting != null) {
      $result.nationalPrefixOptionalWhenFormatting =
          nationalPrefixOptionalWhenFormatting;
    }
    return $result;
  }
  NumberFormat._() : super();
  factory NumberFormat.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NumberFormat.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NumberFormat',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'i18n.phonenumbers'),
      createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'pattern')
    ..aQS(2, _omitFieldNames ? '' : 'format')
    ..pPS(3, _omitFieldNames ? '' : 'leadingDigitsPattern')
    ..aOS(4, _omitFieldNames ? '' : 'nationalPrefixFormattingRule')
    ..aOS(5, _omitFieldNames ? '' : 'domesticCarrierCodeFormattingRule')
    ..aOB(6, _omitFieldNames ? '' : 'nationalPrefixOptionalWhenFormatting');

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NumberFormat clone() => NumberFormat()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NumberFormat copyWith(void Function(NumberFormat) updates) =>
      super.copyWith((message) => updates(message as NumberFormat))
          as NumberFormat;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NumberFormat create() => NumberFormat._();
  NumberFormat createEmptyInstance() => create();
  static $pb.PbList<NumberFormat> createRepeated() =>
      $pb.PbList<NumberFormat>();
  @$core.pragma('dart2js:noInline')
  static NumberFormat getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NumberFormat>(create);
  static NumberFormat? _defaultInstance;

  /// pattern is a regex that is used to match the national (significant)
  /// number. For example, the pattern "(20)(\d{4})(\d{4})" will match number
  /// "2070313000", which is the national (significant) number for Google London.
  /// Note the presence of the parentheses, which are capturing groups what
  /// specifies the grouping of numbers.
  @$pb.TagNumber(1)
  $core.String get pattern => $_getSZ(0);
  @$pb.TagNumber(1)
  set pattern($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPattern() => $_has(0);
  @$pb.TagNumber(1)
  void clearPattern() => clearField(1);

  /// format specifies how the national (significant) number matched by
  /// pattern should be formatted.
  /// Using the same example as above, format could contain "$1 $2 $3",
  /// meaning that the number should be formatted as "20 7031 3000".
  /// Each $x are replaced by the numbers captured by group x in the
  /// regex specified by pattern.
  @$pb.TagNumber(2)
  $core.String get format => $_getSZ(1);
  @$pb.TagNumber(2)
  set format($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFormat() => $_has(1);
  @$pb.TagNumber(2)
  void clearFormat() => clearField(2);

  ///  This field is a regex that is used to match a certain number of digits
  ///  at the beginning of the national (significant) number. When the match is
  ///  successful, the accompanying pattern and format should be used to format
  ///  this number. For example, if leading_digits="[1-3]|44", then all the
  ///  national numbers starting with 1, 2, 3 or 44 should be formatted using the
  ///  accompanying pattern and format.
  ///
  ///  The first leadingDigitsPattern matches up to the first three digits of the
  ///  national (significant) number; the next one matches the first four digits,
  ///  then the first five and so on, until the leadingDigitsPattern can uniquely
  ///  identify one pattern and format to be used to format the number.
  ///
  ///  In the case when only one formatting pattern exists, no
  ///  leading_digits_pattern is needed.
  @$pb.TagNumber(3)
  $core.List<$core.String> get leadingDigitsPattern => $_getList(2);

  ///  This field specifies how the national prefix ($NP) together with the first
  ///  group ($FG) in the national significant number should be formatted in
  ///  the NATIONAL format when a national prefix exists for a certain country.
  ///  For example, when this field contains "($NP$FG)", a number from Beijing,
  ///  China (whose $NP = 0), which would by default be formatted without
  ///  national prefix as 10 1234 5678 in NATIONAL format, will instead be
  ///  formatted as (010) 1234 5678; to format it as (0)10 1234 5678, the field
  ///  would contain "($NP)$FG". Note $FG should always be present in this field,
  ///  but $NP can be omitted. For example, having "$FG" could indicate the
  ///  number should be formatted in NATIONAL format without the national prefix.
  ///  This is commonly used to override the rule specified for the territory in
  ///  the XML file.
  ///
  ///  When this field is missing, a number will be formatted without national
  ///  prefix in NATIONAL format. This field does not affect how a number
  ///  is formatted in other formats, such as INTERNATIONAL.
  @$pb.TagNumber(4)
  $core.String get nationalPrefixFormattingRule => $_getSZ(3);
  @$pb.TagNumber(4)
  set nationalPrefixFormattingRule($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNationalPrefixFormattingRule() => $_has(3);
  @$pb.TagNumber(4)
  void clearNationalPrefixFormattingRule() => clearField(4);

  /// This field specifies how any carrier code ($CC) together with the first
  /// group ($FG) in the national significant number should be formatted
  /// when formatWithCarrierCode is called, if carrier codes are used for a
  /// certain country.
  @$pb.TagNumber(5)
  $core.String get domesticCarrierCodeFormattingRule => $_getSZ(4);
  @$pb.TagNumber(5)
  set domesticCarrierCodeFormattingRule($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDomesticCarrierCodeFormattingRule() => $_has(4);
  @$pb.TagNumber(5)
  void clearDomesticCarrierCodeFormattingRule() => clearField(5);

  /// This field specifies whether the $NP can be omitted when formatting a
  /// number in national format, even though it usually wouldn't be. For example,
  /// a UK number would be formatted by our library as 020 XXXX XXXX. If we have
  /// commonly seen this number written by people without the leading 0, for
  /// example as (20) XXXX XXXX, this field would be set to true. This will be
  /// inherited from the value set for the territory in the XML file, unless a
  /// national_prefix_optional_when_formatting is defined specifically for this
  /// NumberFormat.
  @$pb.TagNumber(6)
  $core.bool get nationalPrefixOptionalWhenFormatting => $_getBF(5);
  @$pb.TagNumber(6)
  set nationalPrefixOptionalWhenFormatting($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasNationalPrefixOptionalWhenFormatting() => $_has(5);
  @$pb.TagNumber(6)
  void clearNationalPrefixOptionalWhenFormatting() => clearField(6);
}

/// If you add, remove, or rename fields, or change their semantics, check if you
/// should change the excludable field sets or the behavior in MetadataFilter.
class PhoneNumberDesc extends $pb.GeneratedMessage {
  factory PhoneNumberDesc({
    $core.String? nationalNumberPattern,
    $core.String? exampleNumber,
    $core.Iterable<$core.int>? possibleLength,
    $core.Iterable<$core.int>? possibleLengthLocalOnly,
  }) {
    final $result = create();
    if (nationalNumberPattern != null) {
      $result.nationalNumberPattern = nationalNumberPattern;
    }
    if (exampleNumber != null) {
      $result.exampleNumber = exampleNumber;
    }
    if (possibleLength != null) {
      $result.possibleLength.addAll(possibleLength);
    }
    if (possibleLengthLocalOnly != null) {
      $result.possibleLengthLocalOnly.addAll(possibleLengthLocalOnly);
    }
    return $result;
  }
  PhoneNumberDesc._() : super();
  factory PhoneNumberDesc.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PhoneNumberDesc.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PhoneNumberDesc',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'i18n.phonenumbers'),
      createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'nationalNumberPattern')
    ..aOS(6, _omitFieldNames ? '' : 'exampleNumber')
    ..p<$core.int>(
        9, _omitFieldNames ? '' : 'possibleLength', $pb.PbFieldType.P3)
    ..p<$core.int>(10, _omitFieldNames ? '' : 'possibleLengthLocalOnly',
        $pb.PbFieldType.P3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PhoneNumberDesc clone() => PhoneNumberDesc()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PhoneNumberDesc copyWith(void Function(PhoneNumberDesc) updates) =>
      super.copyWith((message) => updates(message as PhoneNumberDesc))
          as PhoneNumberDesc;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PhoneNumberDesc create() => PhoneNumberDesc._();
  PhoneNumberDesc createEmptyInstance() => create();
  static $pb.PbList<PhoneNumberDesc> createRepeated() =>
      $pb.PbList<PhoneNumberDesc>();
  @$core.pragma('dart2js:noInline')
  static PhoneNumberDesc getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PhoneNumberDesc>(create);
  static PhoneNumberDesc? _defaultInstance;

  /// The national_number_pattern is the pattern that a valid national
  /// significant number would match. This specifies information such as its
  /// total length and leading digits.
  @$pb.TagNumber(2)
  $core.String get nationalNumberPattern => $_getSZ(0);
  @$pb.TagNumber(2)
  set nationalNumberPattern($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNationalNumberPattern() => $_has(0);
  @$pb.TagNumber(2)
  void clearNationalNumberPattern() => clearField(2);

  /// An example national significant number for the specific type. It should
  /// not contain any formatting information.
  @$pb.TagNumber(6)
  $core.String get exampleNumber => $_getSZ(1);
  @$pb.TagNumber(6)
  set exampleNumber($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasExampleNumber() => $_has(1);
  @$pb.TagNumber(6)
  void clearExampleNumber() => clearField(6);

  /// These represent the lengths a phone number from this region can be. They
  /// will be sorted from smallest to biggest. Note that these lengths are for
  /// the full number, without country calling code or national prefix. For
  /// example, for the Swiss number +41789270000, in local format 0789270000,
  /// this would be 9.
  /// This could be used to highlight tokens in a text that may be a phone
  /// number, or to quickly prune numbers that could not possibly be a phone
  /// number for this locale.
  @$pb.TagNumber(9)
  $core.List<$core.int> get possibleLength => $_getList(2);

  /// These represent the lengths that only local phone numbers (without an area
  /// code) from this region can be. They will be sorted from smallest to
  /// biggest. For example, since the American number 456-1234 may be locally
  /// diallable, although not diallable from outside the area, 7 could be a
  /// possible value.
  /// This could be used to highlight tokens in a text that may be a phone
  /// number.
  /// To our knowledge, area codes are usually only relevant for some fixed-line
  /// and mobile numbers, so this field should only be set for those types of
  /// numbers (and the general description) - however there are exceptions for
  /// NANPA countries.
  /// This data is used to calculate whether a number could be a possible number
  /// for a particular type.
  @$pb.TagNumber(10)
  $core.List<$core.int> get possibleLengthLocalOnly => $_getList(3);
}

/// If you add, remove, or rename fields, or change their semantics, check if you
/// should change the excludable field sets or the behavior in MetadataFilter.
class PhoneMetadata extends $pb.GeneratedMessage {
  factory PhoneMetadata({
    PhoneNumberDesc? generalDesc,
    PhoneNumberDesc? fixedLine,
    PhoneNumberDesc? mobile,
    PhoneNumberDesc? tollFree,
    PhoneNumberDesc? premiumRate,
    PhoneNumberDesc? sharedCost,
    PhoneNumberDesc? personalNumber,
    PhoneNumberDesc? voip,
    $core.String? id,
    $core.int? countryCode,
    $core.String? internationalPrefix,
    $core.String? nationalPrefix,
    $core.String? preferredExtnPrefix,
    $core.String? nationalPrefixForParsing,
    $core.String? nationalPrefixTransformRule,
    $core.String? preferredInternationalPrefix,
    $core.bool? sameMobileAndFixedLinePattern,
    $core.Iterable<NumberFormat>? numberFormat,
    $core.Iterable<NumberFormat>? intlNumberFormat,
    PhoneNumberDesc? pager,
    $core.bool? mainCountryForCode,
    $core.String? leadingDigits,
    PhoneNumberDesc? noInternationalDialling,
    PhoneNumberDesc? uan,
    PhoneNumberDesc? emergency,
    PhoneNumberDesc? voicemail,
    PhoneNumberDesc? shortCode,
    PhoneNumberDesc? standardRate,
    PhoneNumberDesc? carrierSpecific,
    $core.bool? mobileNumberPortableRegion,
    PhoneNumberDesc? smsServices,
  }) {
    final $result = create();
    if (generalDesc != null) {
      $result.generalDesc = generalDesc;
    }
    if (fixedLine != null) {
      $result.fixedLine = fixedLine;
    }
    if (mobile != null) {
      $result.mobile = mobile;
    }
    if (tollFree != null) {
      $result.tollFree = tollFree;
    }
    if (premiumRate != null) {
      $result.premiumRate = premiumRate;
    }
    if (sharedCost != null) {
      $result.sharedCost = sharedCost;
    }
    if (personalNumber != null) {
      $result.personalNumber = personalNumber;
    }
    if (voip != null) {
      $result.voip = voip;
    }
    if (id != null) {
      $result.id = id;
    }
    if (countryCode != null) {
      $result.countryCode = countryCode;
    }
    if (internationalPrefix != null) {
      $result.internationalPrefix = internationalPrefix;
    }
    if (nationalPrefix != null) {
      $result.nationalPrefix = nationalPrefix;
    }
    if (preferredExtnPrefix != null) {
      $result.preferredExtnPrefix = preferredExtnPrefix;
    }
    if (nationalPrefixForParsing != null) {
      $result.nationalPrefixForParsing = nationalPrefixForParsing;
    }
    if (nationalPrefixTransformRule != null) {
      $result.nationalPrefixTransformRule = nationalPrefixTransformRule;
    }
    if (preferredInternationalPrefix != null) {
      $result.preferredInternationalPrefix = preferredInternationalPrefix;
    }
    if (sameMobileAndFixedLinePattern != null) {
      $result.sameMobileAndFixedLinePattern = sameMobileAndFixedLinePattern;
    }
    if (numberFormat != null) {
      $result.numberFormat.addAll(numberFormat);
    }
    if (intlNumberFormat != null) {
      $result.intlNumberFormat.addAll(intlNumberFormat);
    }
    if (pager != null) {
      $result.pager = pager;
    }
    if (mainCountryForCode != null) {
      $result.mainCountryForCode = mainCountryForCode;
    }
    if (leadingDigits != null) {
      $result.leadingDigits = leadingDigits;
    }
    if (noInternationalDialling != null) {
      $result.noInternationalDialling = noInternationalDialling;
    }
    if (uan != null) {
      $result.uan = uan;
    }
    if (emergency != null) {
      $result.emergency = emergency;
    }
    if (voicemail != null) {
      $result.voicemail = voicemail;
    }
    if (shortCode != null) {
      $result.shortCode = shortCode;
    }
    if (standardRate != null) {
      $result.standardRate = standardRate;
    }
    if (carrierSpecific != null) {
      $result.carrierSpecific = carrierSpecific;
    }
    if (mobileNumberPortableRegion != null) {
      $result.mobileNumberPortableRegion = mobileNumberPortableRegion;
    }
    if (smsServices != null) {
      $result.smsServices = smsServices;
    }
    return $result;
  }
  PhoneMetadata._() : super();
  factory PhoneMetadata.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PhoneMetadata.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PhoneMetadata',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'i18n.phonenumbers'),
      createEmptyInstance: create)
    ..aOM<PhoneNumberDesc>(1, _omitFieldNames ? '' : 'generalDesc',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(2, _omitFieldNames ? '' : 'fixedLine',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(3, _omitFieldNames ? '' : 'mobile',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(4, _omitFieldNames ? '' : 'tollFree',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(5, _omitFieldNames ? '' : 'premiumRate',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(6, _omitFieldNames ? '' : 'sharedCost',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(7, _omitFieldNames ? '' : 'personalNumber',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(8, _omitFieldNames ? '' : 'voip',
        subBuilder: PhoneNumberDesc.create)
    ..aQS(9, _omitFieldNames ? '' : 'id')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'countryCode', $pb.PbFieldType.O3)
    ..aOS(11, _omitFieldNames ? '' : 'internationalPrefix')
    ..aOS(12, _omitFieldNames ? '' : 'nationalPrefix')
    ..aOS(13, _omitFieldNames ? '' : 'preferredExtnPrefix')
    ..aOS(15, _omitFieldNames ? '' : 'nationalPrefixForParsing')
    ..aOS(16, _omitFieldNames ? '' : 'nationalPrefixTransformRule')
    ..aOS(17, _omitFieldNames ? '' : 'preferredInternationalPrefix')
    ..aOB(18, _omitFieldNames ? '' : 'sameMobileAndFixedLinePattern')
    ..pc<NumberFormat>(
        19, _omitFieldNames ? '' : 'numberFormat', $pb.PbFieldType.PM,
        subBuilder: NumberFormat.create)
    ..pc<NumberFormat>(
        20, _omitFieldNames ? '' : 'intlNumberFormat', $pb.PbFieldType.PM,
        subBuilder: NumberFormat.create)
    ..aOM<PhoneNumberDesc>(21, _omitFieldNames ? '' : 'pager',
        subBuilder: PhoneNumberDesc.create)
    ..aOB(22, _omitFieldNames ? '' : 'mainCountryForCode')
    ..aOS(23, _omitFieldNames ? '' : 'leadingDigits')
    ..aOM<PhoneNumberDesc>(24, _omitFieldNames ? '' : 'noInternationalDialling',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(25, _omitFieldNames ? '' : 'uan',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(27, _omitFieldNames ? '' : 'emergency',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(28, _omitFieldNames ? '' : 'voicemail',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(29, _omitFieldNames ? '' : 'shortCode',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(30, _omitFieldNames ? '' : 'standardRate',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(31, _omitFieldNames ? '' : 'carrierSpecific',
        subBuilder: PhoneNumberDesc.create)
    ..aOB(32, _omitFieldNames ? '' : 'mobileNumberPortableRegion')
    ..aOM<PhoneNumberDesc>(33, _omitFieldNames ? '' : 'smsServices',
        subBuilder: PhoneNumberDesc.create);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PhoneMetadata clone() => PhoneMetadata()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PhoneMetadata copyWith(void Function(PhoneMetadata) updates) =>
      super.copyWith((message) => updates(message as PhoneMetadata))
          as PhoneMetadata;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PhoneMetadata create() => PhoneMetadata._();
  PhoneMetadata createEmptyInstance() => create();
  static $pb.PbList<PhoneMetadata> createRepeated() =>
      $pb.PbList<PhoneMetadata>();
  @$core.pragma('dart2js:noInline')
  static PhoneMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PhoneMetadata>(create);
  static PhoneMetadata? _defaultInstance;

  /// The general_desc contains information which is a superset of descriptions
  /// for all types of phone numbers. If any element is missing in the
  /// description of a specific type in the XML file, the element will inherit
  /// from its counterpart in the general_desc. For all types that are generally
  /// relevant to normal phone numbers, if the whole type is missing in the
  /// PhoneNumberMetadata XML file, it will not have national number data, and
  /// the possible lengths will be [-1].
  @$pb.TagNumber(1)
  PhoneNumberDesc get generalDesc => $_getN(0);
  @$pb.TagNumber(1)
  set generalDesc(PhoneNumberDesc v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGeneralDesc() => $_has(0);
  @$pb.TagNumber(1)
  void clearGeneralDesc() => clearField(1);
  @$pb.TagNumber(1)
  PhoneNumberDesc ensureGeneralDesc() => $_ensure(0);

  @$pb.TagNumber(2)
  PhoneNumberDesc get fixedLine => $_getN(1);
  @$pb.TagNumber(2)
  set fixedLine(PhoneNumberDesc v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFixedLine() => $_has(1);
  @$pb.TagNumber(2)
  void clearFixedLine() => clearField(2);
  @$pb.TagNumber(2)
  PhoneNumberDesc ensureFixedLine() => $_ensure(1);

  @$pb.TagNumber(3)
  PhoneNumberDesc get mobile => $_getN(2);
  @$pb.TagNumber(3)
  set mobile(PhoneNumberDesc v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMobile() => $_has(2);
  @$pb.TagNumber(3)
  void clearMobile() => clearField(3);
  @$pb.TagNumber(3)
  PhoneNumberDesc ensureMobile() => $_ensure(2);

  @$pb.TagNumber(4)
  PhoneNumberDesc get tollFree => $_getN(3);
  @$pb.TagNumber(4)
  set tollFree(PhoneNumberDesc v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTollFree() => $_has(3);
  @$pb.TagNumber(4)
  void clearTollFree() => clearField(4);
  @$pb.TagNumber(4)
  PhoneNumberDesc ensureTollFree() => $_ensure(3);

  @$pb.TagNumber(5)
  PhoneNumberDesc get premiumRate => $_getN(4);
  @$pb.TagNumber(5)
  set premiumRate(PhoneNumberDesc v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPremiumRate() => $_has(4);
  @$pb.TagNumber(5)
  void clearPremiumRate() => clearField(5);
  @$pb.TagNumber(5)
  PhoneNumberDesc ensurePremiumRate() => $_ensure(4);

  @$pb.TagNumber(6)
  PhoneNumberDesc get sharedCost => $_getN(5);
  @$pb.TagNumber(6)
  set sharedCost(PhoneNumberDesc v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSharedCost() => $_has(5);
  @$pb.TagNumber(6)
  void clearSharedCost() => clearField(6);
  @$pb.TagNumber(6)
  PhoneNumberDesc ensureSharedCost() => $_ensure(5);

  @$pb.TagNumber(7)
  PhoneNumberDesc get personalNumber => $_getN(6);
  @$pb.TagNumber(7)
  set personalNumber(PhoneNumberDesc v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPersonalNumber() => $_has(6);
  @$pb.TagNumber(7)
  void clearPersonalNumber() => clearField(7);
  @$pb.TagNumber(7)
  PhoneNumberDesc ensurePersonalNumber() => $_ensure(6);

  @$pb.TagNumber(8)
  PhoneNumberDesc get voip => $_getN(7);
  @$pb.TagNumber(8)
  set voip(PhoneNumberDesc v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasVoip() => $_has(7);
  @$pb.TagNumber(8)
  void clearVoip() => clearField(8);
  @$pb.TagNumber(8)
  PhoneNumberDesc ensureVoip() => $_ensure(7);

  /// The CLDR 2-letter representation of a country/region, with the exception of
  /// "country calling codes" used for non-geographical entities, such as
  /// Universal International Toll Free Number (+800). These are all given the ID
  /// "001", since this is the numeric region code for the world according to UN
  /// M.49: http://en.wikipedia.org/wiki/UN_M.49
  @$pb.TagNumber(9)
  $core.String get id => $_getSZ(8);
  @$pb.TagNumber(9)
  set id($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasId() => $_has(8);
  @$pb.TagNumber(9)
  void clearId() => clearField(9);

  /// The country calling code that one would dial from overseas when trying to
  /// dial a phone number in this country. For example, this would be "64" for
  /// New Zealand.
  @$pb.TagNumber(10)
  $core.int get countryCode => $_getIZ(9);
  @$pb.TagNumber(10)
  set countryCode($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasCountryCode() => $_has(9);
  @$pb.TagNumber(10)
  void clearCountryCode() => clearField(10);

  /// The international_prefix of country A is the number that needs to be
  /// dialled from country A to another country (country B). This is followed
  /// by the country code for country B. Note that some countries may have more
  /// than one international prefix, and for those cases, a regular expression
  /// matching the international prefixes will be stored in this field.
  @$pb.TagNumber(11)
  $core.String get internationalPrefix => $_getSZ(10);
  @$pb.TagNumber(11)
  set internationalPrefix($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasInternationalPrefix() => $_has(10);
  @$pb.TagNumber(11)
  void clearInternationalPrefix() => clearField(11);

  /// The national prefix of country A is the number that needs to be dialled
  /// before the national significant number when dialling internally. This
  /// would not be dialled when dialling internationally. For example, in New
  /// Zealand, the number that would be locally dialled as 09 345 3456 would be
  /// dialled from overseas as +64 9 345 3456. In this case, 0 is the national
  /// prefix.
  @$pb.TagNumber(12)
  $core.String get nationalPrefix => $_getSZ(11);
  @$pb.TagNumber(12)
  set nationalPrefix($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasNationalPrefix() => $_has(11);
  @$pb.TagNumber(12)
  void clearNationalPrefix() => clearField(12);

  /// The preferred prefix when specifying an extension in this country. This is
  /// used for formatting only, and if this is not specified, a suitable default
  /// should be used instead. For example, if you wanted extensions to be
  /// formatted in the following way:
  /// 1 (365) 345 445 ext. 2345
  /// " ext. "  should be the preferred extension prefix.
  @$pb.TagNumber(13)
  $core.String get preferredExtnPrefix => $_getSZ(12);
  @$pb.TagNumber(13)
  set preferredExtnPrefix($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasPreferredExtnPrefix() => $_has(12);
  @$pb.TagNumber(13)
  void clearPreferredExtnPrefix() => clearField(13);

  ///  This field is used for cases where the national prefix of a country
  ///  contains a carrier selection code, and is written in the form of a
  ///  regular expression. For example, to dial the number 2222-2222 in
  ///  Fortaleza, Brazil (area code 85) using the long distance carrier Oi
  ///  (selection code 31), one would dial 0 31 85 2222 2222. Assuming the
  ///  only other possible carrier selection code is 32, the field will
  ///  contain "03[12]".
  ///
  ///  When it is missing from the XML file, this field inherits the value of
  ///  national_prefix, if that is present.
  @$pb.TagNumber(15)
  $core.String get nationalPrefixForParsing => $_getSZ(13);
  @$pb.TagNumber(15)
  set nationalPrefixForParsing($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasNationalPrefixForParsing() => $_has(13);
  @$pb.TagNumber(15)
  void clearNationalPrefixForParsing() => clearField(15);

  /// This field is only populated and used under very rare situations.
  /// For example, mobile numbers in Argentina are written in two completely
  /// different ways when dialed in-country and out-of-country
  /// (e.g. 0343 15 555 1212 is exactly the same number as +54 9 343 555 1212).
  /// This field is used together with national_prefix_for_parsing to transform
  /// the number into a particular representation for storing in the phonenumber
  /// proto buffer in those rare cases.
  @$pb.TagNumber(16)
  $core.String get nationalPrefixTransformRule => $_getSZ(14);
  @$pb.TagNumber(16)
  set nationalPrefixTransformRule($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasNationalPrefixTransformRule() => $_has(14);
  @$pb.TagNumber(16)
  void clearNationalPrefixTransformRule() => clearField(16);

  /// If the international prefix that we want to use when formatting the number
  /// for out-of-country dialling contains non-digit symbols, or there is more
  /// than one international prefix is present, a preferred prefix can be
  /// specified here for out-of-country formatting purposes. If this field is
  /// not present, and multiple international prefixes are present, then "+"
  /// will be used instead.
  @$pb.TagNumber(17)
  $core.String get preferredInternationalPrefix => $_getSZ(15);
  @$pb.TagNumber(17)
  set preferredInternationalPrefix($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasPreferredInternationalPrefix() => $_has(15);
  @$pb.TagNumber(17)
  void clearPreferredInternationalPrefix() => clearField(17);

  /// Specifies whether the mobile and fixed-line patterns are the same or not.
  /// This is used to speed up determining phone number type in countries where
  /// these two types of phone numbers can never be distinguished.
  @$pb.TagNumber(18)
  $core.bool get sameMobileAndFixedLinePattern => $_getBF(16);
  @$pb.TagNumber(18)
  set sameMobileAndFixedLinePattern($core.bool v) {
    $_setBool(16, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasSameMobileAndFixedLinePattern() => $_has(16);
  @$pb.TagNumber(18)
  void clearSameMobileAndFixedLinePattern() => clearField(18);

  /// Note that the number format here is used for formatting only, not parsing.
  /// Hence all the varied ways a user *may* write a number need not be recorded
  /// - just the ideal way we would like to format it for them. When this element
  /// is absent, the national significant number will be formatted as a whole
  /// without any formatting applied.
  @$pb.TagNumber(19)
  $core.List<NumberFormat> get numberFormat => $_getList(17);

  ///  This field is populated only when the national significant number is
  ///  formatted differently when it forms part of the INTERNATIONAL format
  ///  and NATIONAL format. A case in point is mobile numbers in Argentina:
  ///  The number, which would be written in INTERNATIONAL format as
  ///  +54 9 343 555 1212, will be written as 0343 15 555 1212 for NATIONAL
  ///  format. In this case, the prefix 9 is inserted when dialling from
  ///  overseas, but otherwise the prefix 0 and the carrier selection code
  ///  15 (inserted after the area code of 343) is used.
  ///  Note: this field is populated by setting a value for <intlFormat> inside
  ///  the <numberFormat> tag in the XML file. If <intlFormat> is not set then it
  ///  defaults to the same value as the <format> tag.
  ///
  ///  Examples:
  ///    To set the <intlFormat> to a different value than the <format>:
  ///      <numberFormat pattern=....>
  ///        <format>$1 $2 $3</format>
  ///        <intlFormat>$1-$2-$3</intlFormat>
  ///      </numberFormat>
  ///
  ///    To have a format only used for national formatting, set <intlFormat> to
  ///    "NA":
  ///      <numberFormat pattern=....>
  ///        <format>$1 $2 $3</format>
  ///        <intlFormat>NA</intlFormat>
  ///      </numberFormat>
  @$pb.TagNumber(20)
  $core.List<NumberFormat> get intlNumberFormat => $_getList(18);

  @$pb.TagNumber(21)
  PhoneNumberDesc get pager => $_getN(19);
  @$pb.TagNumber(21)
  set pager(PhoneNumberDesc v) {
    setField(21, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasPager() => $_has(19);
  @$pb.TagNumber(21)
  void clearPager() => clearField(21);
  @$pb.TagNumber(21)
  PhoneNumberDesc ensurePager() => $_ensure(19);

  /// This field is set when this country is considered to be the main country
  /// for a calling code. It may not be set by more than one country with the
  /// same calling code, and it should not be set by countries with a unique
  /// calling code. This can be used to indicate that "GB" is the main country
  /// for the calling code "44" for example, rather than Jersey or the Isle of
  /// Man.
  @$pb.TagNumber(22)
  $core.bool get mainCountryForCode => $_getBF(20);
  @$pb.TagNumber(22)
  set mainCountryForCode($core.bool v) {
    $_setBool(20, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasMainCountryForCode() => $_has(20);
  @$pb.TagNumber(22)
  void clearMainCountryForCode() => clearField(22);

  /// This field is populated only for countries or regions that share a country
  /// calling code. If a number matches this pattern, it could belong to this
  /// region. This is not intended as a replacement for IsValidForRegion since a
  /// matching prefix is insufficient for a number to be valid. Furthermore, it
  /// does not contain all the prefixes valid for a region - for example, 800
  /// numbers are valid for all NANPA countries and are hence not listed here.
  /// This field should be a regular expression of the expected prefix match.
  /// It is used merely as a short-cut for working out which region a number
  /// comes from in the case that there is only one, so leading_digit prefixes
  /// should not overlap.
  @$pb.TagNumber(23)
  $core.String get leadingDigits => $_getSZ(21);
  @$pb.TagNumber(23)
  set leadingDigits($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasLeadingDigits() => $_has(21);
  @$pb.TagNumber(23)
  void clearLeadingDigits() => clearField(23);

  /// The rules here distinguish the numbers that are only able to be dialled
  /// nationally.
  @$pb.TagNumber(24)
  PhoneNumberDesc get noInternationalDialling => $_getN(22);
  @$pb.TagNumber(24)
  set noInternationalDialling(PhoneNumberDesc v) {
    setField(24, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasNoInternationalDialling() => $_has(22);
  @$pb.TagNumber(24)
  void clearNoInternationalDialling() => clearField(24);
  @$pb.TagNumber(24)
  PhoneNumberDesc ensureNoInternationalDialling() => $_ensure(22);

  @$pb.TagNumber(25)
  PhoneNumberDesc get uan => $_getN(23);
  @$pb.TagNumber(25)
  set uan(PhoneNumberDesc v) {
    setField(25, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasUan() => $_has(23);
  @$pb.TagNumber(25)
  void clearUan() => clearField(25);
  @$pb.TagNumber(25)
  PhoneNumberDesc ensureUan() => $_ensure(23);

  @$pb.TagNumber(27)
  PhoneNumberDesc get emergency => $_getN(24);
  @$pb.TagNumber(27)
  set emergency(PhoneNumberDesc v) {
    setField(27, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasEmergency() => $_has(24);
  @$pb.TagNumber(27)
  void clearEmergency() => clearField(27);
  @$pb.TagNumber(27)
  PhoneNumberDesc ensureEmergency() => $_ensure(24);

  @$pb.TagNumber(28)
  PhoneNumberDesc get voicemail => $_getN(25);
  @$pb.TagNumber(28)
  set voicemail(PhoneNumberDesc v) {
    setField(28, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasVoicemail() => $_has(25);
  @$pb.TagNumber(28)
  void clearVoicemail() => clearField(28);
  @$pb.TagNumber(28)
  PhoneNumberDesc ensureVoicemail() => $_ensure(25);

  @$pb.TagNumber(29)
  PhoneNumberDesc get shortCode => $_getN(26);
  @$pb.TagNumber(29)
  set shortCode(PhoneNumberDesc v) {
    setField(29, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasShortCode() => $_has(26);
  @$pb.TagNumber(29)
  void clearShortCode() => clearField(29);
  @$pb.TagNumber(29)
  PhoneNumberDesc ensureShortCode() => $_ensure(26);

  @$pb.TagNumber(30)
  PhoneNumberDesc get standardRate => $_getN(27);
  @$pb.TagNumber(30)
  set standardRate(PhoneNumberDesc v) {
    setField(30, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasStandardRate() => $_has(27);
  @$pb.TagNumber(30)
  void clearStandardRate() => clearField(30);
  @$pb.TagNumber(30)
  PhoneNumberDesc ensureStandardRate() => $_ensure(27);

  @$pb.TagNumber(31)
  PhoneNumberDesc get carrierSpecific => $_getN(28);
  @$pb.TagNumber(31)
  set carrierSpecific(PhoneNumberDesc v) {
    setField(31, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasCarrierSpecific() => $_has(28);
  @$pb.TagNumber(31)
  void clearCarrierSpecific() => clearField(31);
  @$pb.TagNumber(31)
  PhoneNumberDesc ensureCarrierSpecific() => $_ensure(28);

  /// This field is set when this country has implemented mobile number
  /// portability. This means that transferring mobile numbers between carriers
  /// is allowed. A consequence of this is that phone prefix to carrier mapping
  /// is less reliable.
  @$pb.TagNumber(32)
  $core.bool get mobileNumberPortableRegion => $_getBF(29);
  @$pb.TagNumber(32)
  set mobileNumberPortableRegion($core.bool v) {
    $_setBool(29, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasMobileNumberPortableRegion() => $_has(29);
  @$pb.TagNumber(32)
  void clearMobileNumberPortableRegion() => clearField(32);

  @$pb.TagNumber(33)
  PhoneNumberDesc get smsServices => $_getN(30);
  @$pb.TagNumber(33)
  set smsServices(PhoneNumberDesc v) {
    setField(33, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasSmsServices() => $_has(30);
  @$pb.TagNumber(33)
  void clearSmsServices() => clearField(33);
  @$pb.TagNumber(33)
  PhoneNumberDesc ensureSmsServices() => $_ensure(30);
}

class PhoneMetadataCollection extends $pb.GeneratedMessage {
  factory PhoneMetadataCollection({
    $core.Iterable<PhoneMetadata>? metadata,
  }) {
    final $result = create();
    if (metadata != null) {
      $result.metadata.addAll(metadata);
    }
    return $result;
  }
  PhoneMetadataCollection._() : super();
  factory PhoneMetadataCollection.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PhoneMetadataCollection.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PhoneMetadataCollection',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'i18n.phonenumbers'),
      createEmptyInstance: create)
    ..pc<PhoneMetadata>(
        1, _omitFieldNames ? '' : 'metadata', $pb.PbFieldType.PM,
        subBuilder: PhoneMetadata.create);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PhoneMetadataCollection clone() =>
      PhoneMetadataCollection()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PhoneMetadataCollection copyWith(
          void Function(PhoneMetadataCollection) updates) =>
      super.copyWith((message) => updates(message as PhoneMetadataCollection))
          as PhoneMetadataCollection;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PhoneMetadataCollection create() => PhoneMetadataCollection._();
  PhoneMetadataCollection createEmptyInstance() => create();
  static $pb.PbList<PhoneMetadataCollection> createRepeated() =>
      $pb.PbList<PhoneMetadataCollection>();
  @$core.pragma('dart2js:noInline')
  static PhoneMetadataCollection getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PhoneMetadataCollection>(create);
  static PhoneMetadataCollection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PhoneMetadata> get metadata => $_getList(0);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
