import 'package:celest_cli/src/types/dart_type_checkers.dart';
import 'package:celest_cli/src/types/type_checker.dart';

/// Supported Dart SDK types in serialization.
final supportedDartSdkType = TypeChecker.any([
  DartTypeCheckers.core.bigInt,
  DartTypeCheckers.core.dateTime,
  DartTypeCheckers.core.duration,
  DartTypeCheckers.core.regExp,
  DartTypeCheckers.core.stackTrace,
  DartTypeCheckers.core.uri,
  DartTypeCheckers.core.uriData,
  DartTypeCheckers.typedData.uint8List,
]);
