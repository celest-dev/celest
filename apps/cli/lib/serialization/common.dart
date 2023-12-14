import 'package:analyzer/dart/element/type.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/types/type_checker.dart';

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

/// The [DartType] of `Map<String, Object?>`.
final jsonMapType = typeHelper.typeProvider.mapType(
  typeHelper.typeProvider.stringType,
  typeHelper.typeProvider.objectQuestionType,
);
