// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type OpenApiPetstoreServers(Uri _) implements Uri {
  static final OpenApiPetstoreServers defaultServer = petstoreSwaggerIo;

  static final OpenApiPetstoreServers petstoreSwaggerIo =
      OpenApiPetstoreServers(Uri.parse(r'http://petstore.swagger.io:80/v2'));
}

/// Response type for [OpenApiPetstoreClient.refArrayWithValidationsInItems].
///
/// This is a marker interface implemented by all response types:
/// - [ArrayWithValidationsInItemsListList]
sealed class RefArrayWithValidationsInItemsResponse {}

/// Response type for [OpenApiPetstoreClient.arrayWithValidationsInItems].
///
/// This is a marker interface implemented by all response types:
/// - [AdditionalPropertiesUnset]
/// - [AdditionalPropertiesTrue]
/// - [AdditionalPropertiesFalse]
/// - [AdditionalPropertiesSchema]
sealed class ArrayWithValidationsInItemsResponse {}

/// Response type for [OpenApiPetstoreClient.arrayWithValidationsInItems].
///
/// This is a marker interface implemented by all response types:
/// - [AdditionalPropertiesUnset]
/// - [AdditionalPropertiesTrue]
/// - [AdditionalPropertiesFalse]
/// - [AdditionalPropertiesSchema]
sealed class ArrayWithValidationsInItemsResponse {}

/// Response type for [OpenApiPetstoreClient.arrayWithValidationsInItems].
///
/// This is a marker interface implemented by all response types:
/// - [AdditionalPropertiesUnset]
/// - [AdditionalPropertiesTrue]
/// - [AdditionalPropertiesFalse]
/// - [AdditionalPropertiesSchema]
sealed class ArrayWithValidationsInItemsResponse {}

/// Response type for [OpenApiPetstoreClient.objectWithOptionalAndRequiredProps].
///
/// This is a marker interface implemented by all response types:
/// - [ObjectWithOptionalAndRequiredProps]
sealed class ObjectWithOptionalAndRequiredPropsResponse {}

final class OpenApiPetstoreClient {
  OpenApiPetstoreClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? OpenApiPetstoreServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<T> _decodeJson<T>(_i1.StreamedResponse $response) async {
    final $body = await $response.stream.bytesToString();
    final $json = _i2.jsonDecode($body);
    return _i3.Serializers.instance.deserialize<T>($json);
  }

  Future<RefArrayWithValidationsInItemsResponse> refArrayWithValidationsInItems(
      {required ArrayWithValidationsInItemsListList items}) async {
    final $uri =
        Uri.parse('$_baseUri/ref_array_with_validations_in_items/$items');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch (($response.statusCode, $contentType)) {
      /// success
      case (200, 'application/json'):
        return _decodeJson<ArrayWithValidationsInItemsListList>($response);
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<ArrayWithValidationsInItemsResponse> arrayWithValidationsInItems({
    required AdditionalPropertiesUnset additionalPropertiesUnset,
    required AdditionalPropertiesTrue additionalPropertiesTrue,
    required AdditionalPropertiesFalse additionalPropertiesFalse,
    required AdditionalPropertiesSchema additionalPropertiesSchema,
  }) async {
    final $queryParameters = <String, String>{};
    $queryParameters['additionalPropertiesUnset'] =
        additionalPropertiesUnset.toString();
    $queryParameters['additionalPropertiesTrue'] =
        additionalPropertiesTrue.toString();
    $queryParameters['additionalPropertiesFalse'] =
        additionalPropertiesFalse.toString();
    $queryParameters['additionalPropertiesSchema'] =
        additionalPropertiesSchema.toString();
    final $uri = Uri.parse('$_baseUri/array_with_validations_in_items/{items}')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch (($response.statusCode, $contentType)) {
      /// 200
      case (200, 'application/json'):
        return _decodeJson<AdditionalPropertiesUnset>($response);

      /// 201
      case (201, 'application/json'):
        return _decodeJson<AdditionalPropertiesTrue>($response);

      /// 202
      case (202, 'application/json'):
        return _decodeJson<AdditionalPropertiesFalse>($response);

      /// 203
      case (203, 'application/json'):
        return _decodeJson<AdditionalPropertiesSchema>($response);
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<ArrayWithValidationsInItemsResponse> arrayWithValidationsInItems({
    required AdditionalPropertiesUnset additionalPropertiesUnset,
    required AdditionalPropertiesTrue additionalPropertiesTrue,
    required AdditionalPropertiesFalse additionalPropertiesFalse,
    required AdditionalPropertiesSchema additionalPropertiesSchema,
  }) async {
    final $queryParameters = <String, String>{};
    $queryParameters['additionalPropertiesUnset'] =
        additionalPropertiesUnset.toString();
    $queryParameters['additionalPropertiesTrue'] =
        additionalPropertiesTrue.toString();
    $queryParameters['additionalPropertiesFalse'] =
        additionalPropertiesFalse.toString();
    $queryParameters['additionalPropertiesSchema'] =
        additionalPropertiesSchema.toString();
    final $uri = Uri.parse('$_baseUri/ref_additional_properties/')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch (($response.statusCode, $contentType)) {
      /// 200
      case (200, 'application/json'):
        return _decodeJson<AdditionalPropertiesUnset>($response);

      /// 201
      case (201, 'application/json'):
        return _decodeJson<AdditionalPropertiesTrue>($response);

      /// 202
      case (202, 'application/json'):
        return _decodeJson<AdditionalPropertiesFalse>($response);

      /// 203
      case (203, 'application/json'):
        return _decodeJson<AdditionalPropertiesSchema>($response);
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<ArrayWithValidationsInItemsResponse> arrayWithValidationsInItems({
    required AdditionalPropertiesUnset additionalPropertiesUnset,
    required AdditionalPropertiesTrue additionalPropertiesTrue,
    required AdditionalPropertiesFalse additionalPropertiesFalse,
    required AdditionalPropertiesSchema additionalPropertiesSchema,
  }) async {
    final $queryParameters = <String, String>{};
    $queryParameters['additionalPropertiesUnset'] =
        additionalPropertiesUnset.toString();
    $queryParameters['additionalPropertiesTrue'] =
        additionalPropertiesTrue.toString();
    $queryParameters['additionalPropertiesFalse'] =
        additionalPropertiesFalse.toString();
    $queryParameters['additionalPropertiesSchema'] =
        additionalPropertiesSchema.toString();
    final $uri = Uri.parse('$_baseUri/additional_properties/')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch (($response.statusCode, $contentType)) {
      /// 200
      case (200, 'application/json'):
        return _decodeJson<AdditionalPropertiesUnset>($response);

      /// 201
      case (201, 'application/json'):
        return _decodeJson<AdditionalPropertiesTrue>($response);

      /// 202
      case (202, 'application/json'):
        return _decodeJson<AdditionalPropertiesFalse>($response);

      /// 203
      case (203, 'application/json'):
        return _decodeJson<AdditionalPropertiesSchema>($response);
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<ObjectWithOptionalAndRequiredPropsResponse>
      objectWithOptionalAndRequiredProps(
          {required ObjectWithOptionalAndRequiredProps objectData}) async {
    final $uri = Uri.parse(
        '$_baseUri/object_with_optional_and_required_props/$objectData');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch (($response.statusCode, $contentType)) {
      /// success
      case (200, 'application/json'):
        return _decodeJson<ObjectWithOptionalAndRequiredProps>($response);
      default:
        throw Exception('Unexpected response');
    }
  }
}

class ArrayWithValidationsInItemsListList extends _i4.DelegatingList<int>
    implements RefArrayWithValidationsInItemsResponse {
  ArrayWithValidationsInItemsListList(super.base);
}

final class ObjectWithValidationsInArrayPropItems {
  ObjectWithValidationsInArrayPropItems({this.arrayProp});

  final ArrayWithValidationsInItemsListList? arrayProp;
}

final class ObjectWithValidationsInAdditionalProperties {
  ObjectWithValidationsInAdditionalProperties();
}

final class ComposedOneOfInlineValidation {
  ComposedOneOfInlineValidation();
}

final class ComposedAnyOfInlineValidation {
  ComposedAnyOfInlineValidation();
}

final class ComposedAllOfInlineValidation {
  ComposedAllOfInlineValidation();
}

final class AdditionalPropertiesUnset
    implements
        ArrayWithValidationsInItemsResponse,
        ArrayWithValidationsInItemsResponse,
        ArrayWithValidationsInItemsResponse {
  AdditionalPropertiesUnset();
}

final class AdditionalPropertiesTrue
    implements
        ArrayWithValidationsInItemsResponse,
        ArrayWithValidationsInItemsResponse,
        ArrayWithValidationsInItemsResponse {
  AdditionalPropertiesTrue();
}

final class AdditionalPropertiesFalse
    implements
        ArrayWithValidationsInItemsResponse,
        ArrayWithValidationsInItemsResponse,
        ArrayWithValidationsInItemsResponse {
  AdditionalPropertiesFalse();
}

final class AdditionalPropertiesSchema
    implements
        ArrayWithValidationsInItemsResponse,
        ArrayWithValidationsInItemsResponse,
        ArrayWithValidationsInItemsResponse {
  AdditionalPropertiesSchema();
}

final class ObjectModelWithRefAddPropsInProps {
  ObjectModelWithRefAddPropsInProps({
    this.mapWithAdditionalPropertiesUnset,
    this.mapWithAdditionalPropertiesTrue,
    this.mapWithAdditionalPropertiesFalse,
    this.mapWithAdditionalPropertiesSchema,
  });

  final AdditionalPropertiesUnset? mapWithAdditionalPropertiesUnset;

  final AdditionalPropertiesTrue? mapWithAdditionalPropertiesTrue;

  final AdditionalPropertiesFalse? mapWithAdditionalPropertiesFalse;

  final AdditionalPropertiesSchema? mapWithAdditionalPropertiesSchema;
}

final class ObjectModelWithAddPropsInProps {
  ObjectModelWithAddPropsInProps({
    this.mapWithAdditionalPropertiesUnset,
    this.mapWithAdditionalPropertiesTrue,
    this.mapWithAdditionalPropertiesFalse,
    this.mapWithAdditionalPropertiesSchema,
  });

  final AdditionalPropertiesUnset? mapWithAdditionalPropertiesUnset;

  final AdditionalPropertiesTrue? mapWithAdditionalPropertiesTrue;

  final AdditionalPropertiesFalse? mapWithAdditionalPropertiesFalse;

  final AdditionalPropertiesSchema? mapWithAdditionalPropertiesSchema;
}

final class ObjectWithOptionalAndRequiredProps
    implements ObjectWithOptionalAndRequiredPropsResponse {
  ObjectWithOptionalAndRequiredProps({
    required this.a,
    required this.b,
    this.c,
  });

  final String a;

  final String b;

  final String? c;
}

final class ObjectPropContainsProps {
  ObjectPropContainsProps({this.a});

  final ObjectWithOptionalAndRequiredProps? a;
}

class ArrayWithObjectWithPropsInItemsListList
    extends _i4.DelegatingList<ArrayWithObjectWithPropsInItems> {
  ArrayWithObjectWithPropsInItemsListList(super.base);
}

final class ObjectWithObjectWithPropsInAdditionalProperties {
  ObjectWithObjectWithPropsInAdditionalProperties();
}
