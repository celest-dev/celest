// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;

import 'functions/classes/asyncDefaultValues.dart' as _i2;
import 'functions/classes/asyncEmpty.dart' as _i3;
import 'functions/classes/asyncFields.dart' as _i4;
import 'functions/classes/asyncFromAndToJson.dart' as _i5;
import 'functions/classes/asyncMixedFields.dart' as _i6;
import 'functions/classes/asyncNamedFields.dart' as _i7;
import 'functions/classes/asyncNestedClass.dart' as _i8;
import 'functions/classes/asyncNonMapFromAndToJson.dart' as _i9;
import 'functions/classes/asyncNonMapToJson.dart' as _i10;
import 'functions/classes/asyncNonMapToJsonWithDefaults.dart' as _i11;
import 'functions/classes/asyncNullableFields.dart' as _i12;
import 'functions/classes/asyncOnlyFromJson.dart' as _i13;
import 'functions/classes/asyncOnlyToJson.dart' as _i14;
import 'functions/classes/asyncOnlyToJsonWithDefaults.dart' as _i15;
import 'functions/classes/defaultValues.dart' as _i16;
import 'functions/classes/empty.dart' as _i17;
import 'functions/classes/fields.dart' as _i18;
import 'functions/classes/fromAndToJson.dart' as _i19;
import 'functions/classes/mixedFields.dart' as _i20;
import 'functions/classes/namedFields.dart' as _i21;
import 'functions/classes/nestedClass.dart' as _i22;
import 'functions/classes/nonMapFromAndToJson.dart' as _i23;
import 'functions/classes/nonMapToJson.dart' as _i24;
import 'functions/classes/nonMapToJsonWithDefaults.dart' as _i25;
import 'functions/classes/nullableFields.dart' as _i26;
import 'functions/classes/onlyFromJson.dart' as _i27;
import 'functions/classes/onlyToJson.dart' as _i28;
import 'functions/classes/onlyToJsonWithDefaults.dart' as _i29;
import 'functions/collections/complexList.dart' as _i30;
import 'functions/collections/complexMap.dart' as _i31;
import 'functions/collections/dynamicMap.dart' as _i32;
import 'functions/collections/objectMap.dart' as _i33;
import 'functions/collections/objectNullableMap.dart' as _i34;
import 'functions/collections/simpleList.dart' as _i35;
import 'functions/collections/simpleMap.dart' as _i36;
import 'functions/cycles/combineTrees.dart' as _i37;
import 'functions/cycles/createTree.dart' as _i38;
import 'functions/cycles/printTree.dart' as _i39;
import 'functions/cycles/selfReferencing.dart' as _i40;
import 'functions/exceptions/throwsCustomError.dart' as _i41;
import 'functions/exceptions/throwsCustomErrorToFromJson.dart' as _i42;
import 'functions/exceptions/throwsCustomErrorWithStackTrace.dart' as _i43;
import 'functions/exceptions/throwsCustomException.dart' as _i44;
import 'functions/exceptions/throwsCustomExceptionToFromJson.dart' as _i45;
import 'functions/exceptions/throwsError.dart' as _i46;
import 'functions/exceptions/throwsException.dart' as _i47;
import 'functions/generic_wrappers/genericWrapperParameters.dart' as _i48;
import 'functions/generic_wrappers/genericWrappers.dart' as _i49;
import 'functions/generic_wrappers/genericWrappersAsync.dart' as _i50;
import 'functions/metadata/hasConstructedDeprecatedAnnotation.dart' as _i51;
import 'functions/metadata/hasDeprecatedAnnotation.dart' as _i52;
import 'functions/metadata/hasDocComments.dart' as _i53;
import 'functions/metadata/hasExportableAnnotation.dart' as _i54;
import 'functions/metadata/hasExportableConstructedAnnotation.dart' as _i55;
import 'functions/metadata/hasLiteralsAnnotation.dart' as _i56;
import 'functions/metadata/hasNamedConstructedAnnotation.dart' as _i57;
import 'functions/metadata/hasNotExportableAnnotation.dart' as _i58;
import 'functions/metadata/namedDefaultValues.dart' as _i61;
import 'functions/metadata/namedDefaultValueVars.dart' as _i59;
import 'functions/metadata/namedDefaultValueVarsPrivate.dart' as _i60;
import 'functions/metadata/nullableNamedDefaultValues.dart' as _i64;
import 'functions/metadata/nullableNamedDefaultValueVars.dart' as _i62;
import 'functions/metadata/nullableNamedDefaultValueVarsPrivate.dart' as _i63;
import 'functions/metadata/nullablePositionalDefaultValues.dart' as _i67;
import 'functions/metadata/nullablePositionalDefaultValueVars.dart' as _i65;
import 'functions/metadata/nullablePositionalDefaultValueVarsPrivate.dart'
    as _i66;
import 'functions/metadata/positionalDefaultValues.dart' as _i70;
import 'functions/metadata/positionalDefaultValueVars.dart' as _i68;
import 'functions/metadata/positionalDefaultValueVarsPrivate.dart' as _i69;
import 'functions/parameter_types/complex.dart' as _i71;
import 'functions/parameter_types/simple.dart' as _i72;
import 'functions/parameter_types/simpleOptional.dart' as _i73;
import 'functions/parameters/optionalNamed.dart' as _i74;
import 'functions/parameters/optionalPositional.dart' as _i75;
import 'functions/parameters/requiredNamed.dart' as _i76;
import 'functions/parameters/requiredPositional.dart' as _i77;
import 'functions/records/aliasedNamedFields.dart' as _i78;
import 'functions/records/asyncAliasedNamedFields.dart' as _i79;
import 'functions/records/asyncNamedFields.dart' as _i80;
import 'functions/records/asyncNested.dart' as _i81;
import 'functions/records/asyncNonAliasedNamedFields.dart' as _i82;
import 'functions/records/asyncNullableNested.dart' as _i83;
import 'functions/records/namedFields.dart' as _i84;
import 'functions/records/nested.dart' as _i85;
import 'functions/records/nonAliasedNamedFields.dart' as _i86;
import 'functions/records/nullableNested.dart' as _i87;
import 'functions/return_types/asyncBoolReturn.dart' as _i88;
import 'functions/return_types/asyncClassReturnNullable.dart' as _i89;
import 'functions/return_types/asyncComplexClassReturn.dart' as _i90;
import 'functions/return_types/asyncComplexStructReturn.dart' as _i91;
import 'functions/return_types/asyncComplexStructReturnNullable.dart' as _i92;
import 'functions/return_types/asyncDoubleReturn.dart' as _i93;
import 'functions/return_types/asyncIntReturn.dart' as _i94;
import 'functions/return_types/asyncIterableReturn.dart' as _i95;
import 'functions/return_types/asyncListReturn.dart' as _i96;
import 'functions/return_types/asyncMapReturn.dart' as _i97;
import 'functions/return_types/asyncOrBoolReturn.dart' as _i98;
import 'functions/return_types/asyncOrBoolReturnNullable.dart' as _i99;
import 'functions/return_types/asyncOrComplexClassReturnNullable.dart' as _i100;
import 'functions/return_types/asyncOrComplexStructReturn.dart' as _i101;
import 'functions/return_types/asyncOrComplexStructReturnNullable.dart'
    as _i102;
import 'functions/return_types/asyncOrDoubleReturn.dart' as _i103;
import 'functions/return_types/asyncOrDoubleReturnNullable.dart' as _i104;
import 'functions/return_types/asyncOrIntReturn.dart' as _i105;
import 'functions/return_types/asyncOrIntReturnNullable.dart' as _i106;
import 'functions/return_types/asyncOrIterableReturn.dart' as _i107;
import 'functions/return_types/asyncOrIterableReturnNullable.dart' as _i108;
import 'functions/return_types/asyncOrListReturn.dart' as _i109;
import 'functions/return_types/asyncOrListReturnNullable.dart' as _i110;
import 'functions/return_types/asyncOrMapReturn.dart' as _i111;
import 'functions/return_types/asyncOrMapReturnNullable.dart' as _i112;
import 'functions/return_types/asyncOrSimpleClassReturnNullable.dart' as _i113;
import 'functions/return_types/asyncOrStringReturn.dart' as _i114;
import 'functions/return_types/asyncOrStringReturnNullable.dart' as _i115;
import 'functions/return_types/asyncOrStructReturn.dart' as _i116;
import 'functions/return_types/asyncOrStructReturnNullable.dart' as _i117;
import 'functions/return_types/asyncOrVoidReturn.dart' as _i118;
import 'functions/return_types/asyncOrVoidReturnNullable.dart' as _i119;
import 'functions/return_types/asyncStringReturn.dart' as _i120;
import 'functions/return_types/asyncStructReturn.dart' as _i121;
import 'functions/return_types/asyncStructReturnNullable.dart' as _i122;
import 'functions/return_types/asyncVoidReturn.dart' as _i123;
import 'functions/return_types/boolReturn.dart' as _i124;
import 'functions/return_types/boolReturnNullable.dart' as _i125;
import 'functions/return_types/complexClassReturn.dart' as _i126;
import 'functions/return_types/complexClassReturnNullable.dart' as _i127;
import 'functions/return_types/complexReturn.dart' as _i128;
import 'functions/return_types/complexReturnNullable.dart' as _i129;
import 'functions/return_types/doubleReturn.dart' as _i130;
import 'functions/return_types/doubleReturnNullable.dart' as _i131;
import 'functions/return_types/intReturn.dart' as _i132;
import 'functions/return_types/intReturnNullable.dart' as _i133;
import 'functions/return_types/iterableReturn.dart' as _i134;
import 'functions/return_types/iterableReturnNullable.dart' as _i135;
import 'functions/return_types/listReturn.dart' as _i136;
import 'functions/return_types/listReturnNullable.dart' as _i137;
import 'functions/return_types/mapReturn.dart' as _i138;
import 'functions/return_types/mapReturnNullable.dart' as _i139;
import 'functions/return_types/simpleClassReturn.dart' as _i140;
import 'functions/return_types/simpleClassReturnNullable.dart' as _i141;
import 'functions/return_types/stringReturn.dart' as _i142;
import 'functions/return_types/stringReturnNullable.dart' as _i143;
import 'functions/return_types/structReturn.dart' as _i144;
import 'functions/return_types/structReturnNullable.dart' as _i145;
import 'functions/return_types/voidReturn.dart' as _i146;
import 'functions/sealed_classes/aliasedErrShapeResults.dart' as _i147;
import 'functions/sealed_classes/aliasedOkShapeResults.dart' as _i148;
import 'functions/sealed_classes/aliasedShapeResults.dart' as _i149;
import 'functions/sealed_classes/area.dart' as _i150;
import 'functions/sealed_classes/circle.dart' as _i151;
import 'functions/sealed_classes/circleWithOverriddenCustomJson.dart' as _i152;
import 'functions/sealed_classes/errShapeResults.dart' as _i153;
import 'functions/sealed_classes/genericResult.dart' as _i154;
import 'functions/sealed_classes/multipleGenericResult.dart' as _i155;
import 'functions/sealed_classes/okShapeResults.dart' as _i156;
import 'functions/sealed_classes/rectangle.dart' as _i157;
import 'functions/sealed_classes/rectangleWithOverriddenCustomJson.dart'
    as _i158;
import 'functions/sealed_classes/sealedClass.dart' as _i159;
import 'functions/sealed_classes/sealedClassWithCustomJson.dart' as _i160;
import 'functions/sealed_classes/sealedClassWithInheritedCustomJson.dart'
    as _i161;
import 'functions/sealed_classes/sealedClassWithOverriddenCustomJson.dart'
    as _i162;
import 'functions/sealed_classes/shapeResults.dart' as _i163;
import 'functions/sealed_classes/swappedResult.dart' as _i164;

void main() {
  _i1.serve(targets: {
    '/classes/async-default-values': _i2.AsyncDefaultValuesTarget(),
    '/classes/async-empty': _i3.AsyncEmptyTarget(),
    '/classes/async-fields': _i4.AsyncFieldsTarget(),
    '/classes/async-from-and-to-json': _i5.AsyncFromAndToJsonTarget(),
    '/classes/async-mixed-fields': _i6.AsyncMixedFieldsTarget(),
    '/classes/async-named-fields': _i7.AsyncNamedFieldsTarget(),
    '/classes/async-nested-class': _i8.AsyncNestedClassTarget(),
    '/classes/async-non-map-from-and-to-json':
        _i9.AsyncNonMapFromAndToJsonTarget(),
    '/classes/async-non-map-to-json': _i10.AsyncNonMapToJsonTarget(),
    '/classes/async-non-map-to-json-with-defaults':
        _i11.AsyncNonMapToJsonWithDefaultsTarget(),
    '/classes/async-nullable-fields': _i12.AsyncNullableFieldsTarget(),
    '/classes/async-only-from-json': _i13.AsyncOnlyFromJsonTarget(),
    '/classes/async-only-to-json': _i14.AsyncOnlyToJsonTarget(),
    '/classes/async-only-to-json-with-defaults':
        _i15.AsyncOnlyToJsonWithDefaultsTarget(),
    '/classes/default-values': _i16.DefaultValuesTarget(),
    '/classes/empty': _i17.EmptyTarget(),
    '/classes/fields': _i18.FieldsTarget(),
    '/classes/from-and-to-json': _i19.FromAndToJsonTarget(),
    '/classes/mixed-fields': _i20.MixedFieldsTarget(),
    '/classes/named-fields': _i21.NamedFieldsTarget(),
    '/classes/nested-class': _i22.NestedClassTarget(),
    '/classes/non-map-from-and-to-json': _i23.NonMapFromAndToJsonTarget(),
    '/classes/non-map-to-json': _i24.NonMapToJsonTarget(),
    '/classes/non-map-to-json-with-defaults':
        _i25.NonMapToJsonWithDefaultsTarget(),
    '/classes/nullable-fields': _i26.NullableFieldsTarget(),
    '/classes/only-from-json': _i27.OnlyFromJsonTarget(),
    '/classes/only-to-json': _i28.OnlyToJsonTarget(),
    '/classes/only-to-json-with-defaults': _i29.OnlyToJsonWithDefaultsTarget(),
    '/collections/complex-list': _i30.ComplexListTarget(),
    '/collections/complex-map': _i31.ComplexMapTarget(),
    '/collections/dynamic-map': _i32.DynamicMapTarget(),
    '/collections/object-map': _i33.ObjectMapTarget(),
    '/collections/object-nullable-map': _i34.ObjectNullableMapTarget(),
    '/collections/simple-list': _i35.SimpleListTarget(),
    '/collections/simple-map': _i36.SimpleMapTarget(),
    '/cycles/combine-trees': _i37.CombineTreesTarget(),
    '/cycles/create-tree': _i38.CreateTreeTarget(),
    '/cycles/print-tree': _i39.PrintTreeTarget(),
    '/cycles/self-referencing': _i40.SelfReferencingTarget(),
    '/exceptions/throws-custom-error': _i41.ThrowsCustomErrorTarget(),
    '/exceptions/throws-custom-error-to-from-json':
        _i42.ThrowsCustomErrorToFromJsonTarget(),
    '/exceptions/throws-custom-error-with-stack-trace':
        _i43.ThrowsCustomErrorWithStackTraceTarget(),
    '/exceptions/throws-custom-exception': _i44.ThrowsCustomExceptionTarget(),
    '/exceptions/throws-custom-exception-to-from-json':
        _i45.ThrowsCustomExceptionToFromJsonTarget(),
    '/exceptions/throws-error': _i46.ThrowsErrorTarget(),
    '/exceptions/throws-exception': _i47.ThrowsExceptionTarget(),
    '/generic-wrappers/generic-wrapper-parameters':
        _i48.GenericWrapperParametersTarget(),
    '/generic-wrappers/generic-wrappers': _i49.GenericWrappersTarget(),
    '/generic-wrappers/generic-wrappers-async':
        _i50.GenericWrappersAsyncTarget(),
    '/metadata/has-constructed-deprecated-annotation':
        _i51.HasConstructedDeprecatedAnnotationTarget(),
    '/metadata/has-deprecated-annotation': _i52.HasDeprecatedAnnotationTarget(),
    '/metadata/has-doc-comments': _i53.HasDocCommentsTarget(),
    '/metadata/has-exportable-annotation': _i54.HasExportableAnnotationTarget(),
    '/metadata/has-exportable-constructed-annotation':
        _i55.HasExportableConstructedAnnotationTarget(),
    '/metadata/has-literals-annotation': _i56.HasLiteralsAnnotationTarget(),
    '/metadata/has-named-constructed-annotation':
        _i57.HasNamedConstructedAnnotationTarget(),
    '/metadata/has-not-exportable-annotation':
        _i58.HasNotExportableAnnotationTarget(),
    '/metadata/named-default-value-vars': _i59.NamedDefaultValueVarsTarget(),
    '/metadata/named-default-value-vars-private':
        _i60.NamedDefaultValueVarsPrivateTarget(),
    '/metadata/named-default-values': _i61.NamedDefaultValuesTarget(),
    '/metadata/nullable-named-default-value-vars':
        _i62.NullableNamedDefaultValueVarsTarget(),
    '/metadata/nullable-named-default-value-vars-private':
        _i63.NullableNamedDefaultValueVarsPrivateTarget(),
    '/metadata/nullable-named-default-values':
        _i64.NullableNamedDefaultValuesTarget(),
    '/metadata/nullable-positional-default-value-vars':
        _i65.NullablePositionalDefaultValueVarsTarget(),
    '/metadata/nullable-positional-default-value-vars-private':
        _i66.NullablePositionalDefaultValueVarsPrivateTarget(),
    '/metadata/nullable-positional-default-values':
        _i67.NullablePositionalDefaultValuesTarget(),
    '/metadata/positional-default-value-vars':
        _i68.PositionalDefaultValueVarsTarget(),
    '/metadata/positional-default-value-vars-private':
        _i69.PositionalDefaultValueVarsPrivateTarget(),
    '/metadata/positional-default-values': _i70.PositionalDefaultValuesTarget(),
    '/parameter-types/complex': _i71.ComplexTarget(),
    '/parameter-types/simple': _i72.SimpleTarget(),
    '/parameter-types/simple-optional': _i73.SimpleOptionalTarget(),
    '/parameters/optional-named': _i74.OptionalNamedTarget(),
    '/parameters/optional-positional': _i75.OptionalPositionalTarget(),
    '/parameters/required-named': _i76.RequiredNamedTarget(),
    '/parameters/required-positional': _i77.RequiredPositionalTarget(),
    '/records/aliased-named-fields': _i78.AliasedNamedFieldsTarget(),
    '/records/async-aliased-named-fields': _i79.AsyncAliasedNamedFieldsTarget(),
    '/records/async-named-fields': _i80.AsyncNamedFieldsTarget(),
    '/records/async-nested': _i81.AsyncNestedTarget(),
    '/records/async-non-aliased-named-fields':
        _i82.AsyncNonAliasedNamedFieldsTarget(),
    '/records/async-nullable-nested': _i83.AsyncNullableNestedTarget(),
    '/records/named-fields': _i84.NamedFieldsTarget(),
    '/records/nested': _i85.NestedTarget(),
    '/records/non-aliased-named-fields': _i86.NonAliasedNamedFieldsTarget(),
    '/records/nullable-nested': _i87.NullableNestedTarget(),
    '/return-types/async-bool-return': _i88.AsyncBoolReturnTarget(),
    '/return-types/async-class-return-nullable':
        _i89.AsyncClassReturnNullableTarget(),
    '/return-types/async-complex-class-return':
        _i90.AsyncComplexClassReturnTarget(),
    '/return-types/async-complex-struct-return':
        _i91.AsyncComplexStructReturnTarget(),
    '/return-types/async-complex-struct-return-nullable':
        _i92.AsyncComplexStructReturnNullableTarget(),
    '/return-types/async-double-return': _i93.AsyncDoubleReturnTarget(),
    '/return-types/async-int-return': _i94.AsyncIntReturnTarget(),
    '/return-types/async-iterable-return': _i95.AsyncIterableReturnTarget(),
    '/return-types/async-list-return': _i96.AsyncListReturnTarget(),
    '/return-types/async-map-return': _i97.AsyncMapReturnTarget(),
    '/return-types/async-or-bool-return': _i98.AsyncOrBoolReturnTarget(),
    '/return-types/async-or-bool-return-nullable':
        _i99.AsyncOrBoolReturnNullableTarget(),
    '/return-types/async-or-complex-class-return-nullable':
        _i100.AsyncOrComplexClassReturnNullableTarget(),
    '/return-types/async-or-complex-struct-return':
        _i101.AsyncOrComplexStructReturnTarget(),
    '/return-types/async-or-complex-struct-return-nullable':
        _i102.AsyncOrComplexStructReturnNullableTarget(),
    '/return-types/async-or-double-return': _i103.AsyncOrDoubleReturnTarget(),
    '/return-types/async-or-double-return-nullable':
        _i104.AsyncOrDoubleReturnNullableTarget(),
    '/return-types/async-or-int-return': _i105.AsyncOrIntReturnTarget(),
    '/return-types/async-or-int-return-nullable':
        _i106.AsyncOrIntReturnNullableTarget(),
    '/return-types/async-or-iterable-return':
        _i107.AsyncOrIterableReturnTarget(),
    '/return-types/async-or-iterable-return-nullable':
        _i108.AsyncOrIterableReturnNullableTarget(),
    '/return-types/async-or-list-return': _i109.AsyncOrListReturnTarget(),
    '/return-types/async-or-list-return-nullable':
        _i110.AsyncOrListReturnNullableTarget(),
    '/return-types/async-or-map-return': _i111.AsyncOrMapReturnTarget(),
    '/return-types/async-or-map-return-nullable':
        _i112.AsyncOrMapReturnNullableTarget(),
    '/return-types/async-or-simple-class-return-nullable':
        _i113.AsyncOrSimpleClassReturnNullableTarget(),
    '/return-types/async-or-string-return': _i114.AsyncOrStringReturnTarget(),
    '/return-types/async-or-string-return-nullable':
        _i115.AsyncOrStringReturnNullableTarget(),
    '/return-types/async-or-struct-return': _i116.AsyncOrStructReturnTarget(),
    '/return-types/async-or-struct-return-nullable':
        _i117.AsyncOrStructReturnNullableTarget(),
    '/return-types/async-or-void-return': _i118.AsyncOrVoidReturnTarget(),
    '/return-types/async-or-void-return-nullable':
        _i119.AsyncOrVoidReturnNullableTarget(),
    '/return-types/async-string-return': _i120.AsyncStringReturnTarget(),
    '/return-types/async-struct-return': _i121.AsyncStructReturnTarget(),
    '/return-types/async-struct-return-nullable':
        _i122.AsyncStructReturnNullableTarget(),
    '/return-types/async-void-return': _i123.AsyncVoidReturnTarget(),
    '/return-types/bool-return': _i124.BoolReturnTarget(),
    '/return-types/bool-return-nullable': _i125.BoolReturnNullableTarget(),
    '/return-types/complex-class-return': _i126.ComplexClassReturnTarget(),
    '/return-types/complex-class-return-nullable':
        _i127.ComplexClassReturnNullableTarget(),
    '/return-types/complex-return': _i128.ComplexReturnTarget(),
    '/return-types/complex-return-nullable':
        _i129.ComplexReturnNullableTarget(),
    '/return-types/double-return': _i130.DoubleReturnTarget(),
    '/return-types/double-return-nullable': _i131.DoubleReturnNullableTarget(),
    '/return-types/int-return': _i132.IntReturnTarget(),
    '/return-types/int-return-nullable': _i133.IntReturnNullableTarget(),
    '/return-types/iterable-return': _i134.IterableReturnTarget(),
    '/return-types/iterable-return-nullable':
        _i135.IterableReturnNullableTarget(),
    '/return-types/list-return': _i136.ListReturnTarget(),
    '/return-types/list-return-nullable': _i137.ListReturnNullableTarget(),
    '/return-types/map-return': _i138.MapReturnTarget(),
    '/return-types/map-return-nullable': _i139.MapReturnNullableTarget(),
    '/return-types/simple-class-return': _i140.SimpleClassReturnTarget(),
    '/return-types/simple-class-return-nullable':
        _i141.SimpleClassReturnNullableTarget(),
    '/return-types/string-return': _i142.StringReturnTarget(),
    '/return-types/string-return-nullable': _i143.StringReturnNullableTarget(),
    '/return-types/struct-return': _i144.StructReturnTarget(),
    '/return-types/struct-return-nullable': _i145.StructReturnNullableTarget(),
    '/return-types/void-return': _i146.VoidReturnTarget(),
    '/sealed-classes/aliased-err-shape-results':
        _i147.AliasedErrShapeResultsTarget(),
    '/sealed-classes/aliased-ok-shape-results':
        _i148.AliasedOkShapeResultsTarget(),
    '/sealed-classes/aliased-shape-results': _i149.AliasedShapeResultsTarget(),
    '/sealed-classes/area': _i150.AreaTarget(),
    '/sealed-classes/circle': _i151.CircleTarget(),
    '/sealed-classes/circle-with-overridden-custom-json':
        _i152.CircleWithOverriddenCustomJsonTarget(),
    '/sealed-classes/err-shape-results': _i153.ErrShapeResultsTarget(),
    '/sealed-classes/generic-result': _i154.GenericResultTarget(),
    '/sealed-classes/multiple-generic-result':
        _i155.MultipleGenericResultTarget(),
    '/sealed-classes/ok-shape-results': _i156.OkShapeResultsTarget(),
    '/sealed-classes/rectangle': _i157.RectangleTarget(),
    '/sealed-classes/rectangle-with-overridden-custom-json':
        _i158.RectangleWithOverriddenCustomJsonTarget(),
    '/sealed-classes/sealed-class': _i159.SealedClassTarget(),
    '/sealed-classes/sealed-class-with-custom-json':
        _i160.SealedClassWithCustomJsonTarget(),
    '/sealed-classes/sealed-class-with-inherited-custom-json':
        _i161.SealedClassWithInheritedCustomJsonTarget(),
    '/sealed-classes/sealed-class-with-overridden-custom-json':
        _i162.SealedClassWithOverriddenCustomJsonTarget(),
    '/sealed-classes/shape-results': _i163.ShapeResultsTarget(),
    '/sealed-classes/swapped-result': _i164.SwappedResultTarget(),
  });
}
