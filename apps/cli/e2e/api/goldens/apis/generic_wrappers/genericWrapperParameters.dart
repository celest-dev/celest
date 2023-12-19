// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:celest_core/celest_core.dart' as _i3;
import 'package:fast_immutable_collections/src/ilist/ilist.dart' as _i4;
import 'package:fast_immutable_collections/src/imap/imap.dart' as _i5;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i7;

import '../../../apis/generic_wrappers.dart' as _i2;

class GenericWrapperParametersTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final response = _i2.genericWrapperParameters(
        listOfString: _i3.Serializers.instance
            .deserialize<_i4.IList<String>>(request[r'listOfString']),
        listOfUri: _i3.Serializers.instance
            .deserialize<_i4.IList<Uri>>(request[r'listOfUri']),
        listOfSimpleClass: _i3.Serializers.instance
            .deserialize<_i4.IList<_i2.SimpleClass>>(
                request[r'listOfSimpleClass']),
        listOfListOfString: _i3.Serializers.instance
            .deserialize<_i4.IList<_i4.IList<String>>>(
                request[r'listOfListOfString']),
        listOfListOfUri: _i3.Serializers.instance
            .deserialize<_i4.IList<_i4.IList<Uri>>>(
                request[r'listOfListOfUri']),
        listOfListOfSimpleClass: _i3.Serializers.instance
            .deserialize<_i4.IList<_i4.IList<_i2.SimpleClass>>>(
                request[r'listOfListOfSimpleClass']),
        mapOfString: _i3.Serializers.instance
            .deserialize<_i5.IMap<String, String>>(request[r'mapOfString']),
        mapOfUri: _i3.Serializers.instance
            .deserialize<_i5.IMap<String, Uri>>(request[r'mapOfUri']),
        mapOfSimpleClass: _i3.Serializers.instance
            .deserialize<_i5.IMap<String, _i2.SimpleClass>>(
                request[r'mapOfSimpleClass']),
        mapOfListOfString: _i3.Serializers.instance
            .deserialize<_i5.IMap<String, _i4.IList<String>>>(
                request[r'mapOfListOfString']),
        mapOfListOfUri: _i3.Serializers.instance
            .deserialize<_i5.IMap<String, _i4.IList<Uri>>>(
                request[r'mapOfListOfUri']),
        mapOfListOfSimpleClass: _i3.Serializers.instance
            .deserialize<_i5.IMap<String, _i4.IList<_i2.SimpleClass>>>(
                request[r'mapOfListOfSimpleClass']),
        mapOfMapOfString: _i3.Serializers.instance
            .deserialize<_i5.IMap<String, _i5.IMap<String, String>>>(
                request[r'mapOfMapOfString']),
        mapOfMapOfUri: _i3.Serializers.instance
            .deserialize<_i5.IMap<String, _i5.IMap<String, Uri>>>(
                request[r'mapOfMapOfUri']),
        mapOfMapOfSimpleClass: _i3.Serializers.instance
            .deserialize<_i5.IMap<String, _i5.IMap<String, _i2.SimpleClass>>>(
                request[r'mapOfMapOfSimpleClass']),
      );
      return _i3.Serializers.instance.serialize<_i2.GenericWrappers>(response);
    },
    (json) => json as Map<String, dynamic>,
  );

  @override
  _i6.FutureOr<_i7.Response> handler(_i7.Request request) {
    final handler = _i7.Pipeline().addHandler(_inner.handler);
    return handler(request);
  }
}

_i6.Future<void> main(List<String> args) async {
  _i3.Serializers.instance.put(const IListStringSerializer());
  _i3.Serializers.instance.put(const IListUriSerializer());
  _i3.Serializers.instance.put(const SimpleClassSerializer());
  _i3.Serializers.instance.put(const IListSimpleClassSerializer());
  _i3.Serializers.instance.put(const IListIListStringSerializer());
  _i3.Serializers.instance.put(const IListIListUriSerializer());
  _i3.Serializers.instance.put(const IListIListSimpleClassSerializer());
  _i3.Serializers.instance.put(const IMapStringStringSerializer());
  _i3.Serializers.instance.put(const IMapStringUriSerializer());
  _i3.Serializers.instance.put(const IMapStringSimpleClassSerializer());
  _i3.Serializers.instance.put(const IMapStringIListStringSerializer());
  _i3.Serializers.instance.put(const IMapStringIListUriSerializer());
  _i3.Serializers.instance.put(const IMapStringIListSimpleClassSerializer());
  _i3.Serializers.instance.put(const IMapStringIMapStringStringSerializer());
  _i3.Serializers.instance.put(const IMapStringIMapStringUriSerializer());
  _i3.Serializers.instance
      .put(const IMapStringIMapStringSimpleClassSerializer());
  _i3.Serializers.instance.put(const GenericWrappersSerializer());
  await _i1.serve(
    args,
    (_) => GenericWrapperParametersTarget(),
  );
}

final class IListStringSerializer extends _i3.Serializer<_i4.IList<String>> {
  const IListStringSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/ilist/ilist.dart?T=dart%3Acore%23String#IList';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i4.IList<String> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _i4.IList<String>.fromJson(
      serialized,
      (value) => (value as String),
    );
  }

  @override
  Object serialize(_i4.IList<String> value) => value.toJson((value) => value);
}

final class IListUriSerializer extends _i3.Serializer<_i4.IList<Uri>> {
  const IListUriSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/ilist/ilist.dart?T=dart%3Acore%23Uri#IList';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i4.IList<Uri> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _i4.IList<Uri>.fromJson(
      serialized,
      (value) => _i3.Serializers.instance.deserialize<Uri>(value),
    );
  }

  @override
  Object serialize(_i4.IList<Uri> value) =>
      value.toJson((value) => _i3.Serializers.instance.serialize<Uri>(value));
}

final class SimpleClassSerializer extends _i3.Serializer<_i2.SimpleClass> {
  const SimpleClassSerializer();

  @override
  String get dartType => r'project:apis/generic_wrappers.dart#SimpleClass';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.SimpleClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i2.SimpleClass();
  }

  @override
  Map<String, Object?> serialize(_i2.SimpleClass value) => {};
}

final class IListSimpleClassSerializer
    extends _i3.Serializer<_i4.IList<_i2.SimpleClass>> {
  const IListSimpleClassSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/ilist/ilist.dart?T=project%3Aapis%2Fgeneric_wrappers.dart%23SimpleClass#IList';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i4.IList<_i2.SimpleClass> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _i4.IList<_i2.SimpleClass>.fromJson(
      serialized,
      (value) => _i3.Serializers.instance.deserialize<_i2.SimpleClass>(value),
    );
  }

  @override
  Object serialize(_i4.IList<_i2.SimpleClass> value) => value.toJson(
      (value) => _i3.Serializers.instance.serialize<_i2.SimpleClass>(value));
}

final class IListIListStringSerializer
    extends _i3.Serializer<_i4.IList<_i4.IList<String>>> {
  const IListIListStringSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/ilist/ilist.dart?T=package%3Afast_immutable_collections%2Fsrc%2Filist%2Filist.dart%3FT%3Ddart%253Acore%2523String%23IList#IList';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i4.IList<_i4.IList<String>> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _i4.IList<_i4.IList<String>>.fromJson(
      serialized,
      (value) => _i3.Serializers.instance.deserialize<_i4.IList<String>>(value),
    );
  }

  @override
  Object serialize(_i4.IList<_i4.IList<String>> value) => value.toJson(
      (value) => _i3.Serializers.instance.serialize<_i4.IList<String>>(value));
}

final class IListIListUriSerializer
    extends _i3.Serializer<_i4.IList<_i4.IList<Uri>>> {
  const IListIListUriSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/ilist/ilist.dart?T=package%3Afast_immutable_collections%2Fsrc%2Filist%2Filist.dart%3FT%3Ddart%253Acore%2523Uri%23IList#IList';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i4.IList<_i4.IList<Uri>> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _i4.IList<_i4.IList<Uri>>.fromJson(
      serialized,
      (value) => _i3.Serializers.instance.deserialize<_i4.IList<Uri>>(value),
    );
  }

  @override
  Object serialize(_i4.IList<_i4.IList<Uri>> value) => value.toJson(
      (value) => _i3.Serializers.instance.serialize<_i4.IList<Uri>>(value));
}

final class IListIListSimpleClassSerializer
    extends _i3.Serializer<_i4.IList<_i4.IList<_i2.SimpleClass>>> {
  const IListIListSimpleClassSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/ilist/ilist.dart?T=package%3Afast_immutable_collections%2Fsrc%2Filist%2Filist.dart%3FT%3Dproject%253Aapis%252Fgeneric_wrappers.dart%2523SimpleClass%23IList#IList';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i4.IList<_i4.IList<_i2.SimpleClass>> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _i4.IList<_i4.IList<_i2.SimpleClass>>.fromJson(
      serialized,
      (value) => _i3.Serializers.instance
          .deserialize<_i4.IList<_i2.SimpleClass>>(value),
    );
  }

  @override
  Object serialize(_i4.IList<_i4.IList<_i2.SimpleClass>> value) =>
      value.toJson((value) => _i3.Serializers.instance
          .serialize<_i4.IList<_i2.SimpleClass>>(value));
}

final class IMapStringStringSerializer
    extends _i3.Serializer<_i5.IMap<String, String>> {
  const IMapStringStringSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/imap/imap.dart?K=dart%3Acore%23String&V=dart%3Acore%23String#IMap';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.IMap<String, String> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.IMap<String, String>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => (value as String),
    );
  }

  @override
  Object serialize(_i5.IMap<String, String> value) => value.toJson(
        (value) => value,
        (value) => value,
      );
}

final class IMapStringUriSerializer
    extends _i3.Serializer<_i5.IMap<String, Uri>> {
  const IMapStringUriSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/imap/imap.dart?K=dart%3Acore%23String&V=dart%3Acore%23Uri#IMap';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.IMap<String, Uri> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.IMap<String, Uri>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => _i3.Serializers.instance.deserialize<Uri>(value),
    );
  }

  @override
  Object serialize(_i5.IMap<String, Uri> value) => value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance.serialize<Uri>(value),
      );
}

final class IMapStringSimpleClassSerializer
    extends _i3.Serializer<_i5.IMap<String, _i2.SimpleClass>> {
  const IMapStringSimpleClassSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/imap/imap.dart?K=dart%3Acore%23String&V=project%3Aapis%2Fgeneric_wrappers.dart%23SimpleClass#IMap';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.IMap<String, _i2.SimpleClass> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.IMap<String, _i2.SimpleClass>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => _i3.Serializers.instance.deserialize<_i2.SimpleClass>(value),
    );
  }

  @override
  Object serialize(_i5.IMap<String, _i2.SimpleClass> value) => value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance.serialize<_i2.SimpleClass>(value),
      );
}

final class IMapStringIListStringSerializer
    extends _i3.Serializer<_i5.IMap<String, _i4.IList<String>>> {
  const IMapStringIListStringSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/imap/imap.dart?K=dart%3Acore%23String&V=package%3Afast_immutable_collections%2Fsrc%2Filist%2Filist.dart%3FT%3Ddart%253Acore%2523String%23IList#IMap';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.IMap<String, _i4.IList<String>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.IMap<String, _i4.IList<String>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => _i3.Serializers.instance.deserialize<_i4.IList<String>>(value),
    );
  }

  @override
  Object serialize(_i5.IMap<String, _i4.IList<String>> value) => value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance.serialize<_i4.IList<String>>(value),
      );
}

final class IMapStringIListUriSerializer
    extends _i3.Serializer<_i5.IMap<String, _i4.IList<Uri>>> {
  const IMapStringIListUriSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/imap/imap.dart?K=dart%3Acore%23String&V=package%3Afast_immutable_collections%2Fsrc%2Filist%2Filist.dart%3FT%3Ddart%253Acore%2523Uri%23IList#IMap';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.IMap<String, _i4.IList<Uri>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.IMap<String, _i4.IList<Uri>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => _i3.Serializers.instance.deserialize<_i4.IList<Uri>>(value),
    );
  }

  @override
  Object serialize(_i5.IMap<String, _i4.IList<Uri>> value) => value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance.serialize<_i4.IList<Uri>>(value),
      );
}

final class IMapStringIListSimpleClassSerializer
    extends _i3.Serializer<_i5.IMap<String, _i4.IList<_i2.SimpleClass>>> {
  const IMapStringIListSimpleClassSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/imap/imap.dart?K=dart%3Acore%23String&V=package%3Afast_immutable_collections%2Fsrc%2Filist%2Filist.dart%3FT%3Dproject%253Aapis%252Fgeneric_wrappers.dart%2523SimpleClass%23IList#IMap';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.IMap<String, _i4.IList<_i2.SimpleClass>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.IMap<String, _i4.IList<_i2.SimpleClass>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => _i3.Serializers.instance
          .deserialize<_i4.IList<_i2.SimpleClass>>(value),
    );
  }

  @override
  Object serialize(_i5.IMap<String, _i4.IList<_i2.SimpleClass>> value) =>
      value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance
            .serialize<_i4.IList<_i2.SimpleClass>>(value),
      );
}

final class IMapStringIMapStringStringSerializer
    extends _i3.Serializer<_i5.IMap<String, _i5.IMap<String, String>>> {
  const IMapStringIMapStringStringSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/imap/imap.dart?K=dart%3Acore%23String&V=package%3Afast_immutable_collections%2Fsrc%2Fimap%2Fimap.dart%3FK%3Ddart%253Acore%2523String%26V%3Ddart%253Acore%2523String%23IMap#IMap';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.IMap<String, _i5.IMap<String, String>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.IMap<String, _i5.IMap<String, String>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) =>
          _i3.Serializers.instance.deserialize<_i5.IMap<String, String>>(value),
    );
  }

  @override
  Object serialize(_i5.IMap<String, _i5.IMap<String, String>> value) =>
      value.toJson(
        (value) => value,
        (value) =>
            _i3.Serializers.instance.serialize<_i5.IMap<String, String>>(value),
      );
}

final class IMapStringIMapStringUriSerializer
    extends _i3.Serializer<_i5.IMap<String, _i5.IMap<String, Uri>>> {
  const IMapStringIMapStringUriSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/imap/imap.dart?K=dart%3Acore%23String&V=package%3Afast_immutable_collections%2Fsrc%2Fimap%2Fimap.dart%3FK%3Ddart%253Acore%2523String%26V%3Ddart%253Acore%2523Uri%23IMap#IMap';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.IMap<String, _i5.IMap<String, Uri>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.IMap<String, _i5.IMap<String, Uri>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) =>
          _i3.Serializers.instance.deserialize<_i5.IMap<String, Uri>>(value),
    );
  }

  @override
  Object serialize(_i5.IMap<String, _i5.IMap<String, Uri>> value) =>
      value.toJson(
        (value) => value,
        (value) =>
            _i3.Serializers.instance.serialize<_i5.IMap<String, Uri>>(value),
      );
}

final class IMapStringIMapStringSimpleClassSerializer extends _i3
    .Serializer<_i5.IMap<String, _i5.IMap<String, _i2.SimpleClass>>> {
  const IMapStringIMapStringSimpleClassSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/imap/imap.dart?K=dart%3Acore%23String&V=package%3Afast_immutable_collections%2Fsrc%2Fimap%2Fimap.dart%3FK%3Ddart%253Acore%2523String%26V%3Dproject%253Aapis%252Fgeneric_wrappers.dart%2523SimpleClass%23IMap#IMap';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.IMap<String, _i5.IMap<String, _i2.SimpleClass>> deserialize(
      Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.IMap<String, _i5.IMap<String, _i2.SimpleClass>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => _i3.Serializers.instance
          .deserialize<_i5.IMap<String, _i2.SimpleClass>>(value),
    );
  }

  @override
  Object serialize(_i5.IMap<String, _i5.IMap<String, _i2.SimpleClass>> value) =>
      value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance
            .serialize<_i5.IMap<String, _i2.SimpleClass>>(value),
      );
}

final class GenericWrappersSerializer
    extends _i3.Serializer<_i2.GenericWrappers> {
  const GenericWrappersSerializer();

  @override
  String get dartType => r'project:apis/generic_wrappers.dart#GenericWrappers';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.GenericWrappers deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.GenericWrappers(
      listOfString: _i3.Serializers.instance
          .deserialize<_i4.IList<String>>(serialized[r'listOfString']),
      listOfUri: _i3.Serializers.instance
          .deserialize<_i4.IList<Uri>>(serialized[r'listOfUri']),
      listOfSimpleClass: _i3.Serializers.instance
          .deserialize<_i4.IList<_i2.SimpleClass>>(
              serialized[r'listOfSimpleClass']),
      listOfListOfString: _i3.Serializers.instance
          .deserialize<_i4.IList<_i4.IList<String>>>(
              serialized[r'listOfListOfString']),
      listOfListOfUri: _i3.Serializers.instance
          .deserialize<_i4.IList<_i4.IList<Uri>>>(
              serialized[r'listOfListOfUri']),
      listOfListOfSimpleClass: _i3.Serializers.instance
          .deserialize<_i4.IList<_i4.IList<_i2.SimpleClass>>>(
              serialized[r'listOfListOfSimpleClass']),
      mapOfString: _i3.Serializers.instance
          .deserialize<_i5.IMap<String, String>>(serialized[r'mapOfString']),
      mapOfUri: _i3.Serializers.instance
          .deserialize<_i5.IMap<String, Uri>>(serialized[r'mapOfUri']),
      mapOfSimpleClass: _i3.Serializers.instance
          .deserialize<_i5.IMap<String, _i2.SimpleClass>>(
              serialized[r'mapOfSimpleClass']),
      mapOfListOfString: _i3.Serializers.instance
          .deserialize<_i5.IMap<String, _i4.IList<String>>>(
              serialized[r'mapOfListOfString']),
      mapOfListOfUri: _i3.Serializers.instance
          .deserialize<_i5.IMap<String, _i4.IList<Uri>>>(
              serialized[r'mapOfListOfUri']),
      mapOfListOfSimpleClass: _i3.Serializers.instance
          .deserialize<_i5.IMap<String, _i4.IList<_i2.SimpleClass>>>(
              serialized[r'mapOfListOfSimpleClass']),
      mapOfMapOfString: _i3.Serializers.instance
          .deserialize<_i5.IMap<String, _i5.IMap<String, String>>>(
              serialized[r'mapOfMapOfString']),
      mapOfMapOfUri: _i3.Serializers.instance
          .deserialize<_i5.IMap<String, _i5.IMap<String, Uri>>>(
              serialized[r'mapOfMapOfUri']),
      mapOfMapOfSimpleClass: _i3.Serializers.instance
          .deserialize<_i5.IMap<String, _i5.IMap<String, _i2.SimpleClass>>>(
              serialized[r'mapOfMapOfSimpleClass']),
    );
  }

  @override
  Map<String, Object?> serialize(_i2.GenericWrappers value) => {
        r'listOfString': _i3.Serializers.instance
            .serialize<_i4.IList<String>>(value.listOfString),
        r'listOfUri':
            _i3.Serializers.instance.serialize<_i4.IList<Uri>>(value.listOfUri),
        r'listOfSimpleClass': _i3.Serializers.instance
            .serialize<_i4.IList<_i2.SimpleClass>>(value.listOfSimpleClass),
        r'listOfListOfString': _i3.Serializers.instance
            .serialize<_i4.IList<_i4.IList<String>>>(value.listOfListOfString),
        r'listOfListOfUri': _i3.Serializers.instance
            .serialize<_i4.IList<_i4.IList<Uri>>>(value.listOfListOfUri),
        r'listOfListOfSimpleClass': _i3.Serializers.instance
            .serialize<_i4.IList<_i4.IList<_i2.SimpleClass>>>(
                value.listOfListOfSimpleClass),
        r'mapOfString': _i3.Serializers.instance
            .serialize<_i5.IMap<String, String>>(value.mapOfString),
        r'mapOfUri': _i3.Serializers.instance
            .serialize<_i5.IMap<String, Uri>>(value.mapOfUri),
        r'mapOfSimpleClass': _i3.Serializers.instance
            .serialize<_i5.IMap<String, _i2.SimpleClass>>(
                value.mapOfSimpleClass),
        r'mapOfListOfString': _i3.Serializers.instance
            .serialize<_i5.IMap<String, _i4.IList<String>>>(
                value.mapOfListOfString),
        r'mapOfListOfUri': _i3.Serializers.instance
            .serialize<_i5.IMap<String, _i4.IList<Uri>>>(value.mapOfListOfUri),
        r'mapOfListOfSimpleClass': _i3.Serializers.instance
            .serialize<_i5.IMap<String, _i4.IList<_i2.SimpleClass>>>(
                value.mapOfListOfSimpleClass),
        r'mapOfMapOfString': _i3.Serializers.instance
            .serialize<_i5.IMap<String, _i5.IMap<String, String>>>(
                value.mapOfMapOfString),
        r'mapOfMapOfUri': _i3.Serializers.instance
            .serialize<_i5.IMap<String, _i5.IMap<String, Uri>>>(
                value.mapOfMapOfUri),
        r'mapOfMapOfSimpleClass': _i3.Serializers.instance
            .serialize<_i5.IMap<String, _i5.IMap<String, _i2.SimpleClass>>>(
                value.mapOfMapOfSimpleClass),
      };
}
