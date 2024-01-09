// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;

import 'functions/anonymous_api/sayHello.dart' as _i2;
import 'functions/anonymous_api/sayHelloAuthenticated.dart' as _i3;
import 'functions/anonymous_function/sayHello.dart' as _i4;
import 'functions/anonymous_function/sayHelloAuthenticated.dart' as _i5;
import 'functions/api_auth_constant_variables/sayHello.dart' as _i6;
import 'functions/api_auth_constant_variables/sayHelloAuthenticated.dart'
    as _i7;
import 'functions/authenticated_api/sayGoodbyeAuthenticated.dart' as _i8;
import 'functions/authenticated_api/sayHelloAuthenticated.dart' as _i9;
import 'functions/authenticated_function/sayHello.dart' as _i10;
import 'functions/authenticated_function/sayHelloAuthenticated.dart' as _i11;
import 'functions/classes/asyncDefaultValues.dart' as _i12;
import 'functions/classes/asyncEmpty.dart' as _i13;
import 'functions/classes/asyncFields.dart' as _i14;
import 'functions/classes/asyncFromAndToJson.dart' as _i15;
import 'functions/classes/asyncMixedFields.dart' as _i16;
import 'functions/classes/asyncNamedFields.dart' as _i17;
import 'functions/classes/asyncNestedClass.dart' as _i18;
import 'functions/classes/asyncNonMapFromAndToJson.dart' as _i19;
import 'functions/classes/asyncNonMapToJson.dart' as _i20;
import 'functions/classes/asyncNonMapToJsonWithDefaults.dart' as _i21;
import 'functions/classes/asyncNullableFields.dart' as _i22;
import 'functions/classes/asyncOnlyFromJson.dart' as _i23;
import 'functions/classes/asyncOnlyToJson.dart' as _i24;
import 'functions/classes/asyncOnlyToJsonWithDefaults.dart' as _i25;
import 'functions/classes/defaultValues.dart' as _i26;
import 'functions/classes/empty.dart' as _i27;
import 'functions/classes/fields.dart' as _i28;
import 'functions/classes/fromAndToJson.dart' as _i29;
import 'functions/classes/mixedFields.dart' as _i30;
import 'functions/classes/namedFields.dart' as _i31;
import 'functions/classes/nestedClass.dart' as _i32;
import 'functions/classes/nonMapFromAndToJson.dart' as _i33;
import 'functions/classes/nonMapToJson.dart' as _i34;
import 'functions/classes/nonMapToJsonWithDefaults.dart' as _i35;
import 'functions/classes/nullableFields.dart' as _i36;
import 'functions/classes/onlyFromJson.dart' as _i37;
import 'functions/classes/onlyToJson.dart' as _i38;
import 'functions/classes/onlyToJsonWithDefaults.dart' as _i39;
import 'functions/exceptions/throwsCustomError.dart' as _i40;
import 'functions/exceptions/throwsCustomErrorToFromJson.dart' as _i41;
import 'functions/exceptions/throwsCustomErrorWithStackTrace.dart' as _i42;
import 'functions/exceptions/throwsCustomException.dart' as _i43;
import 'functions/exceptions/throwsCustomExceptionToFromJson.dart' as _i44;
import 'functions/exceptions/throwsError.dart' as _i45;
import 'functions/exceptions/throwsException.dart' as _i46;
import 'functions/generic_wrappers/genericWrapperParameters.dart' as _i47;
import 'functions/generic_wrappers/genericWrappers.dart' as _i48;
import 'functions/generic_wrappers/genericWrappersAsync.dart' as _i49;
import 'functions/middleware/sayHello.dart' as _i50;
import 'functions/parameter_types/complex.dart' as _i51;
import 'functions/parameter_types/simple.dart' as _i52;
import 'functions/parameter_types/simpleOptional.dart' as _i53;
import 'functions/parameters/optionalNamed.dart' as _i54;
import 'functions/parameters/optionalPositional.dart' as _i55;
import 'functions/parameters/requiredNamed.dart' as _i56;
import 'functions/parameters/requiredPositional.dart' as _i57;
import 'functions/records/aliasedMixedFields.dart' as _i58;
import 'functions/records/aliasedNamedFields.dart' as _i59;
import 'functions/records/aliasedPositionalFields.dart' as _i60;
import 'functions/records/asyncAliasedMixedFields.dart' as _i61;
import 'functions/records/asyncAliasedNamedFields.dart' as _i62;
import 'functions/records/asyncAliasedPositionalFields.dart' as _i63;
import 'functions/records/asyncMixedFields.dart' as _i64;
import 'functions/records/asyncNamedFields.dart' as _i65;
import 'functions/records/asyncNested.dart' as _i66;
import 'functions/records/asyncNonAliasedMixedFields.dart' as _i67;
import 'functions/records/asyncNonAliasedNamedFields.dart' as _i68;
import 'functions/records/asyncNonAliasedPositionalFields.dart' as _i69;
import 'functions/records/asyncNullableNested.dart' as _i70;
import 'functions/records/asyncPositionalFields.dart' as _i71;
import 'functions/records/mixedFields.dart' as _i72;
import 'functions/records/namedFields.dart' as _i73;
import 'functions/records/nested.dart' as _i74;
import 'functions/records/nonAliasedMixedFields.dart' as _i75;
import 'functions/records/nonAliasedNamedFields.dart' as _i76;
import 'functions/records/nonAliasedPositionalFields.dart' as _i77;
import 'functions/records/nullableNested.dart' as _i78;
import 'functions/records/positionalFields.dart' as _i79;
import 'functions/return_types/asyncBoolReturn.dart' as _i80;
import 'functions/return_types/asyncClassReturnNullable.dart' as _i81;
import 'functions/return_types/asyncComplexClassReturn.dart' as _i82;
import 'functions/return_types/asyncComplexStructReturn.dart' as _i83;
import 'functions/return_types/asyncComplexStructReturnNullable.dart' as _i84;
import 'functions/return_types/asyncDoubleReturn.dart' as _i85;
import 'functions/return_types/asyncIntReturn.dart' as _i86;
import 'functions/return_types/asyncIterableReturn.dart' as _i87;
import 'functions/return_types/asyncListReturn.dart' as _i88;
import 'functions/return_types/asyncMapReturn.dart' as _i89;
import 'functions/return_types/asyncOrBoolReturn.dart' as _i90;
import 'functions/return_types/asyncOrBoolReturnNullable.dart' as _i91;
import 'functions/return_types/asyncOrComplexClassReturnNullable.dart' as _i92;
import 'functions/return_types/asyncOrComplexStructReturn.dart' as _i93;
import 'functions/return_types/asyncOrComplexStructReturnNullable.dart' as _i94;
import 'functions/return_types/asyncOrDoubleReturn.dart' as _i95;
import 'functions/return_types/asyncOrDoubleReturnNullable.dart' as _i96;
import 'functions/return_types/asyncOrIntReturn.dart' as _i97;
import 'functions/return_types/asyncOrIntReturnNullable.dart' as _i98;
import 'functions/return_types/asyncOrIterableReturn.dart' as _i99;
import 'functions/return_types/asyncOrIterableReturnNullable.dart' as _i100;
import 'functions/return_types/asyncOrListReturn.dart' as _i101;
import 'functions/return_types/asyncOrListReturnNullable.dart' as _i102;
import 'functions/return_types/asyncOrMapReturn.dart' as _i103;
import 'functions/return_types/asyncOrMapReturnNullable.dart' as _i104;
import 'functions/return_types/asyncOrSimpleClassReturnNullable.dart' as _i105;
import 'functions/return_types/asyncOrStringReturn.dart' as _i106;
import 'functions/return_types/asyncOrStringReturnNullable.dart' as _i107;
import 'functions/return_types/asyncOrStructReturn.dart' as _i108;
import 'functions/return_types/asyncOrStructReturnNullable.dart' as _i109;
import 'functions/return_types/asyncOrVoidReturn.dart' as _i110;
import 'functions/return_types/asyncOrVoidReturnNullable.dart' as _i111;
import 'functions/return_types/asyncStringReturn.dart' as _i112;
import 'functions/return_types/asyncStructReturn.dart' as _i113;
import 'functions/return_types/asyncStructReturnNullable.dart' as _i114;
import 'functions/return_types/asyncVoidReturn.dart' as _i115;
import 'functions/return_types/boolReturn.dart' as _i116;
import 'functions/return_types/boolReturnNullable.dart' as _i117;
import 'functions/return_types/complexClassReturn.dart' as _i118;
import 'functions/return_types/complexClassReturnNullable.dart' as _i119;
import 'functions/return_types/complexReturn.dart' as _i120;
import 'functions/return_types/complexReturnNullable.dart' as _i121;
import 'functions/return_types/doubleReturn.dart' as _i122;
import 'functions/return_types/doubleReturnNullable.dart' as _i123;
import 'functions/return_types/intReturn.dart' as _i124;
import 'functions/return_types/intReturnNullable.dart' as _i125;
import 'functions/return_types/iterableReturn.dart' as _i126;
import 'functions/return_types/iterableReturnNullable.dart' as _i127;
import 'functions/return_types/listReturn.dart' as _i128;
import 'functions/return_types/listReturnNullable.dart' as _i129;
import 'functions/return_types/mapReturn.dart' as _i130;
import 'functions/return_types/mapReturnNullable.dart' as _i131;
import 'functions/return_types/simpleClassReturn.dart' as _i132;
import 'functions/return_types/simpleClassReturnNullable.dart' as _i133;
import 'functions/return_types/stringReturn.dart' as _i134;
import 'functions/return_types/stringReturnNullable.dart' as _i135;
import 'functions/return_types/structReturn.dart' as _i136;
import 'functions/return_types/structReturnNullable.dart' as _i137;
import 'functions/return_types/voidReturn.dart' as _i138;
import 'functions/sealed_classes/area.dart' as _i139;
import 'functions/sealed_classes/circle.dart' as _i140;
import 'functions/sealed_classes/rectangle.dart' as _i141;
import 'functions/sealed_classes/sealedClass.dart' as _i142;

void main() {
  _i1.serve(targets: {
    '/anonymous_api/sayHello': _i2.SayHelloTarget(),
    '/anonymous_api/sayHelloAuthenticated': _i3.SayHelloAuthenticatedTarget(),
    '/anonymous_function/sayHello': _i4.SayHelloTarget(),
    '/anonymous_function/sayHelloAuthenticated':
        _i5.SayHelloAuthenticatedTarget(),
    '/api_auth_constant_variables/sayHello': _i6.SayHelloTarget(),
    '/api_auth_constant_variables/sayHelloAuthenticated':
        _i7.SayHelloAuthenticatedTarget(),
    '/authenticated_api/sayGoodbyeAuthenticated':
        _i8.SayGoodbyeAuthenticatedTarget(),
    '/authenticated_api/sayHelloAuthenticated':
        _i9.SayHelloAuthenticatedTarget(),
    '/authenticated_function/sayHello': _i10.SayHelloTarget(),
    '/authenticated_function/sayHelloAuthenticated':
        _i11.SayHelloAuthenticatedTarget(),
    '/classes/asyncDefaultValues': _i12.AsyncDefaultValuesTarget(),
    '/classes/asyncEmpty': _i13.AsyncEmptyTarget(),
    '/classes/asyncFields': _i14.AsyncFieldsTarget(),
    '/classes/asyncFromAndToJson': _i15.AsyncFromAndToJsonTarget(),
    '/classes/asyncMixedFields': _i16.AsyncMixedFieldsTarget(),
    '/classes/asyncNamedFields': _i17.AsyncNamedFieldsTarget(),
    '/classes/asyncNestedClass': _i18.AsyncNestedClassTarget(),
    '/classes/asyncNonMapFromAndToJson': _i19.AsyncNonMapFromAndToJsonTarget(),
    '/classes/asyncNonMapToJson': _i20.AsyncNonMapToJsonTarget(),
    '/classes/asyncNonMapToJsonWithDefaults':
        _i21.AsyncNonMapToJsonWithDefaultsTarget(),
    '/classes/asyncNullableFields': _i22.AsyncNullableFieldsTarget(),
    '/classes/asyncOnlyFromJson': _i23.AsyncOnlyFromJsonTarget(),
    '/classes/asyncOnlyToJson': _i24.AsyncOnlyToJsonTarget(),
    '/classes/asyncOnlyToJsonWithDefaults':
        _i25.AsyncOnlyToJsonWithDefaultsTarget(),
    '/classes/defaultValues': _i26.DefaultValuesTarget(),
    '/classes/empty': _i27.EmptyTarget(),
    '/classes/fields': _i28.FieldsTarget(),
    '/classes/fromAndToJson': _i29.FromAndToJsonTarget(),
    '/classes/mixedFields': _i30.MixedFieldsTarget(),
    '/classes/namedFields': _i31.NamedFieldsTarget(),
    '/classes/nestedClass': _i32.NestedClassTarget(),
    '/classes/nonMapFromAndToJson': _i33.NonMapFromAndToJsonTarget(),
    '/classes/nonMapToJson': _i34.NonMapToJsonTarget(),
    '/classes/nonMapToJsonWithDefaults': _i35.NonMapToJsonWithDefaultsTarget(),
    '/classes/nullableFields': _i36.NullableFieldsTarget(),
    '/classes/onlyFromJson': _i37.OnlyFromJsonTarget(),
    '/classes/onlyToJson': _i38.OnlyToJsonTarget(),
    '/classes/onlyToJsonWithDefaults': _i39.OnlyToJsonWithDefaultsTarget(),
    '/exceptions/throwsCustomError': _i40.ThrowsCustomErrorTarget(),
    '/exceptions/throwsCustomErrorToFromJson':
        _i41.ThrowsCustomErrorToFromJsonTarget(),
    '/exceptions/throwsCustomErrorWithStackTrace':
        _i42.ThrowsCustomErrorWithStackTraceTarget(),
    '/exceptions/throwsCustomException': _i43.ThrowsCustomExceptionTarget(),
    '/exceptions/throwsCustomExceptionToFromJson':
        _i44.ThrowsCustomExceptionToFromJsonTarget(),
    '/exceptions/throwsError': _i45.ThrowsErrorTarget(),
    '/exceptions/throwsException': _i46.ThrowsExceptionTarget(),
    '/generic_wrappers/genericWrapperParameters':
        _i47.GenericWrapperParametersTarget(),
    '/generic_wrappers/genericWrappers': _i48.GenericWrappersTarget(),
    '/generic_wrappers/genericWrappersAsync': _i49.GenericWrappersAsyncTarget(),
    '/middleware/sayHello': _i50.SayHelloTarget(),
    '/parameter_types/complex': _i51.ComplexTarget(),
    '/parameter_types/simple': _i52.SimpleTarget(),
    '/parameter_types/simpleOptional': _i53.SimpleOptionalTarget(),
    '/parameters/optionalNamed': _i54.OptionalNamedTarget(),
    '/parameters/optionalPositional': _i55.OptionalPositionalTarget(),
    '/parameters/requiredNamed': _i56.RequiredNamedTarget(),
    '/parameters/requiredPositional': _i57.RequiredPositionalTarget(),
    '/records/aliasedMixedFields': _i58.AliasedMixedFieldsTarget(),
    '/records/aliasedNamedFields': _i59.AliasedNamedFieldsTarget(),
    '/records/aliasedPositionalFields': _i60.AliasedPositionalFieldsTarget(),
    '/records/asyncAliasedMixedFields': _i61.AsyncAliasedMixedFieldsTarget(),
    '/records/asyncAliasedNamedFields': _i62.AsyncAliasedNamedFieldsTarget(),
    '/records/asyncAliasedPositionalFields':
        _i63.AsyncAliasedPositionalFieldsTarget(),
    '/records/asyncMixedFields': _i64.AsyncMixedFieldsTarget(),
    '/records/asyncNamedFields': _i65.AsyncNamedFieldsTarget(),
    '/records/asyncNested': _i66.AsyncNestedTarget(),
    '/records/asyncNonAliasedMixedFields':
        _i67.AsyncNonAliasedMixedFieldsTarget(),
    '/records/asyncNonAliasedNamedFields':
        _i68.AsyncNonAliasedNamedFieldsTarget(),
    '/records/asyncNonAliasedPositionalFields':
        _i69.AsyncNonAliasedPositionalFieldsTarget(),
    '/records/asyncNullableNested': _i70.AsyncNullableNestedTarget(),
    '/records/asyncPositionalFields': _i71.AsyncPositionalFieldsTarget(),
    '/records/mixedFields': _i72.MixedFieldsTarget(),
    '/records/namedFields': _i73.NamedFieldsTarget(),
    '/records/nested': _i74.NestedTarget(),
    '/records/nonAliasedMixedFields': _i75.NonAliasedMixedFieldsTarget(),
    '/records/nonAliasedNamedFields': _i76.NonAliasedNamedFieldsTarget(),
    '/records/nonAliasedPositionalFields':
        _i77.NonAliasedPositionalFieldsTarget(),
    '/records/nullableNested': _i78.NullableNestedTarget(),
    '/records/positionalFields': _i79.PositionalFieldsTarget(),
    '/return_types/asyncBoolReturn': _i80.AsyncBoolReturnTarget(),
    '/return_types/asyncClassReturnNullable':
        _i81.AsyncClassReturnNullableTarget(),
    '/return_types/asyncComplexClassReturn':
        _i82.AsyncComplexClassReturnTarget(),
    '/return_types/asyncComplexStructReturn':
        _i83.AsyncComplexStructReturnTarget(),
    '/return_types/asyncComplexStructReturnNullable':
        _i84.AsyncComplexStructReturnNullableTarget(),
    '/return_types/asyncDoubleReturn': _i85.AsyncDoubleReturnTarget(),
    '/return_types/asyncIntReturn': _i86.AsyncIntReturnTarget(),
    '/return_types/asyncIterableReturn': _i87.AsyncIterableReturnTarget(),
    '/return_types/asyncListReturn': _i88.AsyncListReturnTarget(),
    '/return_types/asyncMapReturn': _i89.AsyncMapReturnTarget(),
    '/return_types/asyncOrBoolReturn': _i90.AsyncOrBoolReturnTarget(),
    '/return_types/asyncOrBoolReturnNullable':
        _i91.AsyncOrBoolReturnNullableTarget(),
    '/return_types/asyncOrComplexClassReturnNullable':
        _i92.AsyncOrComplexClassReturnNullableTarget(),
    '/return_types/asyncOrComplexStructReturn':
        _i93.AsyncOrComplexStructReturnTarget(),
    '/return_types/asyncOrComplexStructReturnNullable':
        _i94.AsyncOrComplexStructReturnNullableTarget(),
    '/return_types/asyncOrDoubleReturn': _i95.AsyncOrDoubleReturnTarget(),
    '/return_types/asyncOrDoubleReturnNullable':
        _i96.AsyncOrDoubleReturnNullableTarget(),
    '/return_types/asyncOrIntReturn': _i97.AsyncOrIntReturnTarget(),
    '/return_types/asyncOrIntReturnNullable':
        _i98.AsyncOrIntReturnNullableTarget(),
    '/return_types/asyncOrIterableReturn': _i99.AsyncOrIterableReturnTarget(),
    '/return_types/asyncOrIterableReturnNullable':
        _i100.AsyncOrIterableReturnNullableTarget(),
    '/return_types/asyncOrListReturn': _i101.AsyncOrListReturnTarget(),
    '/return_types/asyncOrListReturnNullable':
        _i102.AsyncOrListReturnNullableTarget(),
    '/return_types/asyncOrMapReturn': _i103.AsyncOrMapReturnTarget(),
    '/return_types/asyncOrMapReturnNullable':
        _i104.AsyncOrMapReturnNullableTarget(),
    '/return_types/asyncOrSimpleClassReturnNullable':
        _i105.AsyncOrSimpleClassReturnNullableTarget(),
    '/return_types/asyncOrStringReturn': _i106.AsyncOrStringReturnTarget(),
    '/return_types/asyncOrStringReturnNullable':
        _i107.AsyncOrStringReturnNullableTarget(),
    '/return_types/asyncOrStructReturn': _i108.AsyncOrStructReturnTarget(),
    '/return_types/asyncOrStructReturnNullable':
        _i109.AsyncOrStructReturnNullableTarget(),
    '/return_types/asyncOrVoidReturn': _i110.AsyncOrVoidReturnTarget(),
    '/return_types/asyncOrVoidReturnNullable':
        _i111.AsyncOrVoidReturnNullableTarget(),
    '/return_types/asyncStringReturn': _i112.AsyncStringReturnTarget(),
    '/return_types/asyncStructReturn': _i113.AsyncStructReturnTarget(),
    '/return_types/asyncStructReturnNullable':
        _i114.AsyncStructReturnNullableTarget(),
    '/return_types/asyncVoidReturn': _i115.AsyncVoidReturnTarget(),
    '/return_types/boolReturn': _i116.BoolReturnTarget(),
    '/return_types/boolReturnNullable': _i117.BoolReturnNullableTarget(),
    '/return_types/complexClassReturn': _i118.ComplexClassReturnTarget(),
    '/return_types/complexClassReturnNullable':
        _i119.ComplexClassReturnNullableTarget(),
    '/return_types/complexReturn': _i120.ComplexReturnTarget(),
    '/return_types/complexReturnNullable': _i121.ComplexReturnNullableTarget(),
    '/return_types/doubleReturn': _i122.DoubleReturnTarget(),
    '/return_types/doubleReturnNullable': _i123.DoubleReturnNullableTarget(),
    '/return_types/intReturn': _i124.IntReturnTarget(),
    '/return_types/intReturnNullable': _i125.IntReturnNullableTarget(),
    '/return_types/iterableReturn': _i126.IterableReturnTarget(),
    '/return_types/iterableReturnNullable':
        _i127.IterableReturnNullableTarget(),
    '/return_types/listReturn': _i128.ListReturnTarget(),
    '/return_types/listReturnNullable': _i129.ListReturnNullableTarget(),
    '/return_types/mapReturn': _i130.MapReturnTarget(),
    '/return_types/mapReturnNullable': _i131.MapReturnNullableTarget(),
    '/return_types/simpleClassReturn': _i132.SimpleClassReturnTarget(),
    '/return_types/simpleClassReturnNullable':
        _i133.SimpleClassReturnNullableTarget(),
    '/return_types/stringReturn': _i134.StringReturnTarget(),
    '/return_types/stringReturnNullable': _i135.StringReturnNullableTarget(),
    '/return_types/structReturn': _i136.StructReturnTarget(),
    '/return_types/structReturnNullable': _i137.StructReturnNullableTarget(),
    '/return_types/voidReturn': _i138.VoidReturnTarget(),
    '/sealed_classes/area': _i139.AreaTarget(),
    '/sealed_classes/circle': _i140.CircleTarget(),
    '/sealed_classes/rectangle': _i141.RectangleTarget(),
    '/sealed_classes/sealedClass': _i142.SealedClassTarget(),
  });
}
