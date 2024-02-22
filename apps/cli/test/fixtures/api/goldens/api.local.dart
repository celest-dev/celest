// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;

import 'functions/asserts/assertsEnabled.dart' as _i2;
import 'functions/classes/asyncDefaultValues.dart' as _i3;
import 'functions/classes/asyncEmpty.dart' as _i4;
import 'functions/classes/asyncFields.dart' as _i5;
import 'functions/classes/asyncFromAndToJson.dart' as _i6;
import 'functions/classes/asyncMixedFields.dart' as _i7;
import 'functions/classes/asyncNamedFields.dart' as _i8;
import 'functions/classes/asyncNestedClass.dart' as _i9;
import 'functions/classes/asyncNonMapFromAndToJson.dart' as _i10;
import 'functions/classes/asyncNonMapToJson.dart' as _i11;
import 'functions/classes/asyncNonMapToJsonWithDefaults.dart' as _i12;
import 'functions/classes/asyncNullableFields.dart' as _i13;
import 'functions/classes/asyncOnlyFromJson.dart' as _i14;
import 'functions/classes/asyncOnlyToJson.dart' as _i15;
import 'functions/classes/asyncOnlyToJsonWithDefaults.dart' as _i16;
import 'functions/classes/defaultValues.dart' as _i17;
import 'functions/classes/empty.dart' as _i18;
import 'functions/classes/fields.dart' as _i19;
import 'functions/classes/fromAndToJson.dart' as _i20;
import 'functions/classes/fromJsonStatic.dart' as _i21;
import 'functions/classes/mixedFields.dart' as _i22;
import 'functions/classes/namedFields.dart' as _i23;
import 'functions/classes/nestedClass.dart' as _i24;
import 'functions/classes/nonMapFromAndToJson.dart' as _i25;
import 'functions/classes/nonMapToJson.dart' as _i26;
import 'functions/classes/nonMapToJsonWithDefaults.dart' as _i27;
import 'functions/classes/nullableFields.dart' as _i28;
import 'functions/classes/onlyFromJson.dart' as _i29;
import 'functions/classes/onlyToJson.dart' as _i30;
import 'functions/classes/onlyToJsonWithDefaults.dart' as _i31;
import 'functions/collections/complexList.dart' as _i32;
import 'functions/collections/complexMap.dart' as _i33;
import 'functions/collections/dynamicMap.dart' as _i34;
import 'functions/collections/objectMap.dart' as _i35;
import 'functions/collections/objectNullableMap.dart' as _i36;
import 'functions/collections/simpleList.dart' as _i37;
import 'functions/collections/simpleMap.dart' as _i38;
import 'functions/cycles/combineTrees.dart' as _i39;
import 'functions/cycles/createTree.dart' as _i40;
import 'functions/cycles/printTree.dart' as _i41;
import 'functions/cycles/selfReferencing.dart' as _i42;
import 'functions/exceptions/throwsCustomError.dart' as _i43;
import 'functions/exceptions/throwsCustomErrorToFromJson.dart' as _i44;
import 'functions/exceptions/throwsCustomErrorWithStackTrace.dart' as _i45;
import 'functions/exceptions/throwsCustomException.dart' as _i46;
import 'functions/exceptions/throwsCustomExceptionToFromJson.dart' as _i47;
import 'functions/exceptions/throwsError.dart' as _i48;
import 'functions/exceptions/throwsException.dart' as _i49;
import 'functions/extension_types/asyncOrString.dart' as _i50;
import 'functions/extension_types/asyncString.dart' as _i51;
import 'functions/extension_types/color.dart' as _i52;
import 'functions/extension_types/colorX.dart' as _i60;
import 'functions/extension_types/colorXFromJson.dart' as _i53;
import 'functions/extension_types/colorXFromJsonImpl.dart' as _i54;
import 'functions/extension_types/colorXFromJsonStatic.dart' as _i55;
import 'functions/extension_types/colorXImpl.dart' as _i56;
import 'functions/extension_types/colorXToFromJson.dart' as _i57;
import 'functions/extension_types/colorXToJson.dart' as _i58;
import 'functions/extension_types/colorXToJsonImpl.dart' as _i59;
import 'functions/extension_types/jsonBool.dart' as _i61;
import 'functions/extension_types/jsonDouble.dart' as _i62;
import 'functions/extension_types/jsonInt.dart' as _i63;
import 'functions/extension_types/jsonList.dart' as _i64;
import 'functions/extension_types/jsonMap.dart' as _i65;
import 'functions/extension_types/jsonNum.dart' as _i66;
import 'functions/extension_types/jsonString.dart' as _i67;
import 'functions/extension_types/jsonValue.dart' as _i68;
import 'functions/extension_types/nestedParent.dart' as _i69;
import 'functions/extension_types/nestedReset.dart' as _i70;
import 'functions/extension_types/string.dart' as _i71;
import 'functions/extension_types/stringFromJson.dart' as _i72;
import 'functions/extension_types/stringFromJsonImpl.dart' as _i73;
import 'functions/extension_types/stringFromJsonStatic.dart' as _i74;
import 'functions/extension_types/stringImpl.dart' as _i75;
import 'functions/extension_types/stringPrivateCtor.dart' as _i76;
import 'functions/extension_types/stringPrivateCtorImpl.dart' as _i77;
import 'functions/extension_types/stringPrivateField.dart' as _i78;
import 'functions/extension_types/stringPrivateFieldImpl.dart' as _i79;
import 'functions/extension_types/stringToFromJson.dart' as _i80;
import 'functions/extension_types/stringToJson.dart' as _i81;
import 'functions/extension_types/stringToJsonImpl.dart' as _i82;
import 'functions/extension_types/value.dart' as _i83;
import 'functions/extension_types/valueX.dart' as _i91;
import 'functions/extension_types/valueXFromJson.dart' as _i84;
import 'functions/extension_types/valueXFromJsonImpl.dart' as _i85;
import 'functions/extension_types/valueXFromJsonStatic.dart' as _i86;
import 'functions/extension_types/valueXImpl.dart' as _i87;
import 'functions/extension_types/valueXToFromJson.dart' as _i88;
import 'functions/extension_types/valueXToJson.dart' as _i89;
import 'functions/extension_types/valueXToJsonImpl.dart' as _i90;
import 'functions/generic_wrappers/genericWrapperParameters.dart' as _i92;
import 'functions/generic_wrappers/genericWrappers.dart' as _i93;
import 'functions/generic_wrappers/genericWrappersAsync.dart' as _i94;
import 'functions/metadata/hasConstructedDeprecatedAnnotation.dart' as _i95;
import 'functions/metadata/hasDeprecatedAnnotation.dart' as _i96;
import 'functions/metadata/hasDocComments.dart' as _i97;
import 'functions/metadata/hasExportableAnnotation.dart' as _i98;
import 'functions/metadata/hasExportableConstructedAnnotation.dart' as _i99;
import 'functions/metadata/hasLiteralsAnnotation.dart' as _i100;
import 'functions/metadata/hasNamedConstructedAnnotation.dart' as _i101;
import 'functions/metadata/hasNotExportableAnnotation.dart' as _i102;
import 'functions/metadata/namedDefaultValues.dart' as _i105;
import 'functions/metadata/namedDefaultValueVars.dart' as _i103;
import 'functions/metadata/namedDefaultValueVarsPrivate.dart' as _i104;
import 'functions/metadata/nullableNamedDefaultValues.dart' as _i108;
import 'functions/metadata/nullableNamedDefaultValueVars.dart' as _i106;
import 'functions/metadata/nullableNamedDefaultValueVarsPrivate.dart' as _i107;
import 'functions/metadata/nullablePositionalDefaultValues.dart' as _i111;
import 'functions/metadata/nullablePositionalDefaultValueVars.dart' as _i109;
import 'functions/metadata/nullablePositionalDefaultValueVarsPrivate.dart'
    as _i110;
import 'functions/metadata/positionalDefaultValues.dart' as _i114;
import 'functions/metadata/positionalDefaultValueVars.dart' as _i112;
import 'functions/metadata/positionalDefaultValueVarsPrivate.dart' as _i113;
import 'functions/parameter_types/complex.dart' as _i115;
import 'functions/parameter_types/simple.dart' as _i116;
import 'functions/parameter_types/simpleOptional.dart' as _i117;
import 'functions/parameters/optionalNamed.dart' as _i118;
import 'functions/parameters/optionalPositional.dart' as _i119;
import 'functions/parameters/requiredNamed.dart' as _i120;
import 'functions/parameters/requiredPositional.dart' as _i121;
import 'functions/records/aliasedNamedFields.dart' as _i122;
import 'functions/records/asyncAliasedNamedFields.dart' as _i123;
import 'functions/records/asyncNamedFields.dart' as _i124;
import 'functions/records/asyncNested.dart' as _i125;
import 'functions/records/asyncNonAliasedNamedFields.dart' as _i126;
import 'functions/records/asyncNullableNested.dart' as _i127;
import 'functions/records/namedFields.dart' as _i128;
import 'functions/records/nested.dart' as _i129;
import 'functions/records/nonAliasedNamedFields.dart' as _i130;
import 'functions/records/nullableNested.dart' as _i131;
import 'functions/return_types/asyncBoolReturn.dart' as _i132;
import 'functions/return_types/asyncClassReturnNullable.dart' as _i133;
import 'functions/return_types/asyncComplexClassReturn.dart' as _i134;
import 'functions/return_types/asyncComplexStructReturn.dart' as _i135;
import 'functions/return_types/asyncComplexStructReturnNullable.dart' as _i136;
import 'functions/return_types/asyncDoubleReturn.dart' as _i137;
import 'functions/return_types/asyncIntReturn.dart' as _i138;
import 'functions/return_types/asyncIterableReturn.dart' as _i139;
import 'functions/return_types/asyncListReturn.dart' as _i140;
import 'functions/return_types/asyncMapReturn.dart' as _i141;
import 'functions/return_types/asyncOrBoolReturn.dart' as _i142;
import 'functions/return_types/asyncOrBoolReturnNullable.dart' as _i143;
import 'functions/return_types/asyncOrComplexClassReturnNullable.dart' as _i144;
import 'functions/return_types/asyncOrComplexStructReturn.dart' as _i145;
import 'functions/return_types/asyncOrComplexStructReturnNullable.dart'
    as _i146;
import 'functions/return_types/asyncOrDoubleReturn.dart' as _i147;
import 'functions/return_types/asyncOrDoubleReturnNullable.dart' as _i148;
import 'functions/return_types/asyncOrIntReturn.dart' as _i149;
import 'functions/return_types/asyncOrIntReturnNullable.dart' as _i150;
import 'functions/return_types/asyncOrIterableReturn.dart' as _i151;
import 'functions/return_types/asyncOrIterableReturnNullable.dart' as _i152;
import 'functions/return_types/asyncOrListReturn.dart' as _i153;
import 'functions/return_types/asyncOrListReturnNullable.dart' as _i154;
import 'functions/return_types/asyncOrMapReturn.dart' as _i155;
import 'functions/return_types/asyncOrMapReturnNullable.dart' as _i156;
import 'functions/return_types/asyncOrSimpleClassReturnNullable.dart' as _i157;
import 'functions/return_types/asyncOrStringReturn.dart' as _i158;
import 'functions/return_types/asyncOrStringReturnNullable.dart' as _i159;
import 'functions/return_types/asyncOrStructReturn.dart' as _i160;
import 'functions/return_types/asyncOrStructReturnNullable.dart' as _i161;
import 'functions/return_types/asyncOrVoidReturn.dart' as _i162;
import 'functions/return_types/asyncOrVoidReturnNullable.dart' as _i163;
import 'functions/return_types/asyncStringReturn.dart' as _i164;
import 'functions/return_types/asyncStructReturn.dart' as _i165;
import 'functions/return_types/asyncStructReturnNullable.dart' as _i166;
import 'functions/return_types/asyncVoidReturn.dart' as _i167;
import 'functions/return_types/boolReturn.dart' as _i168;
import 'functions/return_types/boolReturnNullable.dart' as _i169;
import 'functions/return_types/complexClassReturn.dart' as _i170;
import 'functions/return_types/complexClassReturnNullable.dart' as _i171;
import 'functions/return_types/complexReturn.dart' as _i172;
import 'functions/return_types/complexReturnNullable.dart' as _i173;
import 'functions/return_types/doubleReturn.dart' as _i174;
import 'functions/return_types/doubleReturnNullable.dart' as _i175;
import 'functions/return_types/intReturn.dart' as _i176;
import 'functions/return_types/intReturnNullable.dart' as _i177;
import 'functions/return_types/iterableReturn.dart' as _i178;
import 'functions/return_types/iterableReturnNullable.dart' as _i179;
import 'functions/return_types/listReturn.dart' as _i180;
import 'functions/return_types/listReturnNullable.dart' as _i181;
import 'functions/return_types/mapReturn.dart' as _i182;
import 'functions/return_types/mapReturnNullable.dart' as _i183;
import 'functions/return_types/simpleClassReturn.dart' as _i184;
import 'functions/return_types/simpleClassReturnNullable.dart' as _i185;
import 'functions/return_types/stringReturn.dart' as _i186;
import 'functions/return_types/stringReturnNullable.dart' as _i187;
import 'functions/return_types/structReturn.dart' as _i188;
import 'functions/return_types/structReturnNullable.dart' as _i189;
import 'functions/return_types/voidReturn.dart' as _i190;
import 'functions/sealed_classes/aliasedErrShapeResults.dart' as _i191;
import 'functions/sealed_classes/aliasedOkShapeResults.dart' as _i192;
import 'functions/sealed_classes/aliasedShapeResults.dart' as _i193;
import 'functions/sealed_classes/area.dart' as _i194;
import 'functions/sealed_classes/circle.dart' as _i195;
import 'functions/sealed_classes/circleWithOverriddenCustomJson.dart' as _i196;
import 'functions/sealed_classes/errShapeResults.dart' as _i197;
import 'functions/sealed_classes/genericResult.dart' as _i198;
import 'functions/sealed_classes/multipleGenericResult.dart' as _i199;
import 'functions/sealed_classes/okShapeResult.dart' as _i200;
import 'functions/sealed_classes/okShapeResults.dart' as _i201;
import 'functions/sealed_classes/rectangle.dart' as _i202;
import 'functions/sealed_classes/rectangleWithOverriddenCustomJson.dart'
    as _i203;
import 'functions/sealed_classes/sealedClass.dart' as _i204;
import 'functions/sealed_classes/sealedClassWithCustomJson.dart' as _i205;
import 'functions/sealed_classes/sealedClassWithInheritedCustomJson.dart'
    as _i206;
import 'functions/sealed_classes/sealedClassWithOverriddenCustomJson.dart'
    as _i207;
import 'functions/sealed_classes/shapeResults.dart' as _i208;
import 'functions/sealed_classes/swappedResult.dart' as _i209;

void main() {
  _i1.serve(targets: {
    '/asserts/asserts-enabled': _i2.AssertsEnabledTarget(),
    '/classes/async-default-values': _i3.AsyncDefaultValuesTarget(),
    '/classes/async-empty': _i4.AsyncEmptyTarget(),
    '/classes/async-fields': _i5.AsyncFieldsTarget(),
    '/classes/async-from-and-to-json': _i6.AsyncFromAndToJsonTarget(),
    '/classes/async-mixed-fields': _i7.AsyncMixedFieldsTarget(),
    '/classes/async-named-fields': _i8.AsyncNamedFieldsTarget(),
    '/classes/async-nested-class': _i9.AsyncNestedClassTarget(),
    '/classes/async-non-map-from-and-to-json':
        _i10.AsyncNonMapFromAndToJsonTarget(),
    '/classes/async-non-map-to-json': _i11.AsyncNonMapToJsonTarget(),
    '/classes/async-non-map-to-json-with-defaults':
        _i12.AsyncNonMapToJsonWithDefaultsTarget(),
    '/classes/async-nullable-fields': _i13.AsyncNullableFieldsTarget(),
    '/classes/async-only-from-json': _i14.AsyncOnlyFromJsonTarget(),
    '/classes/async-only-to-json': _i15.AsyncOnlyToJsonTarget(),
    '/classes/async-only-to-json-with-defaults':
        _i16.AsyncOnlyToJsonWithDefaultsTarget(),
    '/classes/default-values': _i17.DefaultValuesTarget(),
    '/classes/empty': _i18.EmptyTarget(),
    '/classes/fields': _i19.FieldsTarget(),
    '/classes/from-and-to-json': _i20.FromAndToJsonTarget(),
    '/classes/from-json-static': _i21.FromJsonStaticTarget(),
    '/classes/mixed-fields': _i22.MixedFieldsTarget(),
    '/classes/named-fields': _i23.NamedFieldsTarget(),
    '/classes/nested-class': _i24.NestedClassTarget(),
    '/classes/non-map-from-and-to-json': _i25.NonMapFromAndToJsonTarget(),
    '/classes/non-map-to-json': _i26.NonMapToJsonTarget(),
    '/classes/non-map-to-json-with-defaults':
        _i27.NonMapToJsonWithDefaultsTarget(),
    '/classes/nullable-fields': _i28.NullableFieldsTarget(),
    '/classes/only-from-json': _i29.OnlyFromJsonTarget(),
    '/classes/only-to-json': _i30.OnlyToJsonTarget(),
    '/classes/only-to-json-with-defaults': _i31.OnlyToJsonWithDefaultsTarget(),
    '/collections/complex-list': _i32.ComplexListTarget(),
    '/collections/complex-map': _i33.ComplexMapTarget(),
    '/collections/dynamic-map': _i34.DynamicMapTarget(),
    '/collections/object-map': _i35.ObjectMapTarget(),
    '/collections/object-nullable-map': _i36.ObjectNullableMapTarget(),
    '/collections/simple-list': _i37.SimpleListTarget(),
    '/collections/simple-map': _i38.SimpleMapTarget(),
    '/cycles/combine-trees': _i39.CombineTreesTarget(),
    '/cycles/create-tree': _i40.CreateTreeTarget(),
    '/cycles/print-tree': _i41.PrintTreeTarget(),
    '/cycles/self-referencing': _i42.SelfReferencingTarget(),
    '/exceptions/throws-custom-error': _i43.ThrowsCustomErrorTarget(),
    '/exceptions/throws-custom-error-to-from-json':
        _i44.ThrowsCustomErrorToFromJsonTarget(),
    '/exceptions/throws-custom-error-with-stack-trace':
        _i45.ThrowsCustomErrorWithStackTraceTarget(),
    '/exceptions/throws-custom-exception': _i46.ThrowsCustomExceptionTarget(),
    '/exceptions/throws-custom-exception-to-from-json':
        _i47.ThrowsCustomExceptionToFromJsonTarget(),
    '/exceptions/throws-error': _i48.ThrowsErrorTarget(),
    '/exceptions/throws-exception': _i49.ThrowsExceptionTarget(),
    '/extension-types/async-or-string': _i50.AsyncOrStringTarget(),
    '/extension-types/async-string': _i51.AsyncStringTarget(),
    '/extension-types/color': _i52.ColorTarget(),
    '/extension-types/color-x-from-json': _i53.ColorXFromJsonTarget(),
    '/extension-types/color-x-from-json-impl': _i54.ColorXFromJsonImplTarget(),
    '/extension-types/color-x-from-json-static':
        _i55.ColorXFromJsonStaticTarget(),
    '/extension-types/color-x-impl': _i56.ColorXImplTarget(),
    '/extension-types/color-x-to-from-json': _i57.ColorXToFromJsonTarget(),
    '/extension-types/color-x-to-json': _i58.ColorXToJsonTarget(),
    '/extension-types/color-x-to-json-impl': _i59.ColorXToJsonImplTarget(),
    '/extension-types/colorx': _i60.ColorxTarget(),
    '/extension-types/json-bool': _i61.JsonBoolTarget(),
    '/extension-types/json-double': _i62.JsonDoubleTarget(),
    '/extension-types/json-int': _i63.JsonIntTarget(),
    '/extension-types/json-list': _i64.JsonListTarget(),
    '/extension-types/json-map': _i65.JsonMapTarget(),
    '/extension-types/json-num': _i66.JsonNumTarget(),
    '/extension-types/json-string': _i67.JsonStringTarget(),
    '/extension-types/json-value': _i68.JsonValueTarget(),
    '/extension-types/nested-parent': _i69.NestedParentTarget(),
    '/extension-types/nested-reset': _i70.NestedResetTarget(),
    '/extension-types/string': _i71.StringTarget(),
    '/extension-types/string-from-json': _i72.StringFromJsonTarget(),
    '/extension-types/string-from-json-impl': _i73.StringFromJsonImplTarget(),
    '/extension-types/string-from-json-static':
        _i74.StringFromJsonStaticTarget(),
    '/extension-types/string-impl': _i75.StringImplTarget(),
    '/extension-types/string-private-ctor': _i76.StringPrivateCtorTarget(),
    '/extension-types/string-private-ctor-impl':
        _i77.StringPrivateCtorImplTarget(),
    '/extension-types/string-private-field': _i78.StringPrivateFieldTarget(),
    '/extension-types/string-private-field-impl':
        _i79.StringPrivateFieldImplTarget(),
    '/extension-types/string-to-from-json': _i80.StringToFromJsonTarget(),
    '/extension-types/string-to-json': _i81.StringToJsonTarget(),
    '/extension-types/string-to-json-impl': _i82.StringToJsonImplTarget(),
    '/extension-types/value': _i83.ValueTarget(),
    '/extension-types/value-x-from-json': _i84.ValueXFromJsonTarget(),
    '/extension-types/value-x-from-json-impl': _i85.ValueXFromJsonImplTarget(),
    '/extension-types/value-x-from-json-static':
        _i86.ValueXFromJsonStaticTarget(),
    '/extension-types/value-x-impl': _i87.ValueXImplTarget(),
    '/extension-types/value-x-to-from-json': _i88.ValueXToFromJsonTarget(),
    '/extension-types/value-x-to-json': _i89.ValueXToJsonTarget(),
    '/extension-types/value-x-to-json-impl': _i90.ValueXToJsonImplTarget(),
    '/extension-types/valuex': _i91.ValuexTarget(),
    '/generic-wrappers/generic-wrapper-parameters':
        _i92.GenericWrapperParametersTarget(),
    '/generic-wrappers/generic-wrappers': _i93.GenericWrappersTarget(),
    '/generic-wrappers/generic-wrappers-async':
        _i94.GenericWrappersAsyncTarget(),
    '/metadata/has-constructed-deprecated-annotation':
        _i95.HasConstructedDeprecatedAnnotationTarget(),
    '/metadata/has-deprecated-annotation': _i96.HasDeprecatedAnnotationTarget(),
    '/metadata/has-doc-comments': _i97.HasDocCommentsTarget(),
    '/metadata/has-exportable-annotation': _i98.HasExportableAnnotationTarget(),
    '/metadata/has-exportable-constructed-annotation':
        _i99.HasExportableConstructedAnnotationTarget(),
    '/metadata/has-literals-annotation': _i100.HasLiteralsAnnotationTarget(),
    '/metadata/has-named-constructed-annotation':
        _i101.HasNamedConstructedAnnotationTarget(),
    '/metadata/has-not-exportable-annotation':
        _i102.HasNotExportableAnnotationTarget(),
    '/metadata/named-default-value-vars': _i103.NamedDefaultValueVarsTarget(),
    '/metadata/named-default-value-vars-private':
        _i104.NamedDefaultValueVarsPrivateTarget(),
    '/metadata/named-default-values': _i105.NamedDefaultValuesTarget(),
    '/metadata/nullable-named-default-value-vars':
        _i106.NullableNamedDefaultValueVarsTarget(),
    '/metadata/nullable-named-default-value-vars-private':
        _i107.NullableNamedDefaultValueVarsPrivateTarget(),
    '/metadata/nullable-named-default-values':
        _i108.NullableNamedDefaultValuesTarget(),
    '/metadata/nullable-positional-default-value-vars':
        _i109.NullablePositionalDefaultValueVarsTarget(),
    '/metadata/nullable-positional-default-value-vars-private':
        _i110.NullablePositionalDefaultValueVarsPrivateTarget(),
    '/metadata/nullable-positional-default-values':
        _i111.NullablePositionalDefaultValuesTarget(),
    '/metadata/positional-default-value-vars':
        _i112.PositionalDefaultValueVarsTarget(),
    '/metadata/positional-default-value-vars-private':
        _i113.PositionalDefaultValueVarsPrivateTarget(),
    '/metadata/positional-default-values':
        _i114.PositionalDefaultValuesTarget(),
    '/parameter-types/complex': _i115.ComplexTarget(),
    '/parameter-types/simple': _i116.SimpleTarget(),
    '/parameter-types/simple-optional': _i117.SimpleOptionalTarget(),
    '/parameters/optional-named': _i118.OptionalNamedTarget(),
    '/parameters/optional-positional': _i119.OptionalPositionalTarget(),
    '/parameters/required-named': _i120.RequiredNamedTarget(),
    '/parameters/required-positional': _i121.RequiredPositionalTarget(),
    '/records/aliased-named-fields': _i122.AliasedNamedFieldsTarget(),
    '/records/async-aliased-named-fields':
        _i123.AsyncAliasedNamedFieldsTarget(),
    '/records/async-named-fields': _i124.AsyncNamedFieldsTarget(),
    '/records/async-nested': _i125.AsyncNestedTarget(),
    '/records/async-non-aliased-named-fields':
        _i126.AsyncNonAliasedNamedFieldsTarget(),
    '/records/async-nullable-nested': _i127.AsyncNullableNestedTarget(),
    '/records/named-fields': _i128.NamedFieldsTarget(),
    '/records/nested': _i129.NestedTarget(),
    '/records/non-aliased-named-fields': _i130.NonAliasedNamedFieldsTarget(),
    '/records/nullable-nested': _i131.NullableNestedTarget(),
    '/return-types/async-bool-return': _i132.AsyncBoolReturnTarget(),
    '/return-types/async-class-return-nullable':
        _i133.AsyncClassReturnNullableTarget(),
    '/return-types/async-complex-class-return':
        _i134.AsyncComplexClassReturnTarget(),
    '/return-types/async-complex-struct-return':
        _i135.AsyncComplexStructReturnTarget(),
    '/return-types/async-complex-struct-return-nullable':
        _i136.AsyncComplexStructReturnNullableTarget(),
    '/return-types/async-double-return': _i137.AsyncDoubleReturnTarget(),
    '/return-types/async-int-return': _i138.AsyncIntReturnTarget(),
    '/return-types/async-iterable-return': _i139.AsyncIterableReturnTarget(),
    '/return-types/async-list-return': _i140.AsyncListReturnTarget(),
    '/return-types/async-map-return': _i141.AsyncMapReturnTarget(),
    '/return-types/async-or-bool-return': _i142.AsyncOrBoolReturnTarget(),
    '/return-types/async-or-bool-return-nullable':
        _i143.AsyncOrBoolReturnNullableTarget(),
    '/return-types/async-or-complex-class-return-nullable':
        _i144.AsyncOrComplexClassReturnNullableTarget(),
    '/return-types/async-or-complex-struct-return':
        _i145.AsyncOrComplexStructReturnTarget(),
    '/return-types/async-or-complex-struct-return-nullable':
        _i146.AsyncOrComplexStructReturnNullableTarget(),
    '/return-types/async-or-double-return': _i147.AsyncOrDoubleReturnTarget(),
    '/return-types/async-or-double-return-nullable':
        _i148.AsyncOrDoubleReturnNullableTarget(),
    '/return-types/async-or-int-return': _i149.AsyncOrIntReturnTarget(),
    '/return-types/async-or-int-return-nullable':
        _i150.AsyncOrIntReturnNullableTarget(),
    '/return-types/async-or-iterable-return':
        _i151.AsyncOrIterableReturnTarget(),
    '/return-types/async-or-iterable-return-nullable':
        _i152.AsyncOrIterableReturnNullableTarget(),
    '/return-types/async-or-list-return': _i153.AsyncOrListReturnTarget(),
    '/return-types/async-or-list-return-nullable':
        _i154.AsyncOrListReturnNullableTarget(),
    '/return-types/async-or-map-return': _i155.AsyncOrMapReturnTarget(),
    '/return-types/async-or-map-return-nullable':
        _i156.AsyncOrMapReturnNullableTarget(),
    '/return-types/async-or-simple-class-return-nullable':
        _i157.AsyncOrSimpleClassReturnNullableTarget(),
    '/return-types/async-or-string-return': _i158.AsyncOrStringReturnTarget(),
    '/return-types/async-or-string-return-nullable':
        _i159.AsyncOrStringReturnNullableTarget(),
    '/return-types/async-or-struct-return': _i160.AsyncOrStructReturnTarget(),
    '/return-types/async-or-struct-return-nullable':
        _i161.AsyncOrStructReturnNullableTarget(),
    '/return-types/async-or-void-return': _i162.AsyncOrVoidReturnTarget(),
    '/return-types/async-or-void-return-nullable':
        _i163.AsyncOrVoidReturnNullableTarget(),
    '/return-types/async-string-return': _i164.AsyncStringReturnTarget(),
    '/return-types/async-struct-return': _i165.AsyncStructReturnTarget(),
    '/return-types/async-struct-return-nullable':
        _i166.AsyncStructReturnNullableTarget(),
    '/return-types/async-void-return': _i167.AsyncVoidReturnTarget(),
    '/return-types/bool-return': _i168.BoolReturnTarget(),
    '/return-types/bool-return-nullable': _i169.BoolReturnNullableTarget(),
    '/return-types/complex-class-return': _i170.ComplexClassReturnTarget(),
    '/return-types/complex-class-return-nullable':
        _i171.ComplexClassReturnNullableTarget(),
    '/return-types/complex-return': _i172.ComplexReturnTarget(),
    '/return-types/complex-return-nullable':
        _i173.ComplexReturnNullableTarget(),
    '/return-types/double-return': _i174.DoubleReturnTarget(),
    '/return-types/double-return-nullable': _i175.DoubleReturnNullableTarget(),
    '/return-types/int-return': _i176.IntReturnTarget(),
    '/return-types/int-return-nullable': _i177.IntReturnNullableTarget(),
    '/return-types/iterable-return': _i178.IterableReturnTarget(),
    '/return-types/iterable-return-nullable':
        _i179.IterableReturnNullableTarget(),
    '/return-types/list-return': _i180.ListReturnTarget(),
    '/return-types/list-return-nullable': _i181.ListReturnNullableTarget(),
    '/return-types/map-return': _i182.MapReturnTarget(),
    '/return-types/map-return-nullable': _i183.MapReturnNullableTarget(),
    '/return-types/simple-class-return': _i184.SimpleClassReturnTarget(),
    '/return-types/simple-class-return-nullable':
        _i185.SimpleClassReturnNullableTarget(),
    '/return-types/string-return': _i186.StringReturnTarget(),
    '/return-types/string-return-nullable': _i187.StringReturnNullableTarget(),
    '/return-types/struct-return': _i188.StructReturnTarget(),
    '/return-types/struct-return-nullable': _i189.StructReturnNullableTarget(),
    '/return-types/void-return': _i190.VoidReturnTarget(),
    '/sealed-classes/aliased-err-shape-results':
        _i191.AliasedErrShapeResultsTarget(),
    '/sealed-classes/aliased-ok-shape-results':
        _i192.AliasedOkShapeResultsTarget(),
    '/sealed-classes/aliased-shape-results': _i193.AliasedShapeResultsTarget(),
    '/sealed-classes/area': _i194.AreaTarget(),
    '/sealed-classes/circle': _i195.CircleTarget(),
    '/sealed-classes/circle-with-overridden-custom-json':
        _i196.CircleWithOverriddenCustomJsonTarget(),
    '/sealed-classes/err-shape-results': _i197.ErrShapeResultsTarget(),
    '/sealed-classes/generic-result': _i198.GenericResultTarget(),
    '/sealed-classes/multiple-generic-result':
        _i199.MultipleGenericResultTarget(),
    '/sealed-classes/ok-shape-result': _i200.OkShapeResultTarget(),
    '/sealed-classes/ok-shape-results': _i201.OkShapeResultsTarget(),
    '/sealed-classes/rectangle': _i202.RectangleTarget(),
    '/sealed-classes/rectangle-with-overridden-custom-json':
        _i203.RectangleWithOverriddenCustomJsonTarget(),
    '/sealed-classes/sealed-class': _i204.SealedClassTarget(),
    '/sealed-classes/sealed-class-with-custom-json':
        _i205.SealedClassWithCustomJsonTarget(),
    '/sealed-classes/sealed-class-with-inherited-custom-json':
        _i206.SealedClassWithInheritedCustomJsonTarget(),
    '/sealed-classes/sealed-class-with-overridden-custom-json':
        _i207.SealedClassWithOverriddenCustomJsonTarget(),
    '/sealed-classes/shape-results': _i208.ShapeResultsTarget(),
    '/sealed-classes/swapped-result': _i209.SwappedResultTarget(),
  });
}
