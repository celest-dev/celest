import 'package:celest_backend/models/sealed_classes.dart';
import 'package:celest_core/celest_core.dart';

final class CustomException implements Exception {
  final String message = 'This is a custom exception';
  final JsonMap additionalInfo = JsonMap({
    'hello': 'world',
  });

  @override
  String toString() => 'CustomException: $message';
}

final class CustomExceptionToFromJson extends CustomException {
  CustomExceptionToFromJson();

  CustomExceptionToFromJson.fromJson(Map<String, Object?> json) {
    json.remove('message');
    this.additionalInfo.addAll(json);
  }

  Map<String, Object?> toJson() => {
        'message': message,
        ...additionalInfo,
        'another': 'value',
      };
}

final class CustomError extends Error {
  final String message = 'This is a custom error';
  final JsonMap additionalInfo = JsonMap({
    'hello': 'world',
  });

  @override
  String toString() => 'CustomError: $message';
}

final class CustomErrorToFromJson extends CustomError {
  CustomErrorToFromJson();

  CustomErrorToFromJson.fromJson(Map<String, Object?> json) {
    json.remove('message');
    this.additionalInfo.addAll(json);
  }

  Map<String, Object?> toJson() => {
        'message': message,
        ...additionalInfo,
        'another': 'value',
      };
}

final class CustomErrorWithStackTrace extends Error {
  CustomErrorWithStackTrace({
    StackTrace? stackTrace,
  }) : stackTrace = stackTrace ?? StackTrace.empty;

  @override
  final StackTrace stackTrace;

  final String message = 'This is a custom error';
  final Map<String, Object?> additionalInfo = {
    'hello': 'world',
  };

  @override
  String toString() => 'CustomError: $message';
}

sealed class ShapeException {
  const ShapeException();
}

final class BadShapeException extends ShapeException {
  final Shape shape;

  BadShapeException(this.shape);

  @override
  String toString() => 'Bad shape: ($shape)';
}
