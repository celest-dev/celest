// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i3;

import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/person.dart' as _i5;

import '../../../functions/injected.dart' as _i2;

final class SayHelloPersonTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'sayHelloPerson';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.sayHelloPerson(
      name: _i3.Platform.environment[r'MY_NAME']!,
      age: int.parse(_i3.Platform.environment[r'MY_AGE']!),
      height: double.parse(_i3.Platform.environment[r'MY_HEIGHT']!),
      weight: num.parse(_i3.Platform.environment[r'MY_WEIGHT']!),
      isCool: bool.parse(_i3.Platform.environment[r'IM_COOL']!),
      website: Uri.parse(_i3.Platform.environment[r'MY_WEBSITE']!),
    );
    return (
      statusCode: 200,
      body: {
        'response': _i4.Serializers.instance.serialize<_i5.Person>(response)
      }
    );
  }

  @override
  void init() {
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.Person, Map<String, Object?>>(
      serialize: ($value) => {
        r'name': $value.name,
        r'age': $value.age,
        r'height': $value.height,
        r'weight': $value.weight,
        r'isCool': $value.isCool,
        r'website': _i4.Serializers.instance.serialize<Uri>($value.website),
      },
      deserialize: ($serialized) {
        return _i5.Person(
          name: ($serialized[r'name'] as String),
          age: ($serialized[r'age'] as num).toInt(),
          height: ($serialized[r'height'] as num).toDouble(),
          weight: ($serialized[r'weight'] as num),
          isCool: ($serialized[r'isCool'] as bool),
          website: _i4.Serializers.instance
              .deserialize<Uri>($serialized[r'website']),
        );
      },
    ));
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': SayHelloPersonTarget()},
  );
}
