// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

library;

import 'package:celest/celest.dart';

abstract final class Apis {
  static const asserts = CloudApi(name: r'asserts');

  static const classes = CloudApi(name: r'classes');

  static const collections = CloudApi(name: r'collections');

  static const cycles = CloudApi(name: r'cycles');

  static const exceptions = CloudApi(name: r'exceptions');

  static const extensionTypes = CloudApi(name: r'extension_types');

  static const genericWrappers = CloudApi(name: r'generic_wrappers');

  static const metadata = CloudApi(name: r'metadata');

  static const parameterTypes = CloudApi(name: r'parameter_types');

  static const parameters = CloudApi(name: r'parameters');

  static const records = CloudApi(name: r'records');

  static const returnTypes = CloudApi(name: r'return_types');

  static const sealedClasses = CloudApi(name: r'sealed_classes');
}

abstract final class Functions {
  static const assertsAssertsEnabled = CloudFunction(
    api: r'asserts',
    functionName: r'assertsEnabled',
  );

  static const classesAsyncDefaultValues = CloudFunction(
    api: r'classes',
    functionName: r'asyncDefaultValues',
  );

  static const classesAsyncEmpty = CloudFunction(
    api: r'classes',
    functionName: r'asyncEmpty',
  );

  static const classesAsyncFields = CloudFunction(
    api: r'classes',
    functionName: r'asyncFields',
  );

  static const classesAsyncFromAndToJson = CloudFunction(
    api: r'classes',
    functionName: r'asyncFromAndToJson',
  );

  static const classesAsyncMixedFields = CloudFunction(
    api: r'classes',
    functionName: r'asyncMixedFields',
  );

  static const classesAsyncNamedFields = CloudFunction(
    api: r'classes',
    functionName: r'asyncNamedFields',
  );

  static const classesAsyncNestedClass = CloudFunction(
    api: r'classes',
    functionName: r'asyncNestedClass',
  );

  static const classesAsyncNonMapFromAndToJson = CloudFunction(
    api: r'classes',
    functionName: r'asyncNonMapFromAndToJson',
  );

  static const classesAsyncNonMapToJson = CloudFunction(
    api: r'classes',
    functionName: r'asyncNonMapToJson',
  );

  static const classesAsyncNonMapToJsonWithDefaults = CloudFunction(
    api: r'classes',
    functionName: r'asyncNonMapToJsonWithDefaults',
  );

  static const classesAsyncNullableFields = CloudFunction(
    api: r'classes',
    functionName: r'asyncNullableFields',
  );

  static const classesAsyncOnlyFromJson = CloudFunction(
    api: r'classes',
    functionName: r'asyncOnlyFromJson',
  );

  static const classesAsyncOnlyToJson = CloudFunction(
    api: r'classes',
    functionName: r'asyncOnlyToJson',
  );

  static const classesAsyncOnlyToJsonWithDefaults = CloudFunction(
    api: r'classes',
    functionName: r'asyncOnlyToJsonWithDefaults',
  );

  static const classesDefaultValues = CloudFunction(
    api: r'classes',
    functionName: r'defaultValues',
  );

  static const classesEmpty = CloudFunction(
    api: r'classes',
    functionName: r'empty',
  );

  static const classesFields = CloudFunction(
    api: r'classes',
    functionName: r'fields',
  );

  static const classesFromAndToJson = CloudFunction(
    api: r'classes',
    functionName: r'fromAndToJson',
  );

  static const classesFromJsonStatic = CloudFunction(
    api: r'classes',
    functionName: r'fromJsonStatic',
  );

  static const classesMixedFields = CloudFunction(
    api: r'classes',
    functionName: r'mixedFields',
  );

  static const classesNamedFields = CloudFunction(
    api: r'classes',
    functionName: r'namedFields',
  );

  static const classesNestedClass = CloudFunction(
    api: r'classes',
    functionName: r'nestedClass',
  );

  static const classesNonMapFromAndToJson = CloudFunction(
    api: r'classes',
    functionName: r'nonMapFromAndToJson',
  );

  static const classesNonMapToJson = CloudFunction(
    api: r'classes',
    functionName: r'nonMapToJson',
  );

  static const classesNonMapToJsonWithDefaults = CloudFunction(
    api: r'classes',
    functionName: r'nonMapToJsonWithDefaults',
  );

  static const classesNullableFields = CloudFunction(
    api: r'classes',
    functionName: r'nullableFields',
  );

  static const classesOnlyFromJson = CloudFunction(
    api: r'classes',
    functionName: r'onlyFromJson',
  );

  static const classesOnlyToJson = CloudFunction(
    api: r'classes',
    functionName: r'onlyToJson',
  );

  static const classesOnlyToJsonWithDefaults = CloudFunction(
    api: r'classes',
    functionName: r'onlyToJsonWithDefaults',
  );

  static const collectionsComplexList = CloudFunction(
    api: r'collections',
    functionName: r'complexList',
  );

  static const collectionsComplexMap = CloudFunction(
    api: r'collections',
    functionName: r'complexMap',
  );

  static const collectionsSimpleList = CloudFunction(
    api: r'collections',
    functionName: r'simpleList',
  );

  static const collectionsSimpleMap = CloudFunction(
    api: r'collections',
    functionName: r'simpleMap',
  );

  static const cyclesCombineTrees = CloudFunction(
    api: r'cycles',
    functionName: r'combineTrees',
  );

  static const cyclesCreateTree = CloudFunction(
    api: r'cycles',
    functionName: r'createTree',
  );

  static const cyclesPrintTree = CloudFunction(
    api: r'cycles',
    functionName: r'printTree',
  );

  static const cyclesSelfReferencing = CloudFunction(
    api: r'cycles',
    functionName: r'selfReferencing',
  );

  static const exceptionsThrowsCustomError = CloudFunction(
    api: r'exceptions',
    functionName: r'throwsCustomError',
  );

  static const exceptionsThrowsCustomErrorToFromJson = CloudFunction(
    api: r'exceptions',
    functionName: r'throwsCustomErrorToFromJson',
  );

  static const exceptionsThrowsCustomErrorWithStackTrace = CloudFunction(
    api: r'exceptions',
    functionName: r'throwsCustomErrorWithStackTrace',
  );

  static const exceptionsThrowsCustomException = CloudFunction(
    api: r'exceptions',
    functionName: r'throwsCustomException',
  );

  static const exceptionsThrowsCustomExceptionToFromJson = CloudFunction(
    api: r'exceptions',
    functionName: r'throwsCustomExceptionToFromJson',
  );

  static const exceptionsThrowsError = CloudFunction(
    api: r'exceptions',
    functionName: r'throwsError',
  );

  static const exceptionsThrowsException = CloudFunction(
    api: r'exceptions',
    functionName: r'throwsException',
  );

  static const extensionTypesAsyncOrString = CloudFunction(
    api: r'extension_types',
    functionName: r'asyncOrString',
  );

  static const extensionTypesAsyncString = CloudFunction(
    api: r'extension_types',
    functionName: r'asyncString',
  );

  static const extensionTypesJsonBool = CloudFunction(
    api: r'extension_types',
    functionName: r'jsonBool',
  );

  static const extensionTypesJsonDouble = CloudFunction(
    api: r'extension_types',
    functionName: r'jsonDouble',
  );

  static const extensionTypesJsonInt = CloudFunction(
    api: r'extension_types',
    functionName: r'jsonInt',
  );

  static const extensionTypesJsonList = CloudFunction(
    api: r'extension_types',
    functionName: r'jsonList',
  );

  static const extensionTypesJsonMap = CloudFunction(
    api: r'extension_types',
    functionName: r'jsonMap',
  );

  static const extensionTypesJsonNum = CloudFunction(
    api: r'extension_types',
    functionName: r'jsonNum',
  );

  static const extensionTypesJsonString = CloudFunction(
    api: r'extension_types',
    functionName: r'jsonString',
  );

  static const extensionTypesJsonValue = CloudFunction(
    api: r'extension_types',
    functionName: r'jsonValue',
  );

  static const extensionTypesString = CloudFunction(
    api: r'extension_types',
    functionName: r'string',
  );

  static const extensionTypesStringFromJson = CloudFunction(
    api: r'extension_types',
    functionName: r'stringFromJson',
  );

  static const extensionTypesStringFromJsonImpl = CloudFunction(
    api: r'extension_types',
    functionName: r'stringFromJsonImpl',
  );

  static const extensionTypesStringFromJsonStatic = CloudFunction(
    api: r'extension_types',
    functionName: r'stringFromJsonStatic',
  );

  static const extensionTypesStringImpl = CloudFunction(
    api: r'extension_types',
    functionName: r'stringImpl',
  );

  static const extensionTypesStringPrivateCtor = CloudFunction(
    api: r'extension_types',
    functionName: r'stringPrivateCtor',
  );

  static const extensionTypesStringPrivateCtorImpl = CloudFunction(
    api: r'extension_types',
    functionName: r'stringPrivateCtorImpl',
  );

  static const extensionTypesStringPrivateField = CloudFunction(
    api: r'extension_types',
    functionName: r'stringPrivateField',
  );

  static const extensionTypesStringPrivateFieldImpl = CloudFunction(
    api: r'extension_types',
    functionName: r'stringPrivateFieldImpl',
  );

  static const extensionTypesStringToFromJson = CloudFunction(
    api: r'extension_types',
    functionName: r'stringToFromJson',
  );

  static const extensionTypesStringToJson = CloudFunction(
    api: r'extension_types',
    functionName: r'stringToJson',
  );

  static const extensionTypesStringToJsonImpl = CloudFunction(
    api: r'extension_types',
    functionName: r'stringToJsonImpl',
  );

  static const extensionTypesValue = CloudFunction(
    api: r'extension_types',
    functionName: r'value',
  );

  static const extensionTypesValueXFromJson = CloudFunction(
    api: r'extension_types',
    functionName: r'valueXFromJson',
  );

  static const extensionTypesValueXFromJsonImpl = CloudFunction(
    api: r'extension_types',
    functionName: r'valueXFromJsonImpl',
  );

  static const extensionTypesValueXFromJsonStatic = CloudFunction(
    api: r'extension_types',
    functionName: r'valueXFromJsonStatic',
  );

  static const extensionTypesValueXImpl = CloudFunction(
    api: r'extension_types',
    functionName: r'valueXImpl',
  );

  static const extensionTypesValueXToFromJson = CloudFunction(
    api: r'extension_types',
    functionName: r'valueXToFromJson',
  );

  static const extensionTypesValueXToJson = CloudFunction(
    api: r'extension_types',
    functionName: r'valueXToJson',
  );

  static const extensionTypesValueXToJsonImpl = CloudFunction(
    api: r'extension_types',
    functionName: r'valueXToJsonImpl',
  );

  static const extensionTypesValuex = CloudFunction(
    api: r'extension_types',
    functionName: r'valueX',
  );

  static const genericWrappersGenericWrapperParameters = CloudFunction(
    api: r'generic_wrappers',
    functionName: r'genericWrapperParameters',
  );

  static const genericWrappersGenericWrappers = CloudFunction(
    api: r'generic_wrappers',
    functionName: r'genericWrappers',
  );

  static const genericWrappersGenericWrappersAsync = CloudFunction(
    api: r'generic_wrappers',
    functionName: r'genericWrappersAsync',
  );

  static const metadataHasConstructedDeprecatedAnnotation = CloudFunction(
    api: r'metadata',
    functionName: r'hasConstructedDeprecatedAnnotation',
  );

  static const metadataHasDeprecatedAnnotation = CloudFunction(
    api: r'metadata',
    functionName: r'hasDeprecatedAnnotation',
  );

  static const metadataHasDocComments = CloudFunction(
    api: r'metadata',
    functionName: r'hasDocComments',
  );

  static const metadataHasExportableAnnotation = CloudFunction(
    api: r'metadata',
    functionName: r'hasExportableAnnotation',
  );

  static const metadataHasExportableConstructedAnnotation = CloudFunction(
    api: r'metadata',
    functionName: r'hasExportableConstructedAnnotation',
  );

  static const metadataHasLiteralsAnnotation = CloudFunction(
    api: r'metadata',
    functionName: r'hasLiteralsAnnotation',
  );

  static const metadataHasNamedConstructedAnnotation = CloudFunction(
    api: r'metadata',
    functionName: r'hasNamedConstructedAnnotation',
  );

  static const metadataHasNotExportableAnnotation = CloudFunction(
    api: r'metadata',
    functionName: r'hasNotExportableAnnotation',
  );

  static const metadataNamedDefaultValueVars = CloudFunction(
    api: r'metadata',
    functionName: r'namedDefaultValueVars',
  );

  static const metadataNamedDefaultValueVarsPrivate = CloudFunction(
    api: r'metadata',
    functionName: r'namedDefaultValueVarsPrivate',
  );

  static const metadataNamedDefaultValues = CloudFunction(
    api: r'metadata',
    functionName: r'namedDefaultValues',
  );

  static const metadataNullableNamedDefaultValueVars = CloudFunction(
    api: r'metadata',
    functionName: r'nullableNamedDefaultValueVars',
  );

  static const metadataNullableNamedDefaultValueVarsPrivate = CloudFunction(
    api: r'metadata',
    functionName: r'nullableNamedDefaultValueVarsPrivate',
  );

  static const metadataNullableNamedDefaultValues = CloudFunction(
    api: r'metadata',
    functionName: r'nullableNamedDefaultValues',
  );

  static const metadataNullablePositionalDefaultValueVars = CloudFunction(
    api: r'metadata',
    functionName: r'nullablePositionalDefaultValueVars',
  );

  static const metadataNullablePositionalDefaultValueVarsPrivate =
      CloudFunction(
    api: r'metadata',
    functionName: r'nullablePositionalDefaultValueVarsPrivate',
  );

  static const metadataNullablePositionalDefaultValues = CloudFunction(
    api: r'metadata',
    functionName: r'nullablePositionalDefaultValues',
  );

  static const metadataPositionalDefaultValueVars = CloudFunction(
    api: r'metadata',
    functionName: r'positionalDefaultValueVars',
  );

  static const metadataPositionalDefaultValueVarsPrivate = CloudFunction(
    api: r'metadata',
    functionName: r'positionalDefaultValueVarsPrivate',
  );

  static const metadataPositionalDefaultValues = CloudFunction(
    api: r'metadata',
    functionName: r'positionalDefaultValues',
  );

  static const parameterTypesComplex = CloudFunction(
    api: r'parameter_types',
    functionName: r'complex',
  );

  static const parameterTypesSimple = CloudFunction(
    api: r'parameter_types',
    functionName: r'simple',
  );

  static const parameterTypesSimpleOptional = CloudFunction(
    api: r'parameter_types',
    functionName: r'simpleOptional',
  );

  static const parametersOptionalNamed = CloudFunction(
    api: r'parameters',
    functionName: r'optionalNamed',
  );

  static const parametersOptionalPositional = CloudFunction(
    api: r'parameters',
    functionName: r'optionalPositional',
  );

  static const parametersRequiredNamed = CloudFunction(
    api: r'parameters',
    functionName: r'requiredNamed',
  );

  static const parametersRequiredPositional = CloudFunction(
    api: r'parameters',
    functionName: r'requiredPositional',
  );

  static const recordsAliasedNamedFields = CloudFunction(
    api: r'records',
    functionName: r'aliasedNamedFields',
  );

  static const recordsAsyncAliasedNamedFields = CloudFunction(
    api: r'records',
    functionName: r'asyncAliasedNamedFields',
  );

  static const recordsAsyncNamedFields = CloudFunction(
    api: r'records',
    functionName: r'asyncNamedFields',
  );

  static const recordsAsyncNested = CloudFunction(
    api: r'records',
    functionName: r'asyncNested',
  );

  static const recordsAsyncNonAliasedNamedFields = CloudFunction(
    api: r'records',
    functionName: r'asyncNonAliasedNamedFields',
  );

  static const recordsAsyncNullableNested = CloudFunction(
    api: r'records',
    functionName: r'asyncNullableNested',
  );

  static const recordsNamedFields = CloudFunction(
    api: r'records',
    functionName: r'namedFields',
  );

  static const recordsNested = CloudFunction(
    api: r'records',
    functionName: r'nested',
  );

  static const recordsNonAliasedNamedFields = CloudFunction(
    api: r'records',
    functionName: r'nonAliasedNamedFields',
  );

  static const recordsNullableNested = CloudFunction(
    api: r'records',
    functionName: r'nullableNested',
  );

  static const returnTypesAsyncBoolReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncBoolReturn',
  );

  static const returnTypesAsyncClassReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'asyncClassReturnNullable',
  );

  static const returnTypesAsyncComplexClassReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncComplexClassReturn',
  );

  static const returnTypesAsyncComplexStructReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncComplexStructReturn',
  );

  static const returnTypesAsyncComplexStructReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'asyncComplexStructReturnNullable',
  );

  static const returnTypesAsyncDoubleReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncDoubleReturn',
  );

  static const returnTypesAsyncIntReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncIntReturn',
  );

  static const returnTypesAsyncIterableReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncIterableReturn',
  );

  static const returnTypesAsyncListReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncListReturn',
  );

  static const returnTypesAsyncMapReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncMapReturn',
  );

  static const returnTypesAsyncOrBoolReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrBoolReturn',
  );

  static const returnTypesAsyncOrBoolReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrBoolReturnNullable',
  );

  static const returnTypesAsyncOrComplexClassReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrComplexClassReturnNullable',
  );

  static const returnTypesAsyncOrComplexStructReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrComplexStructReturn',
  );

  static const returnTypesAsyncOrComplexStructReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrComplexStructReturnNullable',
  );

  static const returnTypesAsyncOrDoubleReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrDoubleReturn',
  );

  static const returnTypesAsyncOrDoubleReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrDoubleReturnNullable',
  );

  static const returnTypesAsyncOrIntReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrIntReturn',
  );

  static const returnTypesAsyncOrIntReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrIntReturnNullable',
  );

  static const returnTypesAsyncOrIterableReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrIterableReturn',
  );

  static const returnTypesAsyncOrIterableReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrIterableReturnNullable',
  );

  static const returnTypesAsyncOrListReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrListReturn',
  );

  static const returnTypesAsyncOrListReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrListReturnNullable',
  );

  static const returnTypesAsyncOrMapReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrMapReturn',
  );

  static const returnTypesAsyncOrMapReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrMapReturnNullable',
  );

  static const returnTypesAsyncOrSimpleClassReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrSimpleClassReturnNullable',
  );

  static const returnTypesAsyncOrStringReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrStringReturn',
  );

  static const returnTypesAsyncOrStringReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrStringReturnNullable',
  );

  static const returnTypesAsyncOrStructReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrStructReturn',
  );

  static const returnTypesAsyncOrStructReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrStructReturnNullable',
  );

  static const returnTypesAsyncOrVoidReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrVoidReturn',
  );

  static const returnTypesAsyncOrVoidReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'asyncOrVoidReturnNullable',
  );

  static const returnTypesAsyncStringReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncStringReturn',
  );

  static const returnTypesAsyncStructReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncStructReturn',
  );

  static const returnTypesAsyncStructReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'asyncStructReturnNullable',
  );

  static const returnTypesAsyncVoidReturn = CloudFunction(
    api: r'return_types',
    functionName: r'asyncVoidReturn',
  );

  static const returnTypesBoolReturn = CloudFunction(
    api: r'return_types',
    functionName: r'boolReturn',
  );

  static const returnTypesBoolReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'boolReturnNullable',
  );

  static const returnTypesComplexClassReturn = CloudFunction(
    api: r'return_types',
    functionName: r'complexClassReturn',
  );

  static const returnTypesComplexClassReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'complexClassReturnNullable',
  );

  static const returnTypesComplexReturn = CloudFunction(
    api: r'return_types',
    functionName: r'complexReturn',
  );

  static const returnTypesComplexReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'complexReturnNullable',
  );

  static const returnTypesDoubleReturn = CloudFunction(
    api: r'return_types',
    functionName: r'doubleReturn',
  );

  static const returnTypesDoubleReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'doubleReturnNullable',
  );

  static const returnTypesIntReturn = CloudFunction(
    api: r'return_types',
    functionName: r'intReturn',
  );

  static const returnTypesIntReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'intReturnNullable',
  );

  static const returnTypesIterableReturn = CloudFunction(
    api: r'return_types',
    functionName: r'iterableReturn',
  );

  static const returnTypesIterableReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'iterableReturnNullable',
  );

  static const returnTypesListReturn = CloudFunction(
    api: r'return_types',
    functionName: r'listReturn',
  );

  static const returnTypesListReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'listReturnNullable',
  );

  static const returnTypesMapReturn = CloudFunction(
    api: r'return_types',
    functionName: r'mapReturn',
  );

  static const returnTypesMapReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'mapReturnNullable',
  );

  static const returnTypesSimpleClassReturn = CloudFunction(
    api: r'return_types',
    functionName: r'simpleClassReturn',
  );

  static const returnTypesSimpleClassReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'simpleClassReturnNullable',
  );

  static const returnTypesStringReturn = CloudFunction(
    api: r'return_types',
    functionName: r'stringReturn',
  );

  static const returnTypesStringReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'stringReturnNullable',
  );

  static const returnTypesStructReturn = CloudFunction(
    api: r'return_types',
    functionName: r'structReturn',
  );

  static const returnTypesStructReturnNullable = CloudFunction(
    api: r'return_types',
    functionName: r'structReturnNullable',
  );

  static const returnTypesVoidReturn = CloudFunction(
    api: r'return_types',
    functionName: r'voidReturn',
  );

  static const sealedClassesAliasedErrShapeResults = CloudFunction(
    api: r'sealed_classes',
    functionName: r'aliasedErrShapeResults',
  );

  static const sealedClassesAliasedOkShapeResults = CloudFunction(
    api: r'sealed_classes',
    functionName: r'aliasedOkShapeResults',
  );

  static const sealedClassesAliasedShapeResults = CloudFunction(
    api: r'sealed_classes',
    functionName: r'aliasedShapeResults',
  );

  static const sealedClassesArea = CloudFunction(
    api: r'sealed_classes',
    functionName: r'area',
  );

  static const sealedClassesCircle = CloudFunction(
    api: r'sealed_classes',
    functionName: r'circle',
  );

  static const sealedClassesCircleWithOverriddenCustomJson = CloudFunction(
    api: r'sealed_classes',
    functionName: r'circleWithOverriddenCustomJson',
  );

  static const sealedClassesErrShapeResults = CloudFunction(
    api: r'sealed_classes',
    functionName: r'errShapeResults',
  );

  static const sealedClassesGenericResult = CloudFunction(
    api: r'sealed_classes',
    functionName: r'genericResult',
  );

  static const sealedClassesMultipleGenericResult = CloudFunction(
    api: r'sealed_classes',
    functionName: r'multipleGenericResult',
  );

  static const sealedClassesOkShapeResults = CloudFunction(
    api: r'sealed_classes',
    functionName: r'okShapeResults',
  );

  static const sealedClassesRectangle = CloudFunction(
    api: r'sealed_classes',
    functionName: r'rectangle',
  );

  static const sealedClassesRectangleWithOverriddenCustomJson = CloudFunction(
    api: r'sealed_classes',
    functionName: r'rectangleWithOverriddenCustomJson',
  );

  static const sealedClassesSealedClass = CloudFunction(
    api: r'sealed_classes',
    functionName: r'sealedClass',
  );

  static const sealedClassesSealedClassWithCustomJson = CloudFunction(
    api: r'sealed_classes',
    functionName: r'sealedClassWithCustomJson',
  );

  static const sealedClassesSealedClassWithInheritedCustomJson = CloudFunction(
    api: r'sealed_classes',
    functionName: r'sealedClassWithInheritedCustomJson',
  );

  static const sealedClassesSealedClassWithOverriddenCustomJson = CloudFunction(
    api: r'sealed_classes',
    functionName: r'sealedClassWithOverriddenCustomJson',
  );

  static const sealedClassesShapeResults = CloudFunction(
    api: r'sealed_classes',
    functionName: r'shapeResults',
  );

  static const sealedClassesSwappedResult = CloudFunction(
    api: r'sealed_classes',
    functionName: r'swappedResult',
  );
}
