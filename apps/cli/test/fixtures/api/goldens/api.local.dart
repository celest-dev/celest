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
import 'functions/cycles/combineTrees.dart' as _i40;
import 'functions/cycles/createTree.dart' as _i41;
import 'functions/cycles/printTree.dart' as _i42;
import 'functions/cycles/selfReferencing.dart' as _i43;
import 'functions/exceptions/throwsCustomError.dart' as _i44;
import 'functions/exceptions/throwsCustomErrorToFromJson.dart' as _i45;
import 'functions/exceptions/throwsCustomErrorWithStackTrace.dart' as _i46;
import 'functions/exceptions/throwsCustomException.dart' as _i47;
import 'functions/exceptions/throwsCustomExceptionToFromJson.dart' as _i48;
import 'functions/exceptions/throwsError.dart' as _i49;
import 'functions/exceptions/throwsException.dart' as _i50;
import 'functions/generic_wrappers/genericWrapperParameters.dart' as _i51;
import 'functions/generic_wrappers/genericWrappers.dart' as _i52;
import 'functions/generic_wrappers/genericWrappersAsync.dart' as _i53;
import 'functions/metadata/hasConstructedDeprecatedAnnotation.dart' as _i54;
import 'functions/metadata/hasDeprecatedAnnotation.dart' as _i55;
import 'functions/metadata/hasDocComments.dart' as _i56;
import 'functions/metadata/hasExportableAnnotation.dart' as _i57;
import 'functions/metadata/hasExportableConstructedAnnotation.dart' as _i58;
import 'functions/metadata/hasLiteralsAnnotation.dart' as _i59;
import 'functions/metadata/hasNamedConstructedAnnotation.dart' as _i60;
import 'functions/metadata/hasNotExportableAnnotation.dart' as _i61;
import 'functions/metadata/hasNotExportableConstructedAnnotation.dart' as _i62;
import 'functions/metadata/hasNotExportableExportableAnnotation.dart' as _i63;
import 'functions/metadata/namedDefaultValues.dart' as _i66;
import 'functions/metadata/namedDefaultValueVars.dart' as _i64;
import 'functions/metadata/namedDefaultValueVarsPrivate.dart' as _i65;
import 'functions/metadata/nullableNamedDefaultValues.dart' as _i69;
import 'functions/metadata/nullableNamedDefaultValueVars.dart' as _i67;
import 'functions/metadata/nullableNamedDefaultValueVarsPrivate.dart' as _i68;
import 'functions/metadata/nullablePositionalDefaultValues.dart' as _i72;
import 'functions/metadata/nullablePositionalDefaultValueVars.dart' as _i70;
import 'functions/metadata/nullablePositionalDefaultValueVarsPrivate.dart'
    as _i71;
import 'functions/metadata/positionalDefaultValues.dart' as _i75;
import 'functions/metadata/positionalDefaultValueVars.dart' as _i73;
import 'functions/metadata/positionalDefaultValueVarsPrivate.dart' as _i74;
import 'functions/middleware/sayHello.dart' as _i76;
import 'functions/parameter_types/complex.dart' as _i77;
import 'functions/parameter_types/simple.dart' as _i78;
import 'functions/parameter_types/simpleOptional.dart' as _i79;
import 'functions/parameters/optionalNamed.dart' as _i80;
import 'functions/parameters/optionalPositional.dart' as _i81;
import 'functions/parameters/requiredNamed.dart' as _i82;
import 'functions/parameters/requiredPositional.dart' as _i83;
import 'functions/records/aliasedNamedFields.dart' as _i84;
import 'functions/records/asyncAliasedNamedFields.dart' as _i85;
import 'functions/records/asyncNamedFields.dart' as _i86;
import 'functions/records/asyncNested.dart' as _i87;
import 'functions/records/asyncNonAliasedNamedFields.dart' as _i88;
import 'functions/records/asyncNullableNested.dart' as _i89;
import 'functions/records/namedFields.dart' as _i90;
import 'functions/records/nested.dart' as _i91;
import 'functions/records/nonAliasedNamedFields.dart' as _i92;
import 'functions/records/nullableNested.dart' as _i93;
import 'functions/return_types/asyncBoolReturn.dart' as _i94;
import 'functions/return_types/asyncClassReturnNullable.dart' as _i95;
import 'functions/return_types/asyncComplexClassReturn.dart' as _i96;
import 'functions/return_types/asyncComplexStructReturn.dart' as _i97;
import 'functions/return_types/asyncComplexStructReturnNullable.dart' as _i98;
import 'functions/return_types/asyncDoubleReturn.dart' as _i99;
import 'functions/return_types/asyncIntReturn.dart' as _i100;
import 'functions/return_types/asyncIterableReturn.dart' as _i101;
import 'functions/return_types/asyncListReturn.dart' as _i102;
import 'functions/return_types/asyncMapReturn.dart' as _i103;
import 'functions/return_types/asyncOrBoolReturn.dart' as _i104;
import 'functions/return_types/asyncOrBoolReturnNullable.dart' as _i105;
import 'functions/return_types/asyncOrComplexClassReturnNullable.dart' as _i106;
import 'functions/return_types/asyncOrComplexStructReturn.dart' as _i107;
import 'functions/return_types/asyncOrComplexStructReturnNullable.dart'
    as _i108;
import 'functions/return_types/asyncOrDoubleReturn.dart' as _i109;
import 'functions/return_types/asyncOrDoubleReturnNullable.dart' as _i110;
import 'functions/return_types/asyncOrIntReturn.dart' as _i111;
import 'functions/return_types/asyncOrIntReturnNullable.dart' as _i112;
import 'functions/return_types/asyncOrIterableReturn.dart' as _i113;
import 'functions/return_types/asyncOrIterableReturnNullable.dart' as _i114;
import 'functions/return_types/asyncOrListReturn.dart' as _i115;
import 'functions/return_types/asyncOrListReturnNullable.dart' as _i116;
import 'functions/return_types/asyncOrMapReturn.dart' as _i117;
import 'functions/return_types/asyncOrMapReturnNullable.dart' as _i118;
import 'functions/return_types/asyncOrSimpleClassReturnNullable.dart' as _i119;
import 'functions/return_types/asyncOrStringReturn.dart' as _i120;
import 'functions/return_types/asyncOrStringReturnNullable.dart' as _i121;
import 'functions/return_types/asyncOrStructReturn.dart' as _i122;
import 'functions/return_types/asyncOrStructReturnNullable.dart' as _i123;
import 'functions/return_types/asyncOrVoidReturn.dart' as _i124;
import 'functions/return_types/asyncOrVoidReturnNullable.dart' as _i125;
import 'functions/return_types/asyncStringReturn.dart' as _i126;
import 'functions/return_types/asyncStructReturn.dart' as _i127;
import 'functions/return_types/asyncStructReturnNullable.dart' as _i128;
import 'functions/return_types/asyncVoidReturn.dart' as _i129;
import 'functions/return_types/boolReturn.dart' as _i130;
import 'functions/return_types/boolReturnNullable.dart' as _i131;
import 'functions/return_types/complexClassReturn.dart' as _i132;
import 'functions/return_types/complexClassReturnNullable.dart' as _i133;
import 'functions/return_types/complexReturn.dart' as _i134;
import 'functions/return_types/complexReturnNullable.dart' as _i135;
import 'functions/return_types/doubleReturn.dart' as _i136;
import 'functions/return_types/doubleReturnNullable.dart' as _i137;
import 'functions/return_types/intReturn.dart' as _i138;
import 'functions/return_types/intReturnNullable.dart' as _i139;
import 'functions/return_types/iterableReturn.dart' as _i140;
import 'functions/return_types/iterableReturnNullable.dart' as _i141;
import 'functions/return_types/listReturn.dart' as _i142;
import 'functions/return_types/listReturnNullable.dart' as _i143;
import 'functions/return_types/mapReturn.dart' as _i144;
import 'functions/return_types/mapReturnNullable.dart' as _i145;
import 'functions/return_types/simpleClassReturn.dart' as _i146;
import 'functions/return_types/simpleClassReturnNullable.dart' as _i147;
import 'functions/return_types/stringReturn.dart' as _i148;
import 'functions/return_types/stringReturnNullable.dart' as _i149;
import 'functions/return_types/structReturn.dart' as _i150;
import 'functions/return_types/structReturnNullable.dart' as _i151;
import 'functions/return_types/voidReturn.dart' as _i152;
import 'functions/sealed_classes/area.dart' as _i153;
import 'functions/sealed_classes/circle.dart' as _i154;
import 'functions/sealed_classes/circleWithOverriddenCustomJson.dart' as _i155;
import 'functions/sealed_classes/rectangle.dart' as _i156;
import 'functions/sealed_classes/rectangleWithOverriddenCustomJson.dart'
    as _i157;
import 'functions/sealed_classes/sealedClass.dart' as _i158;
import 'functions/sealed_classes/sealedClassWithCustomJson.dart' as _i159;
import 'functions/sealed_classes/sealedClassWithInheritedCustomJson.dart'
    as _i160;
import 'functions/sealed_classes/sealedClassWithOverriddenCustomJson.dart'
    as _i161;

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
    '/cycles/combineTrees': _i40.CombineTreesTarget(),
    '/cycles/createTree': _i41.CreateTreeTarget(),
    '/cycles/printTree': _i42.PrintTreeTarget(),
    '/cycles/selfReferencing': _i43.SelfReferencingTarget(),
    '/exceptions/throwsCustomError': _i44.ThrowsCustomErrorTarget(),
    '/exceptions/throwsCustomErrorToFromJson':
        _i45.ThrowsCustomErrorToFromJsonTarget(),
    '/exceptions/throwsCustomErrorWithStackTrace':
        _i46.ThrowsCustomErrorWithStackTraceTarget(),
    '/exceptions/throwsCustomException': _i47.ThrowsCustomExceptionTarget(),
    '/exceptions/throwsCustomExceptionToFromJson':
        _i48.ThrowsCustomExceptionToFromJsonTarget(),
    '/exceptions/throwsError': _i49.ThrowsErrorTarget(),
    '/exceptions/throwsException': _i50.ThrowsExceptionTarget(),
    '/generic_wrappers/genericWrapperParameters':
        _i51.GenericWrapperParametersTarget(),
    '/generic_wrappers/genericWrappers': _i52.GenericWrappersTarget(),
    '/generic_wrappers/genericWrappersAsync': _i53.GenericWrappersAsyncTarget(),
    '/metadata/hasConstructedDeprecatedAnnotation':
        _i54.HasConstructedDeprecatedAnnotationTarget(),
    '/metadata/hasDeprecatedAnnotation': _i55.HasDeprecatedAnnotationTarget(),
    '/metadata/hasDocComments': _i56.HasDocCommentsTarget(),
    '/metadata/hasExportableAnnotation': _i57.HasExportableAnnotationTarget(),
    '/metadata/hasExportableConstructedAnnotation':
        _i58.HasExportableConstructedAnnotationTarget(),
    '/metadata/hasLiteralsAnnotation': _i59.HasLiteralsAnnotationTarget(),
    '/metadata/hasNamedConstructedAnnotation':
        _i60.HasNamedConstructedAnnotationTarget(),
    '/metadata/hasNotExportableAnnotation':
        _i61.HasNotExportableAnnotationTarget(),
    '/metadata/hasNotExportableConstructedAnnotation':
        _i62.HasNotExportableConstructedAnnotationTarget(),
    '/metadata/hasNotExportableExportableAnnotation':
        _i63.HasNotExportableExportableAnnotationTarget(),
    '/metadata/namedDefaultValueVars': _i64.NamedDefaultValueVarsTarget(),
    '/metadata/namedDefaultValueVarsPrivate':
        _i65.NamedDefaultValueVarsPrivateTarget(),
    '/metadata/namedDefaultValues': _i66.NamedDefaultValuesTarget(),
    '/metadata/nullableNamedDefaultValueVars':
        _i67.NullableNamedDefaultValueVarsTarget(),
    '/metadata/nullableNamedDefaultValueVarsPrivate':
        _i68.NullableNamedDefaultValueVarsPrivateTarget(),
    '/metadata/nullableNamedDefaultValues':
        _i69.NullableNamedDefaultValuesTarget(),
    '/metadata/nullablePositionalDefaultValueVars':
        _i70.NullablePositionalDefaultValueVarsTarget(),
    '/metadata/nullablePositionalDefaultValueVarsPrivate':
        _i71.NullablePositionalDefaultValueVarsPrivateTarget(),
    '/metadata/nullablePositionalDefaultValues':
        _i72.NullablePositionalDefaultValuesTarget(),
    '/metadata/positionalDefaultValueVars':
        _i73.PositionalDefaultValueVarsTarget(),
    '/metadata/positionalDefaultValueVarsPrivate':
        _i74.PositionalDefaultValueVarsPrivateTarget(),
    '/metadata/positionalDefaultValues': _i75.PositionalDefaultValuesTarget(),
    '/middleware/sayHello': _i76.SayHelloTarget(),
    '/parameter_types/complex': _i77.ComplexTarget(),
    '/parameter_types/simple': _i78.SimpleTarget(),
    '/parameter_types/simpleOptional': _i79.SimpleOptionalTarget(),
    '/parameters/optionalNamed': _i80.OptionalNamedTarget(),
    '/parameters/optionalPositional': _i81.OptionalPositionalTarget(),
    '/parameters/requiredNamed': _i82.RequiredNamedTarget(),
    '/parameters/requiredPositional': _i83.RequiredPositionalTarget(),
    '/records/aliasedNamedFields': _i84.AliasedNamedFieldsTarget(),
    '/records/asyncAliasedNamedFields': _i85.AsyncAliasedNamedFieldsTarget(),
    '/records/asyncNamedFields': _i86.AsyncNamedFieldsTarget(),
    '/records/asyncNested': _i87.AsyncNestedTarget(),
    '/records/asyncNonAliasedNamedFields':
        _i88.AsyncNonAliasedNamedFieldsTarget(),
    '/records/asyncNullableNested': _i89.AsyncNullableNestedTarget(),
    '/records/namedFields': _i90.NamedFieldsTarget(),
    '/records/nested': _i91.NestedTarget(),
    '/records/nonAliasedNamedFields': _i92.NonAliasedNamedFieldsTarget(),
    '/records/nullableNested': _i93.NullableNestedTarget(),
    '/return_types/asyncBoolReturn': _i94.AsyncBoolReturnTarget(),
    '/return_types/asyncClassReturnNullable':
        _i95.AsyncClassReturnNullableTarget(),
    '/return_types/asyncComplexClassReturn':
        _i96.AsyncComplexClassReturnTarget(),
    '/return_types/asyncComplexStructReturn':
        _i97.AsyncComplexStructReturnTarget(),
    '/return_types/asyncComplexStructReturnNullable':
        _i98.AsyncComplexStructReturnNullableTarget(),
    '/return_types/asyncDoubleReturn': _i99.AsyncDoubleReturnTarget(),
    '/return_types/asyncIntReturn': _i100.AsyncIntReturnTarget(),
    '/return_types/asyncIterableReturn': _i101.AsyncIterableReturnTarget(),
    '/return_types/asyncListReturn': _i102.AsyncListReturnTarget(),
    '/return_types/asyncMapReturn': _i103.AsyncMapReturnTarget(),
    '/return_types/asyncOrBoolReturn': _i104.AsyncOrBoolReturnTarget(),
    '/return_types/asyncOrBoolReturnNullable':
        _i105.AsyncOrBoolReturnNullableTarget(),
    '/return_types/asyncOrComplexClassReturnNullable':
        _i106.AsyncOrComplexClassReturnNullableTarget(),
    '/return_types/asyncOrComplexStructReturn':
        _i107.AsyncOrComplexStructReturnTarget(),
    '/return_types/asyncOrComplexStructReturnNullable':
        _i108.AsyncOrComplexStructReturnNullableTarget(),
    '/return_types/asyncOrDoubleReturn': _i109.AsyncOrDoubleReturnTarget(),
    '/return_types/asyncOrDoubleReturnNullable':
        _i110.AsyncOrDoubleReturnNullableTarget(),
    '/return_types/asyncOrIntReturn': _i111.AsyncOrIntReturnTarget(),
    '/return_types/asyncOrIntReturnNullable':
        _i112.AsyncOrIntReturnNullableTarget(),
    '/return_types/asyncOrIterableReturn': _i113.AsyncOrIterableReturnTarget(),
    '/return_types/asyncOrIterableReturnNullable':
        _i114.AsyncOrIterableReturnNullableTarget(),
    '/return_types/asyncOrListReturn': _i115.AsyncOrListReturnTarget(),
    '/return_types/asyncOrListReturnNullable':
        _i116.AsyncOrListReturnNullableTarget(),
    '/return_types/asyncOrMapReturn': _i117.AsyncOrMapReturnTarget(),
    '/return_types/asyncOrMapReturnNullable':
        _i118.AsyncOrMapReturnNullableTarget(),
    '/return_types/asyncOrSimpleClassReturnNullable':
        _i119.AsyncOrSimpleClassReturnNullableTarget(),
    '/return_types/asyncOrStringReturn': _i120.AsyncOrStringReturnTarget(),
    '/return_types/asyncOrStringReturnNullable':
        _i121.AsyncOrStringReturnNullableTarget(),
    '/return_types/asyncOrStructReturn': _i122.AsyncOrStructReturnTarget(),
    '/return_types/asyncOrStructReturnNullable':
        _i123.AsyncOrStructReturnNullableTarget(),
    '/return_types/asyncOrVoidReturn': _i124.AsyncOrVoidReturnTarget(),
    '/return_types/asyncOrVoidReturnNullable':
        _i125.AsyncOrVoidReturnNullableTarget(),
    '/return_types/asyncStringReturn': _i126.AsyncStringReturnTarget(),
    '/return_types/asyncStructReturn': _i127.AsyncStructReturnTarget(),
    '/return_types/asyncStructReturnNullable':
        _i128.AsyncStructReturnNullableTarget(),
    '/return_types/asyncVoidReturn': _i129.AsyncVoidReturnTarget(),
    '/return_types/boolReturn': _i130.BoolReturnTarget(),
    '/return_types/boolReturnNullable': _i131.BoolReturnNullableTarget(),
    '/return_types/complexClassReturn': _i132.ComplexClassReturnTarget(),
    '/return_types/complexClassReturnNullable':
        _i133.ComplexClassReturnNullableTarget(),
    '/return_types/complexReturn': _i134.ComplexReturnTarget(),
    '/return_types/complexReturnNullable': _i135.ComplexReturnNullableTarget(),
    '/return_types/doubleReturn': _i136.DoubleReturnTarget(),
    '/return_types/doubleReturnNullable': _i137.DoubleReturnNullableTarget(),
    '/return_types/intReturn': _i138.IntReturnTarget(),
    '/return_types/intReturnNullable': _i139.IntReturnNullableTarget(),
    '/return_types/iterableReturn': _i140.IterableReturnTarget(),
    '/return_types/iterableReturnNullable':
        _i141.IterableReturnNullableTarget(),
    '/return_types/listReturn': _i142.ListReturnTarget(),
    '/return_types/listReturnNullable': _i143.ListReturnNullableTarget(),
    '/return_types/mapReturn': _i144.MapReturnTarget(),
    '/return_types/mapReturnNullable': _i145.MapReturnNullableTarget(),
    '/return_types/simpleClassReturn': _i146.SimpleClassReturnTarget(),
    '/return_types/simpleClassReturnNullable':
        _i147.SimpleClassReturnNullableTarget(),
    '/return_types/stringReturn': _i148.StringReturnTarget(),
    '/return_types/stringReturnNullable': _i149.StringReturnNullableTarget(),
    '/return_types/structReturn': _i150.StructReturnTarget(),
    '/return_types/structReturnNullable': _i151.StructReturnNullableTarget(),
    '/return_types/voidReturn': _i152.VoidReturnTarget(),
    '/sealed_classes/area': _i153.AreaTarget(),
    '/sealed_classes/circle': _i154.CircleTarget(),
    '/sealed_classes/circleWithOverriddenCustomJson':
        _i155.CircleWithOverriddenCustomJsonTarget(),
    '/sealed_classes/rectangle': _i156.RectangleTarget(),
    '/sealed_classes/rectangleWithOverriddenCustomJson':
        _i157.RectangleWithOverriddenCustomJsonTarget(),
    '/sealed_classes/sealedClass': _i158.SealedClassTarget(),
    '/sealed_classes/sealedClassWithCustomJson':
        _i159.SealedClassWithCustomJsonTarget(),
    '/sealed_classes/sealedClassWithInheritedCustomJson':
        _i160.SealedClassWithInheritedCustomJsonTarget(),
    '/sealed_classes/sealedClassWithOverriddenCustomJson':
        _i161.SealedClassWithOverriddenCustomJsonTarget(),
  });
}
