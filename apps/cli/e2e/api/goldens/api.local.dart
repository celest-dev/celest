// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest_runtime_cloud/celest_runtime_cloud.dart' as _i1;

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
import 'functions/classes/asyncEmptySuper.dart' as _i14;
import 'functions/classes/asyncFields.dart' as _i15;
import 'functions/classes/asyncFromAndToJson.dart' as _i16;
import 'functions/classes/asyncMixedFields.dart' as _i17;
import 'functions/classes/asyncNamedFields.dart' as _i18;
import 'functions/classes/asyncNestedClass.dart' as _i19;
import 'functions/classes/asyncNonMapFromAndToJson.dart' as _i20;
import 'functions/classes/asyncNonMapToJson.dart' as _i21;
import 'functions/classes/asyncNonMapToJsonWithDefaults.dart' as _i22;
import 'functions/classes/asyncNullableFields.dart' as _i23;
import 'functions/classes/asyncOnlyFromJson.dart' as _i24;
import 'functions/classes/asyncOnlyToJson.dart' as _i25;
import 'functions/classes/asyncOnlyToJsonWithDefaults.dart' as _i26;
import 'functions/classes/asyncSuperFields.dart' as _i27;
import 'functions/classes/defaultValues.dart' as _i28;
import 'functions/classes/empty.dart' as _i29;
import 'functions/classes/emptySuper.dart' as _i30;
import 'functions/classes/fields.dart' as _i31;
import 'functions/classes/fromAndToJson.dart' as _i32;
import 'functions/classes/mixedFields.dart' as _i33;
import 'functions/classes/namedFields.dart' as _i34;
import 'functions/classes/nestedClass.dart' as _i35;
import 'functions/classes/nonMapFromAndToJson.dart' as _i36;
import 'functions/classes/nonMapToJson.dart' as _i37;
import 'functions/classes/nonMapToJsonWithDefaults.dart' as _i38;
import 'functions/classes/nullableFields.dart' as _i39;
import 'functions/classes/onlyFromJson.dart' as _i40;
import 'functions/classes/onlyToJson.dart' as _i41;
import 'functions/classes/onlyToJsonWithDefaults.dart' as _i42;
import 'functions/classes/superFields.dart' as _i43;
import 'functions/generic_wrappers/genericWrapperParameters.dart' as _i44;
import 'functions/generic_wrappers/genericWrappers.dart' as _i45;
import 'functions/generic_wrappers/genericWrappersAsync.dart' as _i46;
import 'functions/middleware/sayHello.dart' as _i47;
import 'functions/parameter_types/complex.dart' as _i48;
import 'functions/parameter_types/simple.dart' as _i49;
import 'functions/parameter_types/simpleOptional.dart' as _i50;
import 'functions/parameters/optionalNamed.dart' as _i51;
import 'functions/parameters/optionalPositional.dart' as _i52;
import 'functions/parameters/requiredNamed.dart' as _i53;
import 'functions/parameters/requiredPositional.dart' as _i54;
import 'functions/records/aliasedMixedFields.dart' as _i55;
import 'functions/records/aliasedNamedFields.dart' as _i56;
import 'functions/records/aliasedPositionalFields.dart' as _i57;
import 'functions/records/asyncAliasedMixedFields.dart' as _i58;
import 'functions/records/asyncAliasedNamedFields.dart' as _i59;
import 'functions/records/asyncAliasedPositionalFields.dart' as _i60;
import 'functions/records/asyncMixedFields.dart' as _i61;
import 'functions/records/asyncNamedFields.dart' as _i62;
import 'functions/records/asyncNested.dart' as _i63;
import 'functions/records/asyncNonAliasedMixedFields.dart' as _i64;
import 'functions/records/asyncNonAliasedNamedFields.dart' as _i65;
import 'functions/records/asyncNonAliasedPositionalFields.dart' as _i66;
import 'functions/records/asyncNullableNested.dart' as _i67;
import 'functions/records/asyncPositionalFields.dart' as _i68;
import 'functions/records/mixedFields.dart' as _i69;
import 'functions/records/namedFields.dart' as _i70;
import 'functions/records/nested.dart' as _i71;
import 'functions/records/nonAliasedMixedFields.dart' as _i72;
import 'functions/records/nonAliasedNamedFields.dart' as _i73;
import 'functions/records/nonAliasedPositionalFields.dart' as _i74;
import 'functions/records/nullableNested.dart' as _i75;
import 'functions/records/positionalFields.dart' as _i76;
import 'functions/return_types/asyncBoolReturn.dart' as _i77;
import 'functions/return_types/asyncClassReturnNullable.dart' as _i78;
import 'functions/return_types/asyncComplexClassReturn.dart' as _i79;
import 'functions/return_types/asyncComplexStructReturn.dart' as _i80;
import 'functions/return_types/asyncComplexStructReturnNullable.dart' as _i81;
import 'functions/return_types/asyncDoubleReturn.dart' as _i82;
import 'functions/return_types/asyncIntReturn.dart' as _i83;
import 'functions/return_types/asyncIterableReturn.dart' as _i84;
import 'functions/return_types/asyncListReturn.dart' as _i85;
import 'functions/return_types/asyncMapReturn.dart' as _i86;
import 'functions/return_types/asyncOrBoolReturn.dart' as _i87;
import 'functions/return_types/asyncOrBoolReturnNullable.dart' as _i88;
import 'functions/return_types/asyncOrComplexClassReturnNullable.dart' as _i89;
import 'functions/return_types/asyncOrComplexStructReturn.dart' as _i90;
import 'functions/return_types/asyncOrComplexStructReturnNullable.dart' as _i91;
import 'functions/return_types/asyncOrDoubleReturn.dart' as _i92;
import 'functions/return_types/asyncOrDoubleReturnNullable.dart' as _i93;
import 'functions/return_types/asyncOrIntReturn.dart' as _i94;
import 'functions/return_types/asyncOrIntReturnNullable.dart' as _i95;
import 'functions/return_types/asyncOrIterableReturn.dart' as _i96;
import 'functions/return_types/asyncOrIterableReturnNullable.dart' as _i97;
import 'functions/return_types/asyncOrListReturn.dart' as _i98;
import 'functions/return_types/asyncOrListReturnNullable.dart' as _i99;
import 'functions/return_types/asyncOrMapReturn.dart' as _i100;
import 'functions/return_types/asyncOrMapReturnNullable.dart' as _i101;
import 'functions/return_types/asyncOrSimpleClassReturnNullable.dart' as _i102;
import 'functions/return_types/asyncOrStringReturn.dart' as _i103;
import 'functions/return_types/asyncOrStringReturnNullable.dart' as _i104;
import 'functions/return_types/asyncOrStructReturn.dart' as _i105;
import 'functions/return_types/asyncOrStructReturnNullable.dart' as _i106;
import 'functions/return_types/asyncOrVoidReturn.dart' as _i107;
import 'functions/return_types/asyncOrVoidReturnNullable.dart' as _i108;
import 'functions/return_types/asyncStringReturn.dart' as _i109;
import 'functions/return_types/asyncStructReturn.dart' as _i110;
import 'functions/return_types/asyncStructReturnNullable.dart' as _i111;
import 'functions/return_types/asyncVoidReturn.dart' as _i112;
import 'functions/return_types/boolReturn.dart' as _i113;
import 'functions/return_types/boolReturnNullable.dart' as _i114;
import 'functions/return_types/complexClassReturn.dart' as _i115;
import 'functions/return_types/complexClassReturnNullable.dart' as _i116;
import 'functions/return_types/complexReturn.dart' as _i117;
import 'functions/return_types/complexReturnNullable.dart' as _i118;
import 'functions/return_types/doubleReturn.dart' as _i119;
import 'functions/return_types/doubleReturnNullable.dart' as _i120;
import 'functions/return_types/intReturn.dart' as _i121;
import 'functions/return_types/intReturnNullable.dart' as _i122;
import 'functions/return_types/iterableReturn.dart' as _i123;
import 'functions/return_types/iterableReturnNullable.dart' as _i124;
import 'functions/return_types/listReturn.dart' as _i125;
import 'functions/return_types/listReturnNullable.dart' as _i126;
import 'functions/return_types/mapReturn.dart' as _i127;
import 'functions/return_types/mapReturnNullable.dart' as _i128;
import 'functions/return_types/simpleClassReturn.dart' as _i129;
import 'functions/return_types/simpleClassReturnNullable.dart' as _i130;
import 'functions/return_types/stringReturn.dart' as _i131;
import 'functions/return_types/stringReturnNullable.dart' as _i132;
import 'functions/return_types/structReturn.dart' as _i133;
import 'functions/return_types/structReturnNullable.dart' as _i134;
import 'functions/return_types/voidReturn.dart' as _i135;

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
    '/classes/asyncEmptySuper': _i14.AsyncEmptySuperTarget(),
    '/classes/asyncFields': _i15.AsyncFieldsTarget(),
    '/classes/asyncFromAndToJson': _i16.AsyncFromAndToJsonTarget(),
    '/classes/asyncMixedFields': _i17.AsyncMixedFieldsTarget(),
    '/classes/asyncNamedFields': _i18.AsyncNamedFieldsTarget(),
    '/classes/asyncNestedClass': _i19.AsyncNestedClassTarget(),
    '/classes/asyncNonMapFromAndToJson': _i20.AsyncNonMapFromAndToJsonTarget(),
    '/classes/asyncNonMapToJson': _i21.AsyncNonMapToJsonTarget(),
    '/classes/asyncNonMapToJsonWithDefaults':
        _i22.AsyncNonMapToJsonWithDefaultsTarget(),
    '/classes/asyncNullableFields': _i23.AsyncNullableFieldsTarget(),
    '/classes/asyncOnlyFromJson': _i24.AsyncOnlyFromJsonTarget(),
    '/classes/asyncOnlyToJson': _i25.AsyncOnlyToJsonTarget(),
    '/classes/asyncOnlyToJsonWithDefaults':
        _i26.AsyncOnlyToJsonWithDefaultsTarget(),
    '/classes/asyncSuperFields': _i27.AsyncSuperFieldsTarget(),
    '/classes/defaultValues': _i28.DefaultValuesTarget(),
    '/classes/empty': _i29.EmptyTarget(),
    '/classes/emptySuper': _i30.EmptySuperTarget(),
    '/classes/fields': _i31.FieldsTarget(),
    '/classes/fromAndToJson': _i32.FromAndToJsonTarget(),
    '/classes/mixedFields': _i33.MixedFieldsTarget(),
    '/classes/namedFields': _i34.NamedFieldsTarget(),
    '/classes/nestedClass': _i35.NestedClassTarget(),
    '/classes/nonMapFromAndToJson': _i36.NonMapFromAndToJsonTarget(),
    '/classes/nonMapToJson': _i37.NonMapToJsonTarget(),
    '/classes/nonMapToJsonWithDefaults': _i38.NonMapToJsonWithDefaultsTarget(),
    '/classes/nullableFields': _i39.NullableFieldsTarget(),
    '/classes/onlyFromJson': _i40.OnlyFromJsonTarget(),
    '/classes/onlyToJson': _i41.OnlyToJsonTarget(),
    '/classes/onlyToJsonWithDefaults': _i42.OnlyToJsonWithDefaultsTarget(),
    '/classes/superFields': _i43.SuperFieldsTarget(),
    '/generic_wrappers/genericWrapperParameters':
        _i44.GenericWrapperParametersTarget(),
    '/generic_wrappers/genericWrappers': _i45.GenericWrappersTarget(),
    '/generic_wrappers/genericWrappersAsync': _i46.GenericWrappersAsyncTarget(),
    '/middleware/sayHello': _i47.SayHelloTarget(),
    '/parameter_types/complex': _i48.ComplexTarget(),
    '/parameter_types/simple': _i49.SimpleTarget(),
    '/parameter_types/simpleOptional': _i50.SimpleOptionalTarget(),
    '/parameters/optionalNamed': _i51.OptionalNamedTarget(),
    '/parameters/optionalPositional': _i52.OptionalPositionalTarget(),
    '/parameters/requiredNamed': _i53.RequiredNamedTarget(),
    '/parameters/requiredPositional': _i54.RequiredPositionalTarget(),
    '/records/aliasedMixedFields': _i55.AliasedMixedFieldsTarget(),
    '/records/aliasedNamedFields': _i56.AliasedNamedFieldsTarget(),
    '/records/aliasedPositionalFields': _i57.AliasedPositionalFieldsTarget(),
    '/records/asyncAliasedMixedFields': _i58.AsyncAliasedMixedFieldsTarget(),
    '/records/asyncAliasedNamedFields': _i59.AsyncAliasedNamedFieldsTarget(),
    '/records/asyncAliasedPositionalFields':
        _i60.AsyncAliasedPositionalFieldsTarget(),
    '/records/asyncMixedFields': _i61.AsyncMixedFieldsTarget(),
    '/records/asyncNamedFields': _i62.AsyncNamedFieldsTarget(),
    '/records/asyncNested': _i63.AsyncNestedTarget(),
    '/records/asyncNonAliasedMixedFields':
        _i64.AsyncNonAliasedMixedFieldsTarget(),
    '/records/asyncNonAliasedNamedFields':
        _i65.AsyncNonAliasedNamedFieldsTarget(),
    '/records/asyncNonAliasedPositionalFields':
        _i66.AsyncNonAliasedPositionalFieldsTarget(),
    '/records/asyncNullableNested': _i67.AsyncNullableNestedTarget(),
    '/records/asyncPositionalFields': _i68.AsyncPositionalFieldsTarget(),
    '/records/mixedFields': _i69.MixedFieldsTarget(),
    '/records/namedFields': _i70.NamedFieldsTarget(),
    '/records/nested': _i71.NestedTarget(),
    '/records/nonAliasedMixedFields': _i72.NonAliasedMixedFieldsTarget(),
    '/records/nonAliasedNamedFields': _i73.NonAliasedNamedFieldsTarget(),
    '/records/nonAliasedPositionalFields':
        _i74.NonAliasedPositionalFieldsTarget(),
    '/records/nullableNested': _i75.NullableNestedTarget(),
    '/records/positionalFields': _i76.PositionalFieldsTarget(),
    '/return_types/asyncBoolReturn': _i77.AsyncBoolReturnTarget(),
    '/return_types/asyncClassReturnNullable':
        _i78.AsyncClassReturnNullableTarget(),
    '/return_types/asyncComplexClassReturn':
        _i79.AsyncComplexClassReturnTarget(),
    '/return_types/asyncComplexStructReturn':
        _i80.AsyncComplexStructReturnTarget(),
    '/return_types/asyncComplexStructReturnNullable':
        _i81.AsyncComplexStructReturnNullableTarget(),
    '/return_types/asyncDoubleReturn': _i82.AsyncDoubleReturnTarget(),
    '/return_types/asyncIntReturn': _i83.AsyncIntReturnTarget(),
    '/return_types/asyncIterableReturn': _i84.AsyncIterableReturnTarget(),
    '/return_types/asyncListReturn': _i85.AsyncListReturnTarget(),
    '/return_types/asyncMapReturn': _i86.AsyncMapReturnTarget(),
    '/return_types/asyncOrBoolReturn': _i87.AsyncOrBoolReturnTarget(),
    '/return_types/asyncOrBoolReturnNullable':
        _i88.AsyncOrBoolReturnNullableTarget(),
    '/return_types/asyncOrComplexClassReturnNullable':
        _i89.AsyncOrComplexClassReturnNullableTarget(),
    '/return_types/asyncOrComplexStructReturn':
        _i90.AsyncOrComplexStructReturnTarget(),
    '/return_types/asyncOrComplexStructReturnNullable':
        _i91.AsyncOrComplexStructReturnNullableTarget(),
    '/return_types/asyncOrDoubleReturn': _i92.AsyncOrDoubleReturnTarget(),
    '/return_types/asyncOrDoubleReturnNullable':
        _i93.AsyncOrDoubleReturnNullableTarget(),
    '/return_types/asyncOrIntReturn': _i94.AsyncOrIntReturnTarget(),
    '/return_types/asyncOrIntReturnNullable':
        _i95.AsyncOrIntReturnNullableTarget(),
    '/return_types/asyncOrIterableReturn': _i96.AsyncOrIterableReturnTarget(),
    '/return_types/asyncOrIterableReturnNullable':
        _i97.AsyncOrIterableReturnNullableTarget(),
    '/return_types/asyncOrListReturn': _i98.AsyncOrListReturnTarget(),
    '/return_types/asyncOrListReturnNullable':
        _i99.AsyncOrListReturnNullableTarget(),
    '/return_types/asyncOrMapReturn': _i100.AsyncOrMapReturnTarget(),
    '/return_types/asyncOrMapReturnNullable':
        _i101.AsyncOrMapReturnNullableTarget(),
    '/return_types/asyncOrSimpleClassReturnNullable':
        _i102.AsyncOrSimpleClassReturnNullableTarget(),
    '/return_types/asyncOrStringReturn': _i103.AsyncOrStringReturnTarget(),
    '/return_types/asyncOrStringReturnNullable':
        _i104.AsyncOrStringReturnNullableTarget(),
    '/return_types/asyncOrStructReturn': _i105.AsyncOrStructReturnTarget(),
    '/return_types/asyncOrStructReturnNullable':
        _i106.AsyncOrStructReturnNullableTarget(),
    '/return_types/asyncOrVoidReturn': _i107.AsyncOrVoidReturnTarget(),
    '/return_types/asyncOrVoidReturnNullable':
        _i108.AsyncOrVoidReturnNullableTarget(),
    '/return_types/asyncStringReturn': _i109.AsyncStringReturnTarget(),
    '/return_types/asyncStructReturn': _i110.AsyncStructReturnTarget(),
    '/return_types/asyncStructReturnNullable':
        _i111.AsyncStructReturnNullableTarget(),
    '/return_types/asyncVoidReturn': _i112.AsyncVoidReturnTarget(),
    '/return_types/boolReturn': _i113.BoolReturnTarget(),
    '/return_types/boolReturnNullable': _i114.BoolReturnNullableTarget(),
    '/return_types/complexClassReturn': _i115.ComplexClassReturnTarget(),
    '/return_types/complexClassReturnNullable':
        _i116.ComplexClassReturnNullableTarget(),
    '/return_types/complexReturn': _i117.ComplexReturnTarget(),
    '/return_types/complexReturnNullable': _i118.ComplexReturnNullableTarget(),
    '/return_types/doubleReturn': _i119.DoubleReturnTarget(),
    '/return_types/doubleReturnNullable': _i120.DoubleReturnNullableTarget(),
    '/return_types/intReturn': _i121.IntReturnTarget(),
    '/return_types/intReturnNullable': _i122.IntReturnNullableTarget(),
    '/return_types/iterableReturn': _i123.IterableReturnTarget(),
    '/return_types/iterableReturnNullable':
        _i124.IterableReturnNullableTarget(),
    '/return_types/listReturn': _i125.ListReturnTarget(),
    '/return_types/listReturnNullable': _i126.ListReturnNullableTarget(),
    '/return_types/mapReturn': _i127.MapReturnTarget(),
    '/return_types/mapReturnNullable': _i128.MapReturnNullableTarget(),
    '/return_types/simpleClassReturn': _i129.SimpleClassReturnTarget(),
    '/return_types/simpleClassReturnNullable':
        _i130.SimpleClassReturnNullableTarget(),
    '/return_types/stringReturn': _i131.StringReturnTarget(),
    '/return_types/stringReturnNullable': _i132.StringReturnNullableTarget(),
    '/return_types/structReturn': _i133.StructReturnTarget(),
    '/return_types/structReturnNullable': _i134.StructReturnNullableTarget(),
    '/return_types/voidReturn': _i135.VoidReturnTarget(),
  });
}
