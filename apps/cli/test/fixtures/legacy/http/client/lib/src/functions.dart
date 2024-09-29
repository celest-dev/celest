// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:convert' as _$convert;

import 'package:celest/celest.dart' as _$celest;
import 'package:celest_backend/exceptions/http_errors.dart';
import 'package:celest_backend/models/http_errors.dart';
import 'package:celest_backend/models/http_header_query.dart';
import 'package:celest_core/celest_core.dart' as _$celest;
import 'package:celest_core/src/exception/cloud_exception.dart' as _$celest;
import 'package:celest_core/src/exception/serialization_exception.dart'
    as _$celest;

import '../api_client.dart';

class CelestFunctions {
  final httpErrors = CelestFunctionsHttpErrors();

  final httpHeader = CelestFunctionsHttpHeader();

  final httpMethod = CelestFunctionsHttpMethod();

  final httpQuery = CelestFunctionsHttpQuery();

  final httpStatus = CelestFunctionsHttpStatus();
}

class CelestFunctionsHttpErrors {
  Never _throwError({
    required int $statusCode,
    required Map<String, Object?> $body,
  }) {
    final $error = ($body['error'] as Map<String, Object?>);
    final $code = ($error['code'] as String);
    final $message = ($error['message'] as String?);
    final $details = ($error['details'] as _$celest.JsonMap?);
    switch ($code) {
      case r'celest.core.v1.CloudException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.CloudException>($details);
      case r'celest.core.v1.CancelledException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.CancelledException>($details);
      case r'celest.core.v1.UnknownError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnknownError>($details);
      case r'celest.core.v1.BadRequestException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.BadRequestException>($details);
      case r'celest.core.v1.UnauthorizedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnauthorizedException>($details);
      case r'celest.core.v1.NotFoundException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.NotFoundException>($details);
      case r'celest.core.v1.AlreadyExistsException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.AlreadyExistsException>($details);
      case r'celest.core.v1.PermissionDeniedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.PermissionDeniedException>($details);
      case r'celest.core.v1.ResourceExhaustedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.ResourceExhaustedException>($details);
      case r'celest.core.v1.FailedPreconditionException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.FailedPreconditionException>($details);
      case r'celest.core.v1.AbortedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.AbortedException>($details);
      case r'celest.core.v1.OutOfRangeException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.OutOfRangeException>($details);
      case r'celest.core.v1.UnimplementedError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnimplementedError>($details);
      case r'celest.core.v1.InternalServerError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.InternalServerError>($details);
      case r'celest.core.v1.UnavailableError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnavailableError>($details);
      case r'celest.core.v1.DataLossError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.DataLossError>($details);
      case r'celest.core.v1.DeadlineExceededError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.DeadlineExceededError>($details);
      case r'celest.core.v1.SerializationException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.SerializationException>($details);
      case r'api.v1.CustomBadRequestException':
        throw _$celest.Serializers.instance
            .deserialize<CustomBadRequestException>($details);
      case r'api.v1.ForbiddenException':
        throw _$celest.Serializers.instance
            .deserialize<ForbiddenException>($details);
      case r'api.v1.NotFoundException':
        throw _$celest.Serializers.instance
            .deserialize<NotFoundException>($details);
      case r'api.v1.AnotherNotFoundException':
        throw _$celest.Serializers.instance
            .deserialize<AnotherNotFoundException>($details);
      case r'api.v1.BadGatewayError':
        throw _$celest.Serializers.instance
            .deserialize<BadGatewayError>($details);
      default:
        throw _$celest.CloudException.http(
          statusCode: $statusCode,
          code: $code,
          message: $message,
          details: $details,
        );
    }
  }

  @_$celest.CloudFunction(
    api: 'http_errors',
    function: 'httpErrors',
  )
  Future<void> httpErrors(ExceptionType type) async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/http-errors/http-errors'),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      body: _$convert.jsonEncode({
        r'type': _$celest.Serializers.instance.serialize<ExceptionType>(type)
      }),
    );
    final $body =
        (_$convert.jsonDecode($response.body) as Map<String, Object?>);
    if ($response.statusCode != 200) {
      _throwError(
        $statusCode: $response.statusCode,
        $body: $body,
      );
    }
    return;
  }
}

class CelestFunctionsHttpHeader {
  Never _throwError({
    required int $statusCode,
    required Map<String, Object?> $body,
  }) {
    final $error = ($body['error'] as Map<String, Object?>);
    final $code = ($error['code'] as String);
    final $message = ($error['message'] as String?);
    final $details = ($error['details'] as _$celest.JsonMap?);
    switch ($code) {
      case r'celest.core.v1.CloudException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.CloudException>($details);
      case r'celest.core.v1.CancelledException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.CancelledException>($details);
      case r'celest.core.v1.UnknownError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnknownError>($details);
      case r'celest.core.v1.BadRequestException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.BadRequestException>($details);
      case r'celest.core.v1.UnauthorizedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnauthorizedException>($details);
      case r'celest.core.v1.NotFoundException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.NotFoundException>($details);
      case r'celest.core.v1.AlreadyExistsException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.AlreadyExistsException>($details);
      case r'celest.core.v1.PermissionDeniedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.PermissionDeniedException>($details);
      case r'celest.core.v1.ResourceExhaustedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.ResourceExhaustedException>($details);
      case r'celest.core.v1.FailedPreconditionException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.FailedPreconditionException>($details);
      case r'celest.core.v1.AbortedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.AbortedException>($details);
      case r'celest.core.v1.OutOfRangeException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.OutOfRangeException>($details);
      case r'celest.core.v1.UnimplementedError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnimplementedError>($details);
      case r'celest.core.v1.InternalServerError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.InternalServerError>($details);
      case r'celest.core.v1.UnavailableError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnavailableError>($details);
      case r'celest.core.v1.DataLossError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.DataLossError>($details);
      case r'celest.core.v1.DeadlineExceededError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.DeadlineExceededError>($details);
      case r'celest.core.v1.SerializationException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.SerializationException>($details);
      default:
        throw _$celest.CloudException.http(
          statusCode: $statusCode,
          code: $code,
          message: $message,
          details: $details,
        );
    }
  }

  @_$celest.CloudFunction(
    api: 'http_header',
    function: 'headers',
  )
  Future<HttpHeaderParams> headers(
    String aString,
    int anInt,
    double aDouble,
    num aNum,
    bool aBool,
    DateTime aDateTime,
    String? aNullableString,
    int? aNullableInt,
    double? aNullableDouble,
    num? aNullableNum,
    bool? aNullableBool,
    DateTime? aNullableDateTime,
  ) async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/http-header/headers'),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        r'aString': aString,
        r'anInt': anInt.toString(),
        r'aDouble': aDouble.toString(),
        r'aNum': aNum.toString(),
        r'aBool': aBool.toString(),
        r'aDateTime': aDateTime.toIso8601String(),
        if (aNullableString != null) r'aNullableString': aNullableString,
        if (aNullableInt != null) r'aNullableInt': aNullableInt.toString(),
        if (aNullableDouble != null)
          r'aNullableDouble': aNullableDouble.toString(),
        if (aNullableNum != null) r'aNullableNum': aNullableNum.toString(),
        if (aNullableBool != null) r'aNullableBool': aNullableBool.toString(),
        if (aNullableDateTime != null)
          r'aNullableDateTime': aNullableDateTime.toIso8601String(),
      },
    );
    final $body =
        (_$convert.jsonDecode($response.body) as Map<String, Object?>);
    if ($response.statusCode != 200) {
      _throwError(
        $statusCode: $response.statusCode,
        $body: $body,
      );
    }
    return _$celest.Serializers.instance
        .deserialize<HttpHeaderParams>($body['response']);
  }
}

class CelestFunctionsHttpMethod {
  Never _throwError({
    required int $statusCode,
    required Map<String, Object?> $body,
  }) {
    final $error = ($body['error'] as Map<String, Object?>);
    final $code = ($error['code'] as String);
    final $message = ($error['message'] as String?);
    final $details = ($error['details'] as _$celest.JsonMap?);
    switch ($code) {
      case r'celest.core.v1.CloudException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.CloudException>($details);
      case r'celest.core.v1.CancelledException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.CancelledException>($details);
      case r'celest.core.v1.UnknownError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnknownError>($details);
      case r'celest.core.v1.BadRequestException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.BadRequestException>($details);
      case r'celest.core.v1.UnauthorizedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnauthorizedException>($details);
      case r'celest.core.v1.NotFoundException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.NotFoundException>($details);
      case r'celest.core.v1.AlreadyExistsException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.AlreadyExistsException>($details);
      case r'celest.core.v1.PermissionDeniedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.PermissionDeniedException>($details);
      case r'celest.core.v1.ResourceExhaustedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.ResourceExhaustedException>($details);
      case r'celest.core.v1.FailedPreconditionException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.FailedPreconditionException>($details);
      case r'celest.core.v1.AbortedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.AbortedException>($details);
      case r'celest.core.v1.OutOfRangeException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.OutOfRangeException>($details);
      case r'celest.core.v1.UnimplementedError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnimplementedError>($details);
      case r'celest.core.v1.InternalServerError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.InternalServerError>($details);
      case r'celest.core.v1.UnavailableError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnavailableError>($details);
      case r'celest.core.v1.DataLossError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.DataLossError>($details);
      case r'celest.core.v1.DeadlineExceededError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.DeadlineExceededError>($details);
      case r'celest.core.v1.SerializationException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.SerializationException>($details);
      default:
        throw _$celest.CloudException.http(
          statusCode: $statusCode,
          code: $code,
          message: $message,
          details: $details,
        );
    }
  }

  @_$celest.CloudFunction(
    api: 'http_method',
    function: 'get',
  )
  Future<void> get() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/http-method/get'),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );
    final $body =
        (_$convert.jsonDecode($response.body) as Map<String, Object?>);
    if ($response.statusCode != 200) {
      _throwError(
        $statusCode: $response.statusCode,
        $body: $body,
      );
    }
    return;
  }

  @_$celest.CloudFunction(
    api: 'http_method',
    function: 'post',
  )
  Future<void> post() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/http-method/post'),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );
    final $body =
        (_$convert.jsonDecode($response.body) as Map<String, Object?>);
    if ($response.statusCode != 200) {
      _throwError(
        $statusCode: $response.statusCode,
        $body: $body,
      );
    }
    return;
  }

  @_$celest.CloudFunction(
    api: 'http_method',
    function: 'put',
  )
  Future<void> put() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/http-method/put'),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );
    final $body =
        (_$convert.jsonDecode($response.body) as Map<String, Object?>);
    if ($response.statusCode != 200) {
      _throwError(
        $statusCode: $response.statusCode,
        $body: $body,
      );
    }
    return;
  }

  @_$celest.CloudFunction(
    api: 'http_method',
    function: 'delete',
  )
  Future<void> delete() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/http-method/delete'),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );
    final $body =
        (_$convert.jsonDecode($response.body) as Map<String, Object?>);
    if ($response.statusCode != 200) {
      _throwError(
        $statusCode: $response.statusCode,
        $body: $body,
      );
    }
    return;
  }

  @_$celest.CloudFunction(
    api: 'http_method',
    function: 'patch',
  )
  Future<void> patch() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/http-method/patch'),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );
    final $body =
        (_$convert.jsonDecode($response.body) as Map<String, Object?>);
    if ($response.statusCode != 200) {
      _throwError(
        $statusCode: $response.statusCode,
        $body: $body,
      );
    }
    return;
  }
}

class CelestFunctionsHttpQuery {
  Never _throwError({
    required int $statusCode,
    required Map<String, Object?> $body,
  }) {
    final $error = ($body['error'] as Map<String, Object?>);
    final $code = ($error['code'] as String);
    final $message = ($error['message'] as String?);
    final $details = ($error['details'] as _$celest.JsonMap?);
    switch ($code) {
      case r'celest.core.v1.CloudException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.CloudException>($details);
      case r'celest.core.v1.CancelledException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.CancelledException>($details);
      case r'celest.core.v1.UnknownError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnknownError>($details);
      case r'celest.core.v1.BadRequestException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.BadRequestException>($details);
      case r'celest.core.v1.UnauthorizedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnauthorizedException>($details);
      case r'celest.core.v1.NotFoundException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.NotFoundException>($details);
      case r'celest.core.v1.AlreadyExistsException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.AlreadyExistsException>($details);
      case r'celest.core.v1.PermissionDeniedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.PermissionDeniedException>($details);
      case r'celest.core.v1.ResourceExhaustedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.ResourceExhaustedException>($details);
      case r'celest.core.v1.FailedPreconditionException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.FailedPreconditionException>($details);
      case r'celest.core.v1.AbortedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.AbortedException>($details);
      case r'celest.core.v1.OutOfRangeException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.OutOfRangeException>($details);
      case r'celest.core.v1.UnimplementedError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnimplementedError>($details);
      case r'celest.core.v1.InternalServerError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.InternalServerError>($details);
      case r'celest.core.v1.UnavailableError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnavailableError>($details);
      case r'celest.core.v1.DataLossError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.DataLossError>($details);
      case r'celest.core.v1.DeadlineExceededError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.DeadlineExceededError>($details);
      case r'celest.core.v1.SerializationException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.SerializationException>($details);
      default:
        throw _$celest.CloudException.http(
          statusCode: $statusCode,
          code: $code,
          message: $message,
          details: $details,
        );
    }
  }

  @_$celest.CloudFunction(
    api: 'http_query',
    function: 'query',
  )
  Future<HttpQueryParams> query(
    String aString,
    int anInt,
    double aDouble,
    num aNum,
    bool aBool,
    DateTime aDateTime,
    String? aNullableString,
    int? aNullableInt,
    double? aNullableDouble,
    num? aNullableNum,
    bool? aNullableBool,
    DateTime? aNullableDateTime,
    List<String> aListOfString,
    List<int> aListOfInt,
    List<double> aListOfDouble,
    List<num> aListOfNum,
    List<bool> aListOfBool,
    List<DateTime> aListOfDateTime,
    List<String>? aNullableListOfString,
    List<int>? aNullableListOfInt,
    List<double>? aNullableListOfDouble,
    List<num>? aNullableListOfNum,
    List<bool>? aNullableListOfBool,
    List<DateTime>? aNullableListOfDateTime,
  ) async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/http-query/query').replace(queryParameters: {
        r'aString': aString,
        r'anInt': anInt.toString(),
        r'aDouble': aDouble.toString(),
        r'aNum': aNum.toString(),
        r'aBool': aBool.toString(),
        r'aDateTime': aDateTime.toIso8601String(),
        if (aNullableString != null) r'aNullableString': aNullableString,
        if (aNullableInt != null) r'aNullableInt': aNullableInt.toString(),
        if (aNullableDouble != null)
          r'aNullableDouble': aNullableDouble.toString(),
        if (aNullableNum != null) r'aNullableNum': aNullableNum.toString(),
        if (aNullableBool != null) r'aNullableBool': aNullableBool.toString(),
        if (aNullableDateTime != null)
          r'aNullableDateTime': aNullableDateTime.toIso8601String(),
        r'aListOfString': aListOfString,
        r'aListOfInt': aListOfInt.map((el) => el.toString()).toList(),
        r'aListOfDouble': aListOfDouble.map((el) => el.toString()).toList(),
        r'aListOfNum': aListOfNum.map((el) => el.toString()).toList(),
        r'aListOfBool': aListOfBool.map((el) => el.toString()).toList(),
        r'aListOfDateTime':
            aListOfDateTime.map((el) => el.toIso8601String()).toList(),
        if (aNullableListOfString != null)
          r'aNullableListOfString': aNullableListOfString,
        if (aNullableListOfInt != null)
          r'aNullableListOfInt':
              aNullableListOfInt.map((el) => el.toString()).toList(),
        if (aNullableListOfDouble != null)
          r'aNullableListOfDouble':
              aNullableListOfDouble.map((el) => el.toString()).toList(),
        if (aNullableListOfNum != null)
          r'aNullableListOfNum':
              aNullableListOfNum.map((el) => el.toString()).toList(),
        if (aNullableListOfBool != null)
          r'aNullableListOfBool':
              aNullableListOfBool.map((el) => el.toString()).toList(),
        if (aNullableListOfDateTime != null)
          r'aNullableListOfDateTime': aNullableListOfDateTime
              .map((el) => el.toIso8601String())
              .toList(),
      }),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );
    final $body =
        (_$convert.jsonDecode($response.body) as Map<String, Object?>);
    if ($response.statusCode != 200) {
      _throwError(
        $statusCode: $response.statusCode,
        $body: $body,
      );
    }
    return _$celest.Serializers.instance
        .deserialize<HttpQueryParams>($body['response']);
  }
}

class CelestFunctionsHttpStatus {
  Never _throwError({
    required int $statusCode,
    required Map<String, Object?> $body,
  }) {
    final $error = ($body['error'] as Map<String, Object?>);
    final $code = ($error['code'] as String);
    final $message = ($error['message'] as String?);
    final $details = ($error['details'] as _$celest.JsonMap?);
    switch ($code) {
      case r'celest.core.v1.CloudException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.CloudException>($details);
      case r'celest.core.v1.CancelledException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.CancelledException>($details);
      case r'celest.core.v1.UnknownError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnknownError>($details);
      case r'celest.core.v1.BadRequestException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.BadRequestException>($details);
      case r'celest.core.v1.UnauthorizedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnauthorizedException>($details);
      case r'celest.core.v1.NotFoundException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.NotFoundException>($details);
      case r'celest.core.v1.AlreadyExistsException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.AlreadyExistsException>($details);
      case r'celest.core.v1.PermissionDeniedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.PermissionDeniedException>($details);
      case r'celest.core.v1.ResourceExhaustedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.ResourceExhaustedException>($details);
      case r'celest.core.v1.FailedPreconditionException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.FailedPreconditionException>($details);
      case r'celest.core.v1.AbortedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.AbortedException>($details);
      case r'celest.core.v1.OutOfRangeException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.OutOfRangeException>($details);
      case r'celest.core.v1.UnimplementedError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnimplementedError>($details);
      case r'celest.core.v1.InternalServerError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.InternalServerError>($details);
      case r'celest.core.v1.UnavailableError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnavailableError>($details);
      case r'celest.core.v1.DataLossError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.DataLossError>($details);
      case r'celest.core.v1.DeadlineExceededError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.DeadlineExceededError>($details);
      case r'celest.core.v1.SerializationException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.SerializationException>($details);
      default:
        throw _$celest.CloudException.http(
          statusCode: $statusCode,
          code: $code,
          message: $message,
          details: $details,
        );
    }
  }

  @_$celest.CloudFunction(
    api: 'http_status',
    function: 'ok',
  )
  Future<void> ok() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/http-status/ok'),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );
    final $body =
        (_$convert.jsonDecode($response.body) as Map<String, Object?>);
    if ($response.statusCode != 200) {
      _throwError(
        $statusCode: $response.statusCode,
        $body: $body,
      );
    }
    return;
  }

  @_$celest.CloudFunction(
    api: 'http_status',
    function: 'created',
  )
  Future<void> created() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/http-status/created'),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );
    final $body =
        (_$convert.jsonDecode($response.body) as Map<String, Object?>);
    if ($response.statusCode != 200) {
      _throwError(
        $statusCode: $response.statusCode,
        $body: $body,
      );
    }
    return;
  }

  @_$celest.CloudFunction(
    api: 'http_status',
    function: 'accepted',
  )
  Future<void> accepted() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/http-status/accepted'),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );
    final $body =
        (_$convert.jsonDecode($response.body) as Map<String, Object?>);
    if ($response.statusCode != 200) {
      _throwError(
        $statusCode: $response.statusCode,
        $body: $body,
      );
    }
    return;
  }

  @_$celest.CloudFunction(
    api: 'http_status',
    function: 'badRequest',
  )
  Future<void> badRequest() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/http-status/bad-request'),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );
    final $body =
        (_$convert.jsonDecode($response.body) as Map<String, Object?>);
    if ($response.statusCode != 200) {
      _throwError(
        $statusCode: $response.statusCode,
        $body: $body,
      );
    }
    return;
  }

  @_$celest.CloudFunction(
    api: 'http_status',
    function: 'internalServerError',
  )
  Future<void> internalServerError() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/http-status/internal-server-error'),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );
    final $body =
        (_$convert.jsonDecode($response.body) as Map<String, Object?>);
    if ($response.statusCode != 200) {
      _throwError(
        $statusCode: $response.statusCode,
        $body: $body,
      );
    }
    return;
  }
}
