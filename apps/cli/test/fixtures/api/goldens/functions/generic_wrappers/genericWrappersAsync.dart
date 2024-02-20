// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/generic_wrappers.dart' as _i4;
import 'package:celest_backend/src/models/parameter_types.dart' as _i6;
import 'package:fast_immutable_collections/src/ilist/ilist.dart' as _i5;
import 'package:fast_immutable_collections/src/imap/imap.dart' as _i7;

import '../../../functions/generic_wrappers.dart' as _i2;

final class GenericWrappersAsyncTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'genericWrappersAsync';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = await _i2.genericWrappersAsync(_i3.Serializers.instance
        .deserialize<_i4.GenericWrappers>(request[r'value']));
    return (
      statusCode: 200,
      body: {
        'response':
            _i3.Serializers.instance.serialize<_i4.GenericWrappers>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const GenericWrappersSerializer());
    _i3.Serializers.instance
        .put(const IMapStringIMapStringSimpleClassSerializer());
    _i3.Serializers.instance.put(const IMapStringIMapStringUriSerializer());
    _i3.Serializers.instance.put(const IMapStringIMapStringStringSerializer());
    _i3.Serializers.instance.put(const IMapStringIListSimpleClassSerializer());
    _i3.Serializers.instance.put(const IMapStringIListUriSerializer());
    _i3.Serializers.instance.put(const IMapStringIListStringSerializer());
    _i3.Serializers.instance.put(const IMapStringSimpleClassSerializer());
    _i3.Serializers.instance.put(const IMapStringUriSerializer());
    _i3.Serializers.instance.put(const IMapStringStringSerializer());
    _i3.Serializers.instance.put(const IListIListSimpleClassSerializer());
    _i3.Serializers.instance.put(const IListIListUriSerializer());
    _i3.Serializers.instance.put(const IListIListStringSerializer());
    _i3.Serializers.instance.put(const IListSimpleClassSerializer());
    _i3.Serializers.instance.put(const IListUriSerializer());
    _i3.Serializers.instance.put(const IListStringSerializer());
    _i3.Serializers.instance.put(const SimpleClassSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': GenericWrappersAsyncTarget()},
  );
}

final class GenericWrappersSerializer
    extends _i3.Serializer<_i4.GenericWrappers> {
  const GenericWrappersSerializer();

  @override
  _i4.GenericWrappers deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.GenericWrappers(
      listOfString: _i3.Serializers.instance
          .deserialize<_i5.IList<String>>(serialized[r'listOfString']),
      listOfUri: _i3.Serializers.instance
          .deserialize<_i5.IList<Uri>>(serialized[r'listOfUri']),
      listOfSimpleClass: _i3.Serializers.instance
          .deserialize<_i5.IList<_i6.SimpleClass>>(
              serialized[r'listOfSimpleClass']),
      listOfListOfString: _i3.Serializers.instance
          .deserialize<_i5.IList<_i5.IList<String>>>(
              serialized[r'listOfListOfString']),
      listOfListOfUri: _i3.Serializers.instance
          .deserialize<_i5.IList<_i5.IList<Uri>>>(
              serialized[r'listOfListOfUri']),
      listOfListOfSimpleClass: _i3.Serializers.instance
          .deserialize<_i5.IList<_i5.IList<_i6.SimpleClass>>>(
              serialized[r'listOfListOfSimpleClass']),
      mapOfString: _i3.Serializers.instance
          .deserialize<_i7.IMap<String, String>>(serialized[r'mapOfString']),
      mapOfUri: _i3.Serializers.instance
          .deserialize<_i7.IMap<String, Uri>>(serialized[r'mapOfUri']),
      mapOfSimpleClass: _i3.Serializers.instance
          .deserialize<_i7.IMap<String, _i6.SimpleClass>>(
              serialized[r'mapOfSimpleClass']),
      mapOfListOfString: _i3.Serializers.instance
          .deserialize<_i7.IMap<String, _i5.IList<String>>>(
              serialized[r'mapOfListOfString']),
      mapOfListOfUri: _i3.Serializers.instance
          .deserialize<_i7.IMap<String, _i5.IList<Uri>>>(
              serialized[r'mapOfListOfUri']),
      mapOfListOfSimpleClass: _i3.Serializers.instance
          .deserialize<_i7.IMap<String, _i5.IList<_i6.SimpleClass>>>(
              serialized[r'mapOfListOfSimpleClass']),
      mapOfMapOfString: _i3.Serializers.instance
          .deserialize<_i7.IMap<String, _i7.IMap<String, String>>>(
              serialized[r'mapOfMapOfString']),
      mapOfMapOfUri: _i3.Serializers.instance
          .deserialize<_i7.IMap<String, _i7.IMap<String, Uri>>>(
              serialized[r'mapOfMapOfUri']),
      mapOfMapOfSimpleClass: _i3.Serializers.instance
          .deserialize<_i7.IMap<String, _i7.IMap<String, _i6.SimpleClass>>>(
              serialized[r'mapOfMapOfSimpleClass']),
    );
  }

  @override
  Map<String, Object?> serialize(_i4.GenericWrappers value) => {
        r'listOfString': _i3.Serializers.instance
            .serialize<_i5.IList<String>>(value.listOfString),
        r'listOfUri':
            _i3.Serializers.instance.serialize<_i5.IList<Uri>>(value.listOfUri),
        r'listOfSimpleClass': _i3.Serializers.instance
            .serialize<_i5.IList<_i6.SimpleClass>>(value.listOfSimpleClass),
        r'listOfListOfString': _i3.Serializers.instance
            .serialize<_i5.IList<_i5.IList<String>>>(value.listOfListOfString),
        r'listOfListOfUri': _i3.Serializers.instance
            .serialize<_i5.IList<_i5.IList<Uri>>>(value.listOfListOfUri),
        r'listOfListOfSimpleClass': _i3.Serializers.instance
            .serialize<_i5.IList<_i5.IList<_i6.SimpleClass>>>(
                value.listOfListOfSimpleClass),
        r'mapOfString': _i3.Serializers.instance
            .serialize<_i7.IMap<String, String>>(value.mapOfString),
        r'mapOfUri': _i3.Serializers.instance
            .serialize<_i7.IMap<String, Uri>>(value.mapOfUri),
        r'mapOfSimpleClass': _i3.Serializers.instance
            .serialize<_i7.IMap<String, _i6.SimpleClass>>(
                value.mapOfSimpleClass),
        r'mapOfListOfString': _i3.Serializers.instance
            .serialize<_i7.IMap<String, _i5.IList<String>>>(
                value.mapOfListOfString),
        r'mapOfListOfUri': _i3.Serializers.instance
            .serialize<_i7.IMap<String, _i5.IList<Uri>>>(value.mapOfListOfUri),
        r'mapOfListOfSimpleClass': _i3.Serializers.instance
            .serialize<_i7.IMap<String, _i5.IList<_i6.SimpleClass>>>(
                value.mapOfListOfSimpleClass),
        r'mapOfMapOfString': _i3.Serializers.instance
            .serialize<_i7.IMap<String, _i7.IMap<String, String>>>(
                value.mapOfMapOfString),
        r'mapOfMapOfUri': _i3.Serializers.instance
            .serialize<_i7.IMap<String, _i7.IMap<String, Uri>>>(
                value.mapOfMapOfUri),
        r'mapOfMapOfSimpleClass': _i3.Serializers.instance
            .serialize<_i7.IMap<String, _i7.IMap<String, _i6.SimpleClass>>>(
                value.mapOfMapOfSimpleClass),
      };
}

final class IListIListSimpleClassSerializer
    extends _i3.Serializer<_i5.IList<_i5.IList<_i6.SimpleClass>>> {
  const IListIListSimpleClassSerializer();

  @override
  _i5.IList<_i5.IList<_i6.SimpleClass>> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _i5.IList<_i5.IList<_i6.SimpleClass>>.fromJson(
      serialized,
      (value) => _i3.Serializers.instance
          .deserialize<_i5.IList<_i6.SimpleClass>>(value),
    );
  }

  @override
  Object serialize(_i5.IList<_i5.IList<_i6.SimpleClass>> value) =>
      value.toJson((value) => _i3.Serializers.instance
          .serialize<_i5.IList<_i6.SimpleClass>>(value));
}

final class IListIListStringSerializer
    extends _i3.Serializer<_i5.IList<_i5.IList<String>>> {
  const IListIListStringSerializer();

  @override
  _i5.IList<_i5.IList<String>> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _i5.IList<_i5.IList<String>>.fromJson(
      serialized,
      (value) => _i3.Serializers.instance.deserialize<_i5.IList<String>>(value),
    );
  }

  @override
  Object serialize(_i5.IList<_i5.IList<String>> value) => value.toJson(
      (value) => _i3.Serializers.instance.serialize<_i5.IList<String>>(value));
}

final class IListIListUriSerializer
    extends _i3.Serializer<_i5.IList<_i5.IList<Uri>>> {
  const IListIListUriSerializer();

  @override
  _i5.IList<_i5.IList<Uri>> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _i5.IList<_i5.IList<Uri>>.fromJson(
      serialized,
      (value) => _i3.Serializers.instance.deserialize<_i5.IList<Uri>>(value),
    );
  }

  @override
  Object serialize(_i5.IList<_i5.IList<Uri>> value) => value.toJson(
      (value) => _i3.Serializers.instance.serialize<_i5.IList<Uri>>(value));
}

final class IListSimpleClassSerializer
    extends _i3.Serializer<_i5.IList<_i6.SimpleClass>> {
  const IListSimpleClassSerializer();

  @override
  _i5.IList<_i6.SimpleClass> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _i5.IList<_i6.SimpleClass>.fromJson(
      serialized,
      (value) => _i3.Serializers.instance.deserialize<_i6.SimpleClass>(value),
    );
  }

  @override
  Object serialize(_i5.IList<_i6.SimpleClass> value) => value.toJson(
      (value) => _i3.Serializers.instance.serialize<_i6.SimpleClass>(value));
}

final class IListStringSerializer extends _i3.Serializer<_i5.IList<String>> {
  const IListStringSerializer();

  @override
  _i5.IList<String> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _i5.IList<String>.fromJson(
      serialized,
      (value) => (value as String),
    );
  }

  @override
  Object serialize(_i5.IList<String> value) => value.toJson((value) => value);
}

final class IListUriSerializer extends _i3.Serializer<_i5.IList<Uri>> {
  const IListUriSerializer();

  @override
  _i5.IList<Uri> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _i5.IList<Uri>.fromJson(
      serialized,
      (value) => _i3.Serializers.instance.deserialize<Uri>(value),
    );
  }

  @override
  Object serialize(_i5.IList<Uri> value) =>
      value.toJson((value) => _i3.Serializers.instance.serialize<Uri>(value));
}

final class IMapStringIListSimpleClassSerializer
    extends _i3.Serializer<_i7.IMap<String, _i5.IList<_i6.SimpleClass>>> {
  const IMapStringIListSimpleClassSerializer();

  @override
  _i7.IMap<String, _i5.IList<_i6.SimpleClass>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.IMap<String, _i5.IList<_i6.SimpleClass>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => _i3.Serializers.instance
          .deserialize<_i5.IList<_i6.SimpleClass>>(value),
    );
  }

  @override
  Object serialize(_i7.IMap<String, _i5.IList<_i6.SimpleClass>> value) =>
      value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance
            .serialize<_i5.IList<_i6.SimpleClass>>(value),
      );
}

final class IMapStringIListStringSerializer
    extends _i3.Serializer<_i7.IMap<String, _i5.IList<String>>> {
  const IMapStringIListStringSerializer();

  @override
  _i7.IMap<String, _i5.IList<String>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.IMap<String, _i5.IList<String>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => _i3.Serializers.instance.deserialize<_i5.IList<String>>(value),
    );
  }

  @override
  Object serialize(_i7.IMap<String, _i5.IList<String>> value) => value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance.serialize<_i5.IList<String>>(value),
      );
}

final class IMapStringIListUriSerializer
    extends _i3.Serializer<_i7.IMap<String, _i5.IList<Uri>>> {
  const IMapStringIListUriSerializer();

  @override
  _i7.IMap<String, _i5.IList<Uri>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.IMap<String, _i5.IList<Uri>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => _i3.Serializers.instance.deserialize<_i5.IList<Uri>>(value),
    );
  }

  @override
  Object serialize(_i7.IMap<String, _i5.IList<Uri>> value) => value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance.serialize<_i5.IList<Uri>>(value),
      );
}

final class IMapStringIMapStringSimpleClassSerializer extends _i3
    .Serializer<_i7.IMap<String, _i7.IMap<String, _i6.SimpleClass>>> {
  const IMapStringIMapStringSimpleClassSerializer();

  @override
  _i7.IMap<String, _i7.IMap<String, _i6.SimpleClass>> deserialize(
      Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.IMap<String, _i7.IMap<String, _i6.SimpleClass>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => _i3.Serializers.instance
          .deserialize<_i7.IMap<String, _i6.SimpleClass>>(value),
    );
  }

  @override
  Object serialize(_i7.IMap<String, _i7.IMap<String, _i6.SimpleClass>> value) =>
      value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance
            .serialize<_i7.IMap<String, _i6.SimpleClass>>(value),
      );
}

final class IMapStringIMapStringStringSerializer
    extends _i3.Serializer<_i7.IMap<String, _i7.IMap<String, String>>> {
  const IMapStringIMapStringStringSerializer();

  @override
  _i7.IMap<String, _i7.IMap<String, String>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.IMap<String, _i7.IMap<String, String>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) =>
          _i3.Serializers.instance.deserialize<_i7.IMap<String, String>>(value),
    );
  }

  @override
  Object serialize(_i7.IMap<String, _i7.IMap<String, String>> value) =>
      value.toJson(
        (value) => value,
        (value) =>
            _i3.Serializers.instance.serialize<_i7.IMap<String, String>>(value),
      );
}

final class IMapStringIMapStringUriSerializer
    extends _i3.Serializer<_i7.IMap<String, _i7.IMap<String, Uri>>> {
  const IMapStringIMapStringUriSerializer();

  @override
  _i7.IMap<String, _i7.IMap<String, Uri>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.IMap<String, _i7.IMap<String, Uri>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) =>
          _i3.Serializers.instance.deserialize<_i7.IMap<String, Uri>>(value),
    );
  }

  @override
  Object serialize(_i7.IMap<String, _i7.IMap<String, Uri>> value) =>
      value.toJson(
        (value) => value,
        (value) =>
            _i3.Serializers.instance.serialize<_i7.IMap<String, Uri>>(value),
      );
}

final class IMapStringSimpleClassSerializer
    extends _i3.Serializer<_i7.IMap<String, _i6.SimpleClass>> {
  const IMapStringSimpleClassSerializer();

  @override
  _i7.IMap<String, _i6.SimpleClass> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.IMap<String, _i6.SimpleClass>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => _i3.Serializers.instance.deserialize<_i6.SimpleClass>(value),
    );
  }

  @override
  Object serialize(_i7.IMap<String, _i6.SimpleClass> value) => value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance.serialize<_i6.SimpleClass>(value),
      );
}

final class IMapStringStringSerializer
    extends _i3.Serializer<_i7.IMap<String, String>> {
  const IMapStringStringSerializer();

  @override
  _i7.IMap<String, String> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.IMap<String, String>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => (value as String),
    );
  }

  @override
  Object serialize(_i7.IMap<String, String> value) => value.toJson(
        (value) => value,
        (value) => value,
      );
}

final class IMapStringUriSerializer
    extends _i3.Serializer<_i7.IMap<String, Uri>> {
  const IMapStringUriSerializer();

  @override
  _i7.IMap<String, Uri> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.IMap<String, Uri>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => _i3.Serializers.instance.deserialize<Uri>(value),
    );
  }

  @override
  Object serialize(_i7.IMap<String, Uri> value) => value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance.serialize<Uri>(value),
      );
}

final class SimpleClassSerializer extends _i3.Serializer<_i6.SimpleClass> {
  const SimpleClassSerializer();

  @override
  _i6.SimpleClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, dynamic>>(value);
    return _i6.SimpleClass.fromJson(serialized);
  }

  @override
  Map<String, dynamic> serialize(_i6.SimpleClass value) => value.toJson();
}
