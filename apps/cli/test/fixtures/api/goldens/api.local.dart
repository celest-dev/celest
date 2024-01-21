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
    '/anonymous-api/say-hello': _i2.SayHelloTarget(),
    '/anonymous-api/say-hello-authenticated': _i3.SayHelloAuthenticatedTarget(),
    '/anonymous-function/say-hello': _i4.SayHelloTarget(),
    '/anonymous-function/say-hello-authenticated':
        _i5.SayHelloAuthenticatedTarget(),
    '/api-auth-constant-variables/say-hello': _i6.SayHelloTarget(),
    '/api-auth-constant-variables/say-hello-authenticated':
        _i7.SayHelloAuthenticatedTarget(),
    '/authenticated-api/say-goodbye-authenticated':
        _i8.SayGoodbyeAuthenticatedTarget(),
    '/authenticated-api/say-hello-authenticated':
        _i9.SayHelloAuthenticatedTarget(),
    '/authenticated-function/say-hello': _i10.SayHelloTarget(),
    '/authenticated-function/say-hello-authenticated':
        _i11.SayHelloAuthenticatedTarget(),
    '/classes/async-default-values': _i12.AsyncDefaultValuesTarget(),
    '/classes/async-empty': _i13.AsyncEmptyTarget(),
    '/classes/async-fields': _i14.AsyncFieldsTarget(),
    '/classes/async-from-and-to-json': _i15.AsyncFromAndToJsonTarget(),
    '/classes/async-mixed-fields': _i16.AsyncMixedFieldsTarget(),
    '/classes/async-named-fields': _i17.AsyncNamedFieldsTarget(),
    '/classes/async-nested-class': _i18.AsyncNestedClassTarget(),
    '/classes/async-non-map-from-and-to-json':
        _i19.AsyncNonMapFromAndToJsonTarget(),
    '/classes/async-non-map-to-json': _i20.AsyncNonMapToJsonTarget(),
    '/classes/async-non-map-to-json-with-defaults':
        _i21.AsyncNonMapToJsonWithDefaultsTarget(),
    '/classes/async-nullable-fields': _i22.AsyncNullableFieldsTarget(),
    '/classes/async-only-from-json': _i23.AsyncOnlyFromJsonTarget(),
    '/classes/async-only-to-json': _i24.AsyncOnlyToJsonTarget(),
    '/classes/async-only-to-json-with-defaults':
        _i25.AsyncOnlyToJsonWithDefaultsTarget(),
    '/classes/default-values': _i26.DefaultValuesTarget(),
    '/classes/empty': _i27.EmptyTarget(),
    '/classes/fields': _i28.FieldsTarget(),
    '/classes/from-and-to-json': _i29.FromAndToJsonTarget(),
    '/classes/mixed-fields': _i30.MixedFieldsTarget(),
    '/classes/named-fields': _i31.NamedFieldsTarget(),
    '/classes/nested-class': _i32.NestedClassTarget(),
    '/classes/non-map-from-and-to-json': _i33.NonMapFromAndToJsonTarget(),
    '/classes/non-map-to-json': _i34.NonMapToJsonTarget(),
    '/classes/non-map-to-json-with-defaults':
        _i35.NonMapToJsonWithDefaultsTarget(),
    '/classes/nullable-fields': _i36.NullableFieldsTarget(),
    '/classes/only-from-json': _i37.OnlyFromJsonTarget(),
    '/classes/only-to-json': _i38.OnlyToJsonTarget(),
    '/classes/only-to-json-with-defaults': _i39.OnlyToJsonWithDefaultsTarget(),
    '/cycles/combine-trees': _i40.CombineTreesTarget(),
    '/cycles/create-tree': _i41.CreateTreeTarget(),
    '/cycles/print-tree': _i42.PrintTreeTarget(),
    '/cycles/self-referencing': _i43.SelfReferencingTarget(),
    '/exceptions/throws-custom-error': _i44.ThrowsCustomErrorTarget(),
    '/exceptions/throws-custom-error-to-from-json':
        _i45.ThrowsCustomErrorToFromJsonTarget(),
    '/exceptions/throws-custom-error-with-stack-trace':
        _i46.ThrowsCustomErrorWithStackTraceTarget(),
    '/exceptions/throws-custom-exception': _i47.ThrowsCustomExceptionTarget(),
    '/exceptions/throws-custom-exception-to-from-json':
        _i48.ThrowsCustomExceptionToFromJsonTarget(),
    '/exceptions/throws-error': _i49.ThrowsErrorTarget(),
    '/exceptions/throws-exception': _i50.ThrowsExceptionTarget(),
    '/generic-wrappers/generic-wrapper-parameters':
        _i51.GenericWrapperParametersTarget(),
    '/generic-wrappers/generic-wrappers': _i52.GenericWrappersTarget(),
    '/generic-wrappers/generic-wrappers-async':
        _i53.GenericWrappersAsyncTarget(),
    '/metadata/has-constructed-deprecated-annotation':
        _i54.HasConstructedDeprecatedAnnotationTarget(),
    '/metadata/has-deprecated-annotation': _i55.HasDeprecatedAnnotationTarget(),
    '/metadata/has-doc-comments': _i56.HasDocCommentsTarget(),
    '/metadata/has-exportable-annotation': _i57.HasExportableAnnotationTarget(),
    '/metadata/has-exportable-constructed-annotation':
        _i58.HasExportableConstructedAnnotationTarget(),
    '/metadata/has-literals-annotation': _i59.HasLiteralsAnnotationTarget(),
    '/metadata/has-named-constructed-annotation':
        _i60.HasNamedConstructedAnnotationTarget(),
    '/metadata/has-not-exportable-annotation':
        _i61.HasNotExportableAnnotationTarget(),
    '/metadata/has-not-exportable-constructed-annotation':
        _i62.HasNotExportableConstructedAnnotationTarget(),
    '/metadata/has-not-exportable-exportable-annotation':
        _i63.HasNotExportableExportableAnnotationTarget(),
    '/metadata/named-default-value-vars': _i64.NamedDefaultValueVarsTarget(),
    '/metadata/named-default-value-vars-private':
        _i65.NamedDefaultValueVarsPrivateTarget(),
    '/metadata/named-default-values': _i66.NamedDefaultValuesTarget(),
    '/metadata/nullable-named-default-value-vars':
        _i67.NullableNamedDefaultValueVarsTarget(),
    '/metadata/nullable-named-default-value-vars-private':
        _i68.NullableNamedDefaultValueVarsPrivateTarget(),
    '/metadata/nullable-named-default-values':
        _i69.NullableNamedDefaultValuesTarget(),
    '/metadata/nullable-positional-default-value-vars':
        _i70.NullablePositionalDefaultValueVarsTarget(),
    '/metadata/nullable-positional-default-value-vars-private':
        _i71.NullablePositionalDefaultValueVarsPrivateTarget(),
    '/metadata/nullable-positional-default-values':
        _i72.NullablePositionalDefaultValuesTarget(),
    '/metadata/positional-default-value-vars':
        _i73.PositionalDefaultValueVarsTarget(),
    '/metadata/positional-default-value-vars-private':
        _i74.PositionalDefaultValueVarsPrivateTarget(),
    '/metadata/positional-default-values': _i75.PositionalDefaultValuesTarget(),
    '/middleware/say-hello': _i76.SayHelloTarget(),
    '/parameter-types/complex': _i77.ComplexTarget(),
    '/parameter-types/simple': _i78.SimpleTarget(),
    '/parameter-types/simple-optional': _i79.SimpleOptionalTarget(),
    '/parameters/optional-named': _i80.OptionalNamedTarget(),
    '/parameters/optional-positional': _i81.OptionalPositionalTarget(),
    '/parameters/required-named': _i82.RequiredNamedTarget(),
    '/parameters/required-positional': _i83.RequiredPositionalTarget(),
    '/records/aliased-named-fields': _i84.AliasedNamedFieldsTarget(),
    '/records/async-aliased-named-fields': _i85.AsyncAliasedNamedFieldsTarget(),
    '/records/async-named-fields': _i86.AsyncNamedFieldsTarget(),
    '/records/async-nested': _i87.AsyncNestedTarget(),
    '/records/async-non-aliased-named-fields':
        _i88.AsyncNonAliasedNamedFieldsTarget(),
    '/records/async-nullable-nested': _i89.AsyncNullableNestedTarget(),
    '/records/named-fields': _i90.NamedFieldsTarget(),
    '/records/nested': _i91.NestedTarget(),
    '/records/non-aliased-named-fields': _i92.NonAliasedNamedFieldsTarget(),
    '/records/nullable-nested': _i93.NullableNestedTarget(),
    '/return-types/async-bool-return': _i94.AsyncBoolReturnTarget(),
    '/return-types/async-class-return-nullable':
        _i95.AsyncClassReturnNullableTarget(),
    '/return-types/async-complex-class-return':
        _i96.AsyncComplexClassReturnTarget(),
    '/return-types/async-complex-struct-return':
        _i97.AsyncComplexStructReturnTarget(),
    '/return-types/async-complex-struct-return-nullable':
        _i98.AsyncComplexStructReturnNullableTarget(),
    '/return-types/async-double-return': _i99.AsyncDoubleReturnTarget(),
    '/return-types/async-int-return': _i100.AsyncIntReturnTarget(),
    '/return-types/async-iterable-return': _i101.AsyncIterableReturnTarget(),
    '/return-types/async-list-return': _i102.AsyncListReturnTarget(),
    '/return-types/async-map-return': _i103.AsyncMapReturnTarget(),
    '/return-types/async-or-bool-return': _i104.AsyncOrBoolReturnTarget(),
    '/return-types/async-or-bool-return-nullable':
        _i105.AsyncOrBoolReturnNullableTarget(),
    '/return-types/async-or-complex-class-return-nullable':
        _i106.AsyncOrComplexClassReturnNullableTarget(),
    '/return-types/async-or-complex-struct-return':
        _i107.AsyncOrComplexStructReturnTarget(),
    '/return-types/async-or-complex-struct-return-nullable':
        _i108.AsyncOrComplexStructReturnNullableTarget(),
    '/return-types/async-or-double-return': _i109.AsyncOrDoubleReturnTarget(),
    '/return-types/async-or-double-return-nullable':
        _i110.AsyncOrDoubleReturnNullableTarget(),
    '/return-types/async-or-int-return': _i111.AsyncOrIntReturnTarget(),
    '/return-types/async-or-int-return-nullable':
        _i112.AsyncOrIntReturnNullableTarget(),
    '/return-types/async-or-iterable-return':
        _i113.AsyncOrIterableReturnTarget(),
    '/return-types/async-or-iterable-return-nullable':
        _i114.AsyncOrIterableReturnNullableTarget(),
    '/return-types/async-or-list-return': _i115.AsyncOrListReturnTarget(),
    '/return-types/async-or-list-return-nullable':
        _i116.AsyncOrListReturnNullableTarget(),
    '/return-types/async-or-map-return': _i117.AsyncOrMapReturnTarget(),
    '/return-types/async-or-map-return-nullable':
        _i118.AsyncOrMapReturnNullableTarget(),
    '/return-types/async-or-simple-class-return-nullable':
        _i119.AsyncOrSimpleClassReturnNullableTarget(),
    '/return-types/async-or-string-return': _i120.AsyncOrStringReturnTarget(),
    '/return-types/async-or-string-return-nullable':
        _i121.AsyncOrStringReturnNullableTarget(),
    '/return-types/async-or-struct-return': _i122.AsyncOrStructReturnTarget(),
    '/return-types/async-or-struct-return-nullable':
        _i123.AsyncOrStructReturnNullableTarget(),
    '/return-types/async-or-void-return': _i124.AsyncOrVoidReturnTarget(),
    '/return-types/async-or-void-return-nullable':
        _i125.AsyncOrVoidReturnNullableTarget(),
    '/return-types/async-string-return': _i126.AsyncStringReturnTarget(),
    '/return-types/async-struct-return': _i127.AsyncStructReturnTarget(),
    '/return-types/async-struct-return-nullable':
        _i128.AsyncStructReturnNullableTarget(),
    '/return-types/async-void-return': _i129.AsyncVoidReturnTarget(),
    '/return-types/bool-return': _i130.BoolReturnTarget(),
    '/return-types/bool-return-nullable': _i131.BoolReturnNullableTarget(),
    '/return-types/complex-class-return': _i132.ComplexClassReturnTarget(),
    '/return-types/complex-class-return-nullable':
        _i133.ComplexClassReturnNullableTarget(),
    '/return-types/complex-return': _i134.ComplexReturnTarget(),
    '/return-types/complex-return-nullable':
        _i135.ComplexReturnNullableTarget(),
    '/return-types/double-return': _i136.DoubleReturnTarget(),
    '/return-types/double-return-nullable': _i137.DoubleReturnNullableTarget(),
    '/return-types/int-return': _i138.IntReturnTarget(),
    '/return-types/int-return-nullable': _i139.IntReturnNullableTarget(),
    '/return-types/iterable-return': _i140.IterableReturnTarget(),
    '/return-types/iterable-return-nullable':
        _i141.IterableReturnNullableTarget(),
    '/return-types/list-return': _i142.ListReturnTarget(),
    '/return-types/list-return-nullable': _i143.ListReturnNullableTarget(),
    '/return-types/map-return': _i144.MapReturnTarget(),
    '/return-types/map-return-nullable': _i145.MapReturnNullableTarget(),
    '/return-types/simple-class-return': _i146.SimpleClassReturnTarget(),
    '/return-types/simple-class-return-nullable':
        _i147.SimpleClassReturnNullableTarget(),
    '/return-types/string-return': _i148.StringReturnTarget(),
    '/return-types/string-return-nullable': _i149.StringReturnNullableTarget(),
    '/return-types/struct-return': _i150.StructReturnTarget(),
    '/return-types/struct-return-nullable': _i151.StructReturnNullableTarget(),
    '/return-types/void-return': _i152.VoidReturnTarget(),
    '/sealed-classes/area': _i153.AreaTarget(),
    '/sealed-classes/circle': _i154.CircleTarget(),
    '/sealed-classes/circle-with-overridden-custom-json':
        _i155.CircleWithOverriddenCustomJsonTarget(),
    '/sealed-classes/rectangle': _i156.RectangleTarget(),
    '/sealed-classes/rectangle-with-overridden-custom-json':
        _i157.RectangleWithOverriddenCustomJsonTarget(),
    '/sealed-classes/sealed-class': _i158.SealedClassTarget(),
    '/sealed-classes/sealed-class-with-custom-json':
        _i159.SealedClassWithCustomJsonTarget(),
    '/sealed-classes/sealed-class-with-inherited-custom-json':
        _i160.SealedClassWithInheritedCustomJsonTarget(),
    '/sealed-classes/sealed-class-with-overridden-custom-json':
        _i161.SealedClassWithOverriddenCustomJsonTarget(),
  });
}
