import 'package:analyzer/dart/element/type.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:code_builder/code_builder.dart';

/// Supported Dart SDK types in serialization.
final supportedDartSdkType = TypeChecker.any([
  DartTypes.core.bigInt.checker,
  DartTypes.core.dateTime.checker,
  DartTypes.core.duration.checker,
  DartTypes.core.regExp.checker,
  DartTypes.core.stackTrace.checker,
  DartTypes.core.uri.checker,
  DartTypes.core.uriData.checker,
  DartTypes.typedData.uint8List.checker,
]);

final Map<DartType, Reference> builtInTypes = {
  typeHelper.coreTypes.coreBigIntType: DartTypes.core.bigInt,
  typeHelper.coreTypes.dateTimeType: DartTypes.core.dateTime,
  typeHelper.coreTypes.durationType: DartTypes.core.duration,
  typeHelper.coreTypes.coreRegExpType: DartTypes.core.regExp,
  typeHelper.coreTypes.coreStackTraceType: DartTypes.core.stackTrace,
  typeHelper.coreTypes.coreUriType: DartTypes.core.uri,
  typeHelper.coreTypes.coreUriDataType: DartTypes.core.uriData,
  typeHelper.coreTypes.typedDataUint8ListType: DartTypes.typedData.uint8List,
};

/// The [DartType] of `Map<String, Object?>`.
final jsonMapType = typeHelper.typeProvider.mapType(
  typeHelper.typeProvider.stringType,
  typeHelper.typeProvider.objectQuestionType,
);

/// Valid types for injected env variables.
final validEnvTypes = TypeChecker.any([
  DartTypes.core.bool.checker,
  DartTypes.core.double.checker,
  DartTypes.core.int.checker,
  DartTypes.core.num.checker,
  DartTypes.core.string.checker,
  DartTypes.core.uri.checker,
  DartTypes.typedData.uint8List.checker,
]);
