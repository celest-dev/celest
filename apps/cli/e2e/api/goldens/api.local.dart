// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest_runtime_cloud/celest_runtime_cloud.dart' as _i1;

import 'apis/anonymous_api/sayHello.dart' as _i2;
import 'apis/anonymous_api/sayHelloAuthenticated.dart' as _i3;
import 'apis/anonymous_function/sayHello.dart' as _i4;
import 'apis/anonymous_function/sayHelloAuthenticated.dart' as _i5;
import 'apis/api_auth_constant_variables/sayHello.dart' as _i6;
import 'apis/api_auth_constant_variables/sayHelloAuthenticated.dart' as _i7;
import 'apis/authenticated_api/sayGoodbyeAuthenticated.dart' as _i8;
import 'apis/authenticated_api/sayHelloAuthenticated.dart' as _i9;
import 'apis/authenticated_function/sayHello.dart' as _i10;
import 'apis/authenticated_function/sayHelloAuthenticated.dart' as _i11;
import 'apis/classes/asyncDefaultValues.dart' as _i12;
import 'apis/classes/asyncEmpty.dart' as _i13;
import 'apis/classes/asyncEmptySuper.dart' as _i14;
import 'apis/classes/asyncFields.dart' as _i15;
import 'apis/classes/asyncFromAndToJson.dart' as _i16;
import 'apis/classes/asyncMixedFields.dart' as _i17;
import 'apis/classes/asyncNamedFields.dart' as _i18;
import 'apis/classes/asyncNestedClass.dart' as _i19;
import 'apis/classes/asyncNonMapFromAndToJson.dart' as _i20;
import 'apis/classes/asyncNonMapToJson.dart' as _i21;
import 'apis/classes/asyncNonMapToJsonWithDefaults.dart' as _i22;
import 'apis/classes/asyncNullableFields.dart' as _i23;
import 'apis/classes/asyncOnlyFromJson.dart' as _i24;
import 'apis/classes/asyncOnlyToJson.dart' as _i25;
import 'apis/classes/asyncOnlyToJsonWithDefaults.dart' as _i26;
import 'apis/classes/asyncSuperFields.dart' as _i27;
import 'apis/classes/defaultValues.dart' as _i28;
import 'apis/classes/empty.dart' as _i29;
import 'apis/classes/emptySuper.dart' as _i30;
import 'apis/classes/fields.dart' as _i31;
import 'apis/classes/fromAndToJson.dart' as _i32;
import 'apis/classes/mixedFields.dart' as _i33;
import 'apis/classes/namedFields.dart' as _i34;
import 'apis/classes/nestedClass.dart' as _i35;
import 'apis/classes/nonMapFromAndToJson.dart' as _i36;
import 'apis/classes/nonMapToJson.dart' as _i37;
import 'apis/classes/nonMapToJsonWithDefaults.dart' as _i38;
import 'apis/classes/nullableFields.dart' as _i39;
import 'apis/classes/onlyFromJson.dart' as _i40;
import 'apis/classes/onlyToJson.dart' as _i41;
import 'apis/classes/onlyToJsonWithDefaults.dart' as _i42;
import 'apis/classes/superFields.dart' as _i43;
import 'apis/generic_wrappers/genericWrapperParameters.dart' as _i44;
import 'apis/generic_wrappers/genericWrappers.dart' as _i45;
import 'apis/generic_wrappers/genericWrappersAsync.dart' as _i46;
import 'apis/middleware/sayHello.dart' as _i47;
import 'apis/parameter_types/complex.dart' as _i48;
import 'apis/parameter_types/simple.dart' as _i49;
import 'apis/parameter_types/simpleOptional.dart' as _i50;
import 'apis/parameters/optionalNamed.dart' as _i51;
import 'apis/parameters/optionalPositional.dart' as _i52;
import 'apis/parameters/requiredNamed.dart' as _i53;
import 'apis/parameters/requiredPositional.dart' as _i54;
import 'apis/records/aliasedMixedFields.dart' as _i55;
import 'apis/records/aliasedNamedFields.dart' as _i56;
import 'apis/records/aliasedPositionalFields.dart' as _i57;
import 'apis/records/asyncAliasedMixedFields.dart' as _i58;
import 'apis/records/asyncAliasedNamedFields.dart' as _i59;
import 'apis/records/asyncAliasedPositionalFields.dart' as _i60;
import 'apis/records/asyncMixedFields.dart' as _i61;
import 'apis/records/asyncNamedFields.dart' as _i62;
import 'apis/records/asyncNested.dart' as _i63;
import 'apis/records/asyncNonAliasedMixedFields.dart' as _i64;
import 'apis/records/asyncNonAliasedNamedFields.dart' as _i65;
import 'apis/records/asyncNonAliasedPositionalFields.dart' as _i66;
import 'apis/records/asyncNullableNested.dart' as _i67;
import 'apis/records/asyncPositionalFields.dart' as _i68;
import 'apis/records/mixedFields.dart' as _i69;
import 'apis/records/namedFields.dart' as _i70;
import 'apis/records/nested.dart' as _i71;
import 'apis/records/nonAliasedMixedFields.dart' as _i72;
import 'apis/records/nonAliasedNamedFields.dart' as _i73;
import 'apis/records/nonAliasedPositionalFields.dart' as _i74;
import 'apis/records/nullableNested.dart' as _i75;
import 'apis/records/positionalFields.dart' as _i76;
import 'apis/return_types/asyncBoolReturn.dart' as _i77;
import 'apis/return_types/asyncClassReturnNullable.dart' as _i78;
import 'apis/return_types/asyncComplexClassReturn.dart' as _i79;
import 'apis/return_types/asyncComplexStructReturn.dart' as _i80;
import 'apis/return_types/asyncComplexStructReturnNullable.dart' as _i81;
import 'apis/return_types/asyncDoubleReturn.dart' as _i82;
import 'apis/return_types/asyncIntReturn.dart' as _i83;
import 'apis/return_types/asyncIterableReturn.dart' as _i84;
import 'apis/return_types/asyncListReturn.dart' as _i85;
import 'apis/return_types/asyncMapReturn.dart' as _i86;
import 'apis/return_types/asyncOrBoolReturn.dart' as _i87;
import 'apis/return_types/asyncOrBoolReturnNullable.dart' as _i88;
import 'apis/return_types/asyncOrComplexClassReturnNullable.dart' as _i89;
import 'apis/return_types/asyncOrComplexStructReturn.dart' as _i90;
import 'apis/return_types/asyncOrComplexStructReturnNullable.dart' as _i91;
import 'apis/return_types/asyncOrDoubleReturn.dart' as _i92;
import 'apis/return_types/asyncOrDoubleReturnNullable.dart' as _i93;
import 'apis/return_types/asyncOrIntReturn.dart' as _i94;
import 'apis/return_types/asyncOrIntReturnNullable.dart' as _i95;
import 'apis/return_types/asyncOrIterableReturn.dart' as _i96;
import 'apis/return_types/asyncOrIterableReturnNullable.dart' as _i97;
import 'apis/return_types/asyncOrListReturn.dart' as _i98;
import 'apis/return_types/asyncOrListReturnNullable.dart' as _i99;
import 'apis/return_types/asyncOrMapReturn.dart' as _i100;
import 'apis/return_types/asyncOrMapReturnNullable.dart' as _i101;
import 'apis/return_types/asyncOrSimpleClassReturnNullable.dart' as _i102;
import 'apis/return_types/asyncOrStringReturn.dart' as _i103;
import 'apis/return_types/asyncOrStringReturnNullable.dart' as _i104;
import 'apis/return_types/asyncOrStructReturn.dart' as _i105;
import 'apis/return_types/asyncOrStructReturnNullable.dart' as _i106;
import 'apis/return_types/asyncOrVoidReturn.dart' as _i107;
import 'apis/return_types/asyncOrVoidReturnNullable.dart' as _i108;
import 'apis/return_types/asyncStringReturn.dart' as _i109;
import 'apis/return_types/asyncStructReturn.dart' as _i110;
import 'apis/return_types/asyncStructReturnNullable.dart' as _i111;
import 'apis/return_types/asyncVoidReturn.dart' as _i112;
import 'apis/return_types/boolReturn.dart' as _i113;
import 'apis/return_types/boolReturnNullable.dart' as _i114;
import 'apis/return_types/complexClassReturn.dart' as _i115;
import 'apis/return_types/complexClassReturnNullable.dart' as _i116;
import 'apis/return_types/complexReturn.dart' as _i117;
import 'apis/return_types/complexReturnNullable.dart' as _i118;
import 'apis/return_types/doubleReturn.dart' as _i119;
import 'apis/return_types/doubleReturnNullable.dart' as _i120;
import 'apis/return_types/intReturn.dart' as _i121;
import 'apis/return_types/intReturnNullable.dart' as _i122;
import 'apis/return_types/iterableReturn.dart' as _i123;
import 'apis/return_types/iterableReturnNullable.dart' as _i124;
import 'apis/return_types/listReturn.dart' as _i125;
import 'apis/return_types/listReturnNullable.dart' as _i126;
import 'apis/return_types/mapReturn.dart' as _i127;
import 'apis/return_types/mapReturnNullable.dart' as _i128;
import 'apis/return_types/simpleClassReturn.dart' as _i129;
import 'apis/return_types/simpleClassReturnNullable.dart' as _i130;
import 'apis/return_types/stringReturn.dart' as _i131;
import 'apis/return_types/stringReturnNullable.dart' as _i132;
import 'apis/return_types/structReturn.dart' as _i133;
import 'apis/return_types/structReturnNullable.dart' as _i134;
import 'apis/return_types/voidReturn.dart' as _i135;

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
