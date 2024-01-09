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
import 'functions/records/aliasedNamedFields.dart' as _i58;
import 'functions/records/asyncAliasedNamedFields.dart' as _i59;
import 'functions/records/asyncNamedFields.dart' as _i60;
import 'functions/records/asyncNested.dart' as _i61;
import 'functions/records/asyncNonAliasedNamedFields.dart' as _i62;
import 'functions/records/asyncNullableNested.dart' as _i63;
import 'functions/records/namedFields.dart' as _i64;
import 'functions/records/nested.dart' as _i65;
import 'functions/records/nonAliasedNamedFields.dart' as _i66;
import 'functions/records/nullableNested.dart' as _i67;
import 'functions/return_types/asyncBoolReturn.dart' as _i68;
import 'functions/return_types/asyncClassReturnNullable.dart' as _i69;
import 'functions/return_types/asyncComplexClassReturn.dart' as _i70;
import 'functions/return_types/asyncComplexStructReturn.dart' as _i71;
import 'functions/return_types/asyncComplexStructReturnNullable.dart' as _i72;
import 'functions/return_types/asyncDoubleReturn.dart' as _i73;
import 'functions/return_types/asyncIntReturn.dart' as _i74;
import 'functions/return_types/asyncIterableReturn.dart' as _i75;
import 'functions/return_types/asyncListReturn.dart' as _i76;
import 'functions/return_types/asyncMapReturn.dart' as _i77;
import 'functions/return_types/asyncOrBoolReturn.dart' as _i78;
import 'functions/return_types/asyncOrBoolReturnNullable.dart' as _i79;
import 'functions/return_types/asyncOrComplexClassReturnNullable.dart' as _i80;
import 'functions/return_types/asyncOrComplexStructReturn.dart' as _i81;
import 'functions/return_types/asyncOrComplexStructReturnNullable.dart' as _i82;
import 'functions/return_types/asyncOrDoubleReturn.dart' as _i83;
import 'functions/return_types/asyncOrDoubleReturnNullable.dart' as _i84;
import 'functions/return_types/asyncOrIntReturn.dart' as _i85;
import 'functions/return_types/asyncOrIntReturnNullable.dart' as _i86;
import 'functions/return_types/asyncOrIterableReturn.dart' as _i87;
import 'functions/return_types/asyncOrIterableReturnNullable.dart' as _i88;
import 'functions/return_types/asyncOrListReturn.dart' as _i89;
import 'functions/return_types/asyncOrListReturnNullable.dart' as _i90;
import 'functions/return_types/asyncOrMapReturn.dart' as _i91;
import 'functions/return_types/asyncOrMapReturnNullable.dart' as _i92;
import 'functions/return_types/asyncOrSimpleClassReturnNullable.dart' as _i93;
import 'functions/return_types/asyncOrStringReturn.dart' as _i94;
import 'functions/return_types/asyncOrStringReturnNullable.dart' as _i95;
import 'functions/return_types/asyncOrStructReturn.dart' as _i96;
import 'functions/return_types/asyncOrStructReturnNullable.dart' as _i97;
import 'functions/return_types/asyncOrVoidReturn.dart' as _i98;
import 'functions/return_types/asyncOrVoidReturnNullable.dart' as _i99;
import 'functions/return_types/asyncStringReturn.dart' as _i100;
import 'functions/return_types/asyncStructReturn.dart' as _i101;
import 'functions/return_types/asyncStructReturnNullable.dart' as _i102;
import 'functions/return_types/asyncVoidReturn.dart' as _i103;
import 'functions/return_types/boolReturn.dart' as _i104;
import 'functions/return_types/boolReturnNullable.dart' as _i105;
import 'functions/return_types/complexClassReturn.dart' as _i106;
import 'functions/return_types/complexClassReturnNullable.dart' as _i107;
import 'functions/return_types/complexReturn.dart' as _i108;
import 'functions/return_types/complexReturnNullable.dart' as _i109;
import 'functions/return_types/doubleReturn.dart' as _i110;
import 'functions/return_types/doubleReturnNullable.dart' as _i111;
import 'functions/return_types/intReturn.dart' as _i112;
import 'functions/return_types/intReturnNullable.dart' as _i113;
import 'functions/return_types/iterableReturn.dart' as _i114;
import 'functions/return_types/iterableReturnNullable.dart' as _i115;
import 'functions/return_types/listReturn.dart' as _i116;
import 'functions/return_types/listReturnNullable.dart' as _i117;
import 'functions/return_types/mapReturn.dart' as _i118;
import 'functions/return_types/mapReturnNullable.dart' as _i119;
import 'functions/return_types/simpleClassReturn.dart' as _i120;
import 'functions/return_types/simpleClassReturnNullable.dart' as _i121;
import 'functions/return_types/stringReturn.dart' as _i122;
import 'functions/return_types/stringReturnNullable.dart' as _i123;
import 'functions/return_types/structReturn.dart' as _i124;
import 'functions/return_types/structReturnNullable.dart' as _i125;
import 'functions/return_types/voidReturn.dart' as _i126;
import 'functions/sealed_classes/area.dart' as _i127;
import 'functions/sealed_classes/circle.dart' as _i128;
import 'functions/sealed_classes/circleWithOverriddenCustomJson.dart' as _i129;
import 'functions/sealed_classes/rectangle.dart' as _i130;
import 'functions/sealed_classes/rectangleWithOverriddenCustomJson.dart'
    as _i131;
import 'functions/sealed_classes/sealedClass.dart' as _i132;
import 'functions/sealed_classes/sealedClassWithCustomJson.dart' as _i133;
import 'functions/sealed_classes/sealedClassWithInheritedCustomJson.dart'
    as _i134;
import 'functions/sealed_classes/sealedClassWithOverriddenCustomJson.dart'
    as _i135;

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
    '/records/aliasedNamedFields': _i58.AliasedNamedFieldsTarget(),
    '/records/asyncAliasedNamedFields': _i59.AsyncAliasedNamedFieldsTarget(),
    '/records/asyncNamedFields': _i60.AsyncNamedFieldsTarget(),
    '/records/asyncNested': _i61.AsyncNestedTarget(),
    '/records/asyncNonAliasedNamedFields':
        _i62.AsyncNonAliasedNamedFieldsTarget(),
    '/records/asyncNullableNested': _i63.AsyncNullableNestedTarget(),
    '/records/namedFields': _i64.NamedFieldsTarget(),
    '/records/nested': _i65.NestedTarget(),
    '/records/nonAliasedNamedFields': _i66.NonAliasedNamedFieldsTarget(),
    '/records/nullableNested': _i67.NullableNestedTarget(),
    '/return_types/asyncBoolReturn': _i68.AsyncBoolReturnTarget(),
    '/return_types/asyncClassReturnNullable':
        _i69.AsyncClassReturnNullableTarget(),
    '/return_types/asyncComplexClassReturn':
        _i70.AsyncComplexClassReturnTarget(),
    '/return_types/asyncComplexStructReturn':
        _i71.AsyncComplexStructReturnTarget(),
    '/return_types/asyncComplexStructReturnNullable':
        _i72.AsyncComplexStructReturnNullableTarget(),
    '/return_types/asyncDoubleReturn': _i73.AsyncDoubleReturnTarget(),
    '/return_types/asyncIntReturn': _i74.AsyncIntReturnTarget(),
    '/return_types/asyncIterableReturn': _i75.AsyncIterableReturnTarget(),
    '/return_types/asyncListReturn': _i76.AsyncListReturnTarget(),
    '/return_types/asyncMapReturn': _i77.AsyncMapReturnTarget(),
    '/return_types/asyncOrBoolReturn': _i78.AsyncOrBoolReturnTarget(),
    '/return_types/asyncOrBoolReturnNullable':
        _i79.AsyncOrBoolReturnNullableTarget(),
    '/return_types/asyncOrComplexClassReturnNullable':
        _i80.AsyncOrComplexClassReturnNullableTarget(),
    '/return_types/asyncOrComplexStructReturn':
        _i81.AsyncOrComplexStructReturnTarget(),
    '/return_types/asyncOrComplexStructReturnNullable':
        _i82.AsyncOrComplexStructReturnNullableTarget(),
    '/return_types/asyncOrDoubleReturn': _i83.AsyncOrDoubleReturnTarget(),
    '/return_types/asyncOrDoubleReturnNullable':
        _i84.AsyncOrDoubleReturnNullableTarget(),
    '/return_types/asyncOrIntReturn': _i85.AsyncOrIntReturnTarget(),
    '/return_types/asyncOrIntReturnNullable':
        _i86.AsyncOrIntReturnNullableTarget(),
    '/return_types/asyncOrIterableReturn': _i87.AsyncOrIterableReturnTarget(),
    '/return_types/asyncOrIterableReturnNullable':
        _i88.AsyncOrIterableReturnNullableTarget(),
    '/return_types/asyncOrListReturn': _i89.AsyncOrListReturnTarget(),
    '/return_types/asyncOrListReturnNullable':
        _i90.AsyncOrListReturnNullableTarget(),
    '/return_types/asyncOrMapReturn': _i91.AsyncOrMapReturnTarget(),
    '/return_types/asyncOrMapReturnNullable':
        _i92.AsyncOrMapReturnNullableTarget(),
    '/return_types/asyncOrSimpleClassReturnNullable':
        _i93.AsyncOrSimpleClassReturnNullableTarget(),
    '/return_types/asyncOrStringReturn': _i94.AsyncOrStringReturnTarget(),
    '/return_types/asyncOrStringReturnNullable':
        _i95.AsyncOrStringReturnNullableTarget(),
    '/return_types/asyncOrStructReturn': _i96.AsyncOrStructReturnTarget(),
    '/return_types/asyncOrStructReturnNullable':
        _i97.AsyncOrStructReturnNullableTarget(),
    '/return_types/asyncOrVoidReturn': _i98.AsyncOrVoidReturnTarget(),
    '/return_types/asyncOrVoidReturnNullable':
        _i99.AsyncOrVoidReturnNullableTarget(),
    '/return_types/asyncStringReturn': _i100.AsyncStringReturnTarget(),
    '/return_types/asyncStructReturn': _i101.AsyncStructReturnTarget(),
    '/return_types/asyncStructReturnNullable':
        _i102.AsyncStructReturnNullableTarget(),
    '/return_types/asyncVoidReturn': _i103.AsyncVoidReturnTarget(),
    '/return_types/boolReturn': _i104.BoolReturnTarget(),
    '/return_types/boolReturnNullable': _i105.BoolReturnNullableTarget(),
    '/return_types/complexClassReturn': _i106.ComplexClassReturnTarget(),
    '/return_types/complexClassReturnNullable':
        _i107.ComplexClassReturnNullableTarget(),
    '/return_types/complexReturn': _i108.ComplexReturnTarget(),
    '/return_types/complexReturnNullable': _i109.ComplexReturnNullableTarget(),
    '/return_types/doubleReturn': _i110.DoubleReturnTarget(),
    '/return_types/doubleReturnNullable': _i111.DoubleReturnNullableTarget(),
    '/return_types/intReturn': _i112.IntReturnTarget(),
    '/return_types/intReturnNullable': _i113.IntReturnNullableTarget(),
    '/return_types/iterableReturn': _i114.IterableReturnTarget(),
    '/return_types/iterableReturnNullable':
        _i115.IterableReturnNullableTarget(),
    '/return_types/listReturn': _i116.ListReturnTarget(),
    '/return_types/listReturnNullable': _i117.ListReturnNullableTarget(),
    '/return_types/mapReturn': _i118.MapReturnTarget(),
    '/return_types/mapReturnNullable': _i119.MapReturnNullableTarget(),
    '/return_types/simpleClassReturn': _i120.SimpleClassReturnTarget(),
    '/return_types/simpleClassReturnNullable':
        _i121.SimpleClassReturnNullableTarget(),
    '/return_types/stringReturn': _i122.StringReturnTarget(),
    '/return_types/stringReturnNullable': _i123.StringReturnNullableTarget(),
    '/return_types/structReturn': _i124.StructReturnTarget(),
    '/return_types/structReturnNullable': _i125.StructReturnNullableTarget(),
    '/return_types/voidReturn': _i126.VoidReturnTarget(),
    '/sealed_classes/area': _i127.AreaTarget(),
    '/sealed_classes/circle': _i128.CircleTarget(),
    '/sealed_classes/circleWithOverriddenCustomJson':
        _i129.CircleWithOverriddenCustomJsonTarget(),
    '/sealed_classes/rectangle': _i130.RectangleTarget(),
    '/sealed_classes/rectangleWithOverriddenCustomJson':
        _i131.RectangleWithOverriddenCustomJsonTarget(),
    '/sealed_classes/sealedClass': _i132.SealedClassTarget(),
    '/sealed_classes/sealedClassWithCustomJson':
        _i133.SealedClassWithCustomJsonTarget(),
    '/sealed_classes/sealedClassWithInheritedCustomJson':
        _i134.SealedClassWithInheritedCustomJsonTarget(),
    '/sealed_classes/sealedClassWithOverriddenCustomJson':
        _i135.SealedClassWithOverriddenCustomJsonTarget(),
  });
}
