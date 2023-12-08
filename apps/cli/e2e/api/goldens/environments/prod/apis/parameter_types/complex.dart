// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i4;

import '../../../../../apis/parameter_types.dart' as _i2;

class ComplexTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      return _i2.complex(
        (),
        (
          aBool: (request[r'aComplexStruct']['aBool'] as bool),
          aDouble: (request[r'aComplexStruct']['aDouble'] as double),
          aListOfBool:
              (request[r'aComplexStruct']['aListOfBool'] as Iterable<Object?>)
                  .map((el) {
            return (el as bool);
          }).toList(),
          aListOfDouble:
              (request[r'aComplexStruct']['aListOfDouble'] as Iterable<Object?>)
                  .map((el) {
            return (el as double);
          }).toList(),
          aListOfEnum:
              (request[r'aComplexStruct']['aListOfEnum'] as Iterable<Object?>)
                  .map((el) {
            return _i2.MyEnum.values.byName((el as String));
          }).toList(),
          aListOfInt:
              (request[r'aComplexStruct']['aListOfInt'] as Iterable<Object?>)
                  .map((el) {
            return (el as int);
          }).toList(),
          aListOfNull:
              (request[r'aComplexStruct']['aListOfNull'] as Iterable<Object?>)
                  .map((el) {
            return (el as Null);
          }).toList(),
          aListOfSimpleClass: (request[r'aComplexStruct']['aListOfSimpleClass']
                  as Iterable<Object?>)
              .map((el) {
            (el as Map<String, Object?>);
            return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
          }).toList(),
          aListOfSimpleStruct: (request[r'aComplexStruct']
                  ['aListOfSimpleStruct'] as Iterable<Object?>)
              .map((el) {
            (el as Map<String, Object?>);
            return ();
          }).toList(),
          aListOfString:
              (request[r'aComplexStruct']['aListOfString'] as Iterable<Object?>)
                  .map((el) {
            return (el as String);
          }).toList(),
          aMapOfBool:
              (request[r'aComplexStruct']['aMapOfBool'] as Map<String, Object?>)
                  .map((
            key,
            value,
          ) {
            return MapEntry(
              key,
              (value as bool),
            );
          }),
          aMapOfDouble: (request[r'aComplexStruct']['aMapOfDouble']
                  as Map<String, Object?>)
              .map((
            key,
            value,
          ) {
            return MapEntry(
              key,
              (value as double),
            );
          }),
          aMapOfEnum:
              (request[r'aComplexStruct']['aMapOfEnum'] as Map<String, Object?>)
                  .map((
            key,
            value,
          ) {
            return MapEntry(
              key,
              _i2.MyEnum.values.byName((value as String)),
            );
          }),
          aMapOfInt:
              (request[r'aComplexStruct']['aMapOfInt'] as Map<String, Object?>)
                  .map((
            key,
            value,
          ) {
            return MapEntry(
              key,
              (value as int),
            );
          }),
          aMapOfNull:
              (request[r'aComplexStruct']['aMapOfNull'] as Map<String, Object?>)
                  .map((
            key,
            value,
          ) {
            return MapEntry(
              key,
              (value as Null),
            );
          }),
          aMapOfSimpleClass: (request[r'aComplexStruct']['aMapOfSimpleClass']
                  as Map<String, Object?>)
              .map((
            key,
            value,
          ) {
            (value as Map<String, Object?>);
            return MapEntry(
              key,
              _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
            );
          }),
          aMapOfSimpleStruct: (request[r'aComplexStruct']['aMapOfSimpleStruct']
                  as Map<String, Object?>)
              .map((
            key,
            value,
          ) {
            (value as Map<String, Object?>);
            return MapEntry(
              key,
              (),
            );
          }),
          aMapOfString: (request[r'aComplexStruct']['aMapOfString']
                  as Map<String, Object?>)
              .map((
            key,
            value,
          ) {
            return MapEntry(
              key,
              (value as String),
            );
          }),
          aNull: (request[r'aComplexStruct']['aNull'] as Null),
          aSimpleClass: _i2.SimpleClass.fromJson((request[r'aComplexStruct']
              ['aSimpleClass'] as Map<String, dynamic>)),
          aSimpleStruct: (),
          aString: (request[r'aComplexStruct']['aString'] as String),
          anEnum: _i2.MyEnum.values
              .byName((request[r'aComplexStruct']['anEnum'] as String)),
          anInt: (request[r'aComplexStruct']['anInt'] as int),
          anIterableOfBool: (request[r'aComplexStruct']['anIterableOfBool']
                  as Iterable<Object?>)
              .map((el) {
            return (el as bool);
          }).toList(),
          anIterableOfDouble: (request[r'aComplexStruct']['anIterableOfDouble']
                  as Iterable<Object?>)
              .map((el) {
            return (el as double);
          }).toList(),
          anIterableOfEnum: (request[r'aComplexStruct']['anIterableOfEnum']
                  as Iterable<Object?>)
              .map((el) {
            return _i2.MyEnum.values.byName((el as String));
          }).toList(),
          anIterableOfInt: (request[r'aComplexStruct']['anIterableOfInt']
                  as Iterable<Object?>)
              .map((el) {
            return (el as int);
          }).toList(),
          anIterableOfNull: (request[r'aComplexStruct']['anIterableOfNull']
                  as Iterable<Object?>)
              .map((el) {
            return (el as Null);
          }).toList(),
          anIterableOfSimpleClass: (request[r'aComplexStruct']
                  ['anIterableOfSimpleClass'] as Iterable<Object?>)
              .map((el) {
            (el as Map<String, Object?>);
            return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
          }).toList(),
          anIterableOfSimpleStruct: (request[r'aComplexStruct']
                  ['anIterableOfSimpleStruct'] as Iterable<Object?>)
              .map((el) {
            (el as Map<String, Object?>);
            return ();
          }).toList(),
          anIterableOfString: (request[r'aComplexStruct']['anIterableOfString']
                  as Iterable<Object?>)
              .map((el) {
            return (el as String);
          }).toList()
        ),
        _i2.SimpleClass.fromJson(
            (request[r'aSimpleClass'] as Map<String, dynamic>)),
        _i2.ComplexClass.fromJson(
            (request[r'aComplexClass'] as Map<String, dynamic>)),
        request[r'aNullableSimpleStruct'] == null ? null : (),
        request[r'aNullableComplexStruct'] == null
            ? null
            : (
                aBool: (request[r'aNullableComplexStruct']['aBool'] as bool),
                aDouble:
                    (request[r'aNullableComplexStruct']['aDouble'] as double),
                aListOfBool: (request[r'aNullableComplexStruct']['aListOfBool']
                        as Iterable<Object?>)
                    .map((el) {
                  return (el as bool);
                }).toList(),
                aListOfDouble: (request[r'aNullableComplexStruct']
                        ['aListOfDouble'] as Iterable<Object?>)
                    .map((el) {
                  return (el as double);
                }).toList(),
                aListOfEnum: (request[r'aNullableComplexStruct']['aListOfEnum']
                        as Iterable<Object?>)
                    .map((el) {
                  return _i2.MyEnum.values.byName((el as String));
                }).toList(),
                aListOfInt: (request[r'aNullableComplexStruct']['aListOfInt']
                        as Iterable<Object?>)
                    .map((el) {
                  return (el as int);
                }).toList(),
                aListOfNull: (request[r'aNullableComplexStruct']['aListOfNull']
                        as Iterable<Object?>)
                    .map((el) {
                  return (el as Null);
                }).toList(),
                aListOfSimpleClass: (request[r'aNullableComplexStruct']
                        ['aListOfSimpleClass'] as Iterable<Object?>)
                    .map((el) {
                  (el as Map<String, Object?>);
                  return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
                }).toList(),
                aListOfSimpleStruct: (request[r'aNullableComplexStruct']
                        ['aListOfSimpleStruct'] as Iterable<Object?>)
                    .map((el) {
                  (el as Map<String, Object?>);
                  return ();
                }).toList(),
                aListOfString: (request[r'aNullableComplexStruct']
                        ['aListOfString'] as Iterable<Object?>)
                    .map((el) {
                  return (el as String);
                }).toList(),
                aMapOfBool: (request[r'aNullableComplexStruct']['aMapOfBool']
                        as Map<String, Object?>)
                    .map((
                  key,
                  value,
                ) {
                  return MapEntry(
                    key,
                    (value as bool),
                  );
                }),
                aMapOfDouble: (request[r'aNullableComplexStruct']
                        ['aMapOfDouble'] as Map<String, Object?>)
                    .map((
                  key,
                  value,
                ) {
                  return MapEntry(
                    key,
                    (value as double),
                  );
                }),
                aMapOfEnum: (request[r'aNullableComplexStruct']['aMapOfEnum']
                        as Map<String, Object?>)
                    .map((
                  key,
                  value,
                ) {
                  return MapEntry(
                    key,
                    _i2.MyEnum.values.byName((value as String)),
                  );
                }),
                aMapOfInt: (request[r'aNullableComplexStruct']['aMapOfInt']
                        as Map<String, Object?>)
                    .map((
                  key,
                  value,
                ) {
                  return MapEntry(
                    key,
                    (value as int),
                  );
                }),
                aMapOfNull: (request[r'aNullableComplexStruct']['aMapOfNull']
                        as Map<String, Object?>)
                    .map((
                  key,
                  value,
                ) {
                  return MapEntry(
                    key,
                    (value as Null),
                  );
                }),
                aMapOfSimpleClass: (request[r'aNullableComplexStruct']
                        ['aMapOfSimpleClass'] as Map<String, Object?>)
                    .map((
                  key,
                  value,
                ) {
                  (value as Map<String, Object?>);
                  return MapEntry(
                    key,
                    _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
                  );
                }),
                aMapOfSimpleStruct: (request[r'aNullableComplexStruct']
                        ['aMapOfSimpleStruct'] as Map<String, Object?>)
                    .map((
                  key,
                  value,
                ) {
                  (value as Map<String, Object?>);
                  return MapEntry(
                    key,
                    (),
                  );
                }),
                aMapOfString: (request[r'aNullableComplexStruct']
                        ['aMapOfString'] as Map<String, Object?>)
                    .map((
                  key,
                  value,
                ) {
                  return MapEntry(
                    key,
                    (value as String),
                  );
                }),
                aNull: (request[r'aNullableComplexStruct']['aNull'] as Null),
                aSimpleClass: _i2.SimpleClass.fromJson(
                    (request[r'aNullableComplexStruct']['aSimpleClass']
                        as Map<String, dynamic>)),
                aSimpleStruct: (),
                aString:
                    (request[r'aNullableComplexStruct']['aString'] as String),
                anEnum: _i2.MyEnum.values.byName(
                    (request[r'aNullableComplexStruct']['anEnum'] as String)),
                anInt: (request[r'aNullableComplexStruct']['anInt'] as int),
                anIterableOfBool: (request[r'aNullableComplexStruct']
                        ['anIterableOfBool'] as Iterable<Object?>)
                    .map((el) {
                  return (el as bool);
                }).toList(),
                anIterableOfDouble: (request[r'aNullableComplexStruct']
                        ['anIterableOfDouble'] as Iterable<Object?>)
                    .map((el) {
                  return (el as double);
                }).toList(),
                anIterableOfEnum: (request[r'aNullableComplexStruct']
                        ['anIterableOfEnum'] as Iterable<Object?>)
                    .map((el) {
                  return _i2.MyEnum.values.byName((el as String));
                }).toList(),
                anIterableOfInt: (request[r'aNullableComplexStruct']
                        ['anIterableOfInt'] as Iterable<Object?>)
                    .map((el) {
                  return (el as int);
                }).toList(),
                anIterableOfNull: (request[r'aNullableComplexStruct']
                        ['anIterableOfNull'] as Iterable<Object?>)
                    .map((el) {
                  return (el as Null);
                }).toList(),
                anIterableOfSimpleClass: (request[r'aNullableComplexStruct']
                        ['anIterableOfSimpleClass'] as Iterable<Object?>)
                    .map((el) {
                  (el as Map<String, Object?>);
                  return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
                }).toList(),
                anIterableOfSimpleStruct: (request[r'aNullableComplexStruct']
                        ['anIterableOfSimpleStruct'] as Iterable<Object?>)
                    .map((el) {
                  (el as Map<String, Object?>);
                  return ();
                }).toList(),
                anIterableOfString: (request[r'aNullableComplexStruct']
                        ['anIterableOfString'] as Iterable<Object?>)
                    .map((el) {
                  return (el as String);
                }).toList()
              ),
        request[r'aNullableSimpleClass'] == null
            ? null
            : _i2.SimpleClass?.fromJson(
                (request[r'aNullableSimpleClass'] as Map<String, dynamic>)),
        request[r'aNullableComplexClass'] == null
            ? null
            : _i2.ComplexClass?.fromJson(
                (request[r'aNullableComplexClass'] as Map<String, dynamic>)),
        (request[r'anIterableOfSimpleStruct'] as Iterable<Object?>).map((el) {
          (el as Map<String, Object?>);
          return ();
        }).toList(),
        (request[r'anIterableOfComplexStruct'] as Iterable<Object?>).map((el) {
          (el as Map<String, Object?>);
          return (
            aBool: (el['aBool'] as bool),
            aDouble: (el['aDouble'] as double),
            aListOfBool: (el['aListOfBool'] as Iterable<Object?>).map((el) {
              return (el as bool);
            }).toList(),
            aListOfDouble: (el['aListOfDouble'] as Iterable<Object?>).map((el) {
              return (el as double);
            }).toList(),
            aListOfEnum: (el['aListOfEnum'] as Iterable<Object?>).map((el) {
              return _i2.MyEnum.values.byName((el as String));
            }).toList(),
            aListOfInt: (el['aListOfInt'] as Iterable<Object?>).map((el) {
              return (el as int);
            }).toList(),
            aListOfNull: (el['aListOfNull'] as Iterable<Object?>).map((el) {
              return (el as Null);
            }).toList(),
            aListOfSimpleClass:
                (el['aListOfSimpleClass'] as Iterable<Object?>).map((el) {
              (el as Map<String, Object?>);
              return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
            }).toList(),
            aListOfSimpleStruct:
                (el['aListOfSimpleStruct'] as Iterable<Object?>).map((el) {
              (el as Map<String, Object?>);
              return ();
            }).toList(),
            aListOfString: (el['aListOfString'] as Iterable<Object?>).map((el) {
              return (el as String);
            }).toList(),
            aMapOfBool: (el['aMapOfBool'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as bool),
              );
            }),
            aMapOfDouble: (el['aMapOfDouble'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as double),
              );
            }),
            aMapOfEnum: (el['aMapOfEnum'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                _i2.MyEnum.values.byName((value as String)),
              );
            }),
            aMapOfInt: (el['aMapOfInt'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as int),
              );
            }),
            aMapOfNull: (el['aMapOfNull'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as Null),
              );
            }),
            aMapOfSimpleClass:
                (el['aMapOfSimpleClass'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              (value as Map<String, Object?>);
              return MapEntry(
                key,
                _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
              );
            }),
            aMapOfSimpleStruct:
                (el['aMapOfSimpleStruct'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              (value as Map<String, Object?>);
              return MapEntry(
                key,
                (),
              );
            }),
            aMapOfString: (el['aMapOfString'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as String),
              );
            }),
            aNull: (el['aNull'] as Null),
            aSimpleClass: _i2.SimpleClass.fromJson(
                (el['aSimpleClass'] as Map<String, dynamic>)),
            aSimpleStruct: (),
            aString: (el['aString'] as String),
            anEnum: _i2.MyEnum.values.byName((el['anEnum'] as String)),
            anInt: (el['anInt'] as int),
            anIterableOfBool:
                (el['anIterableOfBool'] as Iterable<Object?>).map((el) {
              return (el as bool);
            }).toList(),
            anIterableOfDouble:
                (el['anIterableOfDouble'] as Iterable<Object?>).map((el) {
              return (el as double);
            }).toList(),
            anIterableOfEnum:
                (el['anIterableOfEnum'] as Iterable<Object?>).map((el) {
              return _i2.MyEnum.values.byName((el as String));
            }).toList(),
            anIterableOfInt:
                (el['anIterableOfInt'] as Iterable<Object?>).map((el) {
              return (el as int);
            }).toList(),
            anIterableOfNull:
                (el['anIterableOfNull'] as Iterable<Object?>).map((el) {
              return (el as Null);
            }).toList(),
            anIterableOfSimpleClass:
                (el['anIterableOfSimpleClass'] as Iterable<Object?>).map((el) {
              (el as Map<String, Object?>);
              return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
            }).toList(),
            anIterableOfSimpleStruct:
                (el['anIterableOfSimpleStruct'] as Iterable<Object?>).map((el) {
              (el as Map<String, Object?>);
              return ();
            }).toList(),
            anIterableOfString:
                (el['anIterableOfString'] as Iterable<Object?>).map((el) {
              return (el as String);
            }).toList()
          );
        }).toList(),
        (request[r'anIterableOfSimpleClass'] as Iterable<Object?>).map((el) {
          (el as Map<String, Object?>);
          return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
        }).toList(),
        (request[r'anIterableOfComplexClass'] as Iterable<Object?>).map((el) {
          (el as Map<String, Object?>);
          return _i2.ComplexClass.fromJson((el as Map<String, dynamic>));
        }).toList(),
        request[r'aNullableIterableOfSimpleStruct'] == null
            ? null
            : (request[r'aNullableIterableOfSimpleStruct'] as Iterable<Object?>)
                .map((el) {
                (el as Map<String, Object?>);
                return ();
              }).toList(),
        request[r'aNullableIterableOfComplexStruct'] == null
            ? null
            : (request[r'aNullableIterableOfComplexStruct']
                    as Iterable<Object?>)
                .map((el) {
                (el as Map<String, Object?>);
                return (
                  aBool: (el['aBool'] as bool),
                  aDouble: (el['aDouble'] as double),
                  aListOfBool:
                      (el['aListOfBool'] as Iterable<Object?>).map((el) {
                    return (el as bool);
                  }).toList(),
                  aListOfDouble:
                      (el['aListOfDouble'] as Iterable<Object?>).map((el) {
                    return (el as double);
                  }).toList(),
                  aListOfEnum:
                      (el['aListOfEnum'] as Iterable<Object?>).map((el) {
                    return _i2.MyEnum.values.byName((el as String));
                  }).toList(),
                  aListOfInt: (el['aListOfInt'] as Iterable<Object?>).map((el) {
                    return (el as int);
                  }).toList(),
                  aListOfNull:
                      (el['aListOfNull'] as Iterable<Object?>).map((el) {
                    return (el as Null);
                  }).toList(),
                  aListOfSimpleClass:
                      (el['aListOfSimpleClass'] as Iterable<Object?>).map((el) {
                    (el as Map<String, Object?>);
                    return _i2.SimpleClass.fromJson(
                        (el as Map<String, dynamic>));
                  }).toList(),
                  aListOfSimpleStruct:
                      (el['aListOfSimpleStruct'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return ();
                  }).toList(),
                  aListOfString:
                      (el['aListOfString'] as Iterable<Object?>).map((el) {
                    return (el as String);
                  }).toList(),
                  aMapOfBool: (el['aMapOfBool'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as bool),
                    );
                  }),
                  aMapOfDouble:
                      (el['aMapOfDouble'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as double),
                    );
                  }),
                  aMapOfEnum: (el['aMapOfEnum'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      _i2.MyEnum.values.byName((value as String)),
                    );
                  }),
                  aMapOfInt: (el['aMapOfInt'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as int),
                    );
                  }),
                  aMapOfNull: (el['aMapOfNull'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as Null),
                    );
                  }),
                  aMapOfSimpleClass:
                      (el['aMapOfSimpleClass'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    (value as Map<String, Object?>);
                    return MapEntry(
                      key,
                      _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
                    );
                  }),
                  aMapOfSimpleStruct:
                      (el['aMapOfSimpleStruct'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    (value as Map<String, Object?>);
                    return MapEntry(
                      key,
                      (),
                    );
                  }),
                  aMapOfString:
                      (el['aMapOfString'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as String),
                    );
                  }),
                  aNull: (el['aNull'] as Null),
                  aSimpleClass: _i2.SimpleClass.fromJson(
                      (el['aSimpleClass'] as Map<String, dynamic>)),
                  aSimpleStruct: (),
                  aString: (el['aString'] as String),
                  anEnum: _i2.MyEnum.values.byName((el['anEnum'] as String)),
                  anInt: (el['anInt'] as int),
                  anIterableOfBool:
                      (el['anIterableOfBool'] as Iterable<Object?>).map((el) {
                    return (el as bool);
                  }).toList(),
                  anIterableOfDouble:
                      (el['anIterableOfDouble'] as Iterable<Object?>).map((el) {
                    return (el as double);
                  }).toList(),
                  anIterableOfEnum:
                      (el['anIterableOfEnum'] as Iterable<Object?>).map((el) {
                    return _i2.MyEnum.values.byName((el as String));
                  }).toList(),
                  anIterableOfInt:
                      (el['anIterableOfInt'] as Iterable<Object?>).map((el) {
                    return (el as int);
                  }).toList(),
                  anIterableOfNull:
                      (el['anIterableOfNull'] as Iterable<Object?>).map((el) {
                    return (el as Null);
                  }).toList(),
                  anIterableOfSimpleClass:
                      (el['anIterableOfSimpleClass'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return _i2.SimpleClass.fromJson(
                        (el as Map<String, dynamic>));
                  }).toList(),
                  anIterableOfSimpleStruct:
                      (el['anIterableOfSimpleStruct'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return ();
                  }).toList(),
                  anIterableOfString:
                      (el['anIterableOfString'] as Iterable<Object?>).map((el) {
                    return (el as String);
                  }).toList()
                );
              }).toList(),
        request[r'aNullableIterableOfSimpleClass'] == null
            ? null
            : (request[r'aNullableIterableOfSimpleClass'] as Iterable<Object?>)
                .map((el) {
                (el as Map<String, Object?>);
                return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
              }).toList(),
        request[r'aNullableIterableOfComplexClass'] == null
            ? null
            : (request[r'aNullableIterableOfComplexClass'] as Iterable<Object?>)
                .map((el) {
                (el as Map<String, Object?>);
                return _i2.ComplexClass.fromJson((el as Map<String, dynamic>));
              }).toList(),
        (request[r'anIterableOfNullableSimpleStruct'] as Iterable<Object?>)
            .map((el) {
          (el as Map<String, Object?>?);
          return el == null ? null : ();
        }).toList(),
        (request[r'anIterableOfNullableComplexStruct'] as Iterable<Object?>)
            .map((el) {
          (el as Map<String, Object?>?);
          return el == null
              ? null
              : (
                  aBool: (el['aBool'] as bool),
                  aDouble: (el['aDouble'] as double),
                  aListOfBool:
                      (el['aListOfBool'] as Iterable<Object?>).map((el) {
                    return (el as bool);
                  }).toList(),
                  aListOfDouble:
                      (el['aListOfDouble'] as Iterable<Object?>).map((el) {
                    return (el as double);
                  }).toList(),
                  aListOfEnum:
                      (el['aListOfEnum'] as Iterable<Object?>).map((el) {
                    return _i2.MyEnum.values.byName((el as String));
                  }).toList(),
                  aListOfInt: (el['aListOfInt'] as Iterable<Object?>).map((el) {
                    return (el as int);
                  }).toList(),
                  aListOfNull:
                      (el['aListOfNull'] as Iterable<Object?>).map((el) {
                    return (el as Null);
                  }).toList(),
                  aListOfSimpleClass:
                      (el['aListOfSimpleClass'] as Iterable<Object?>).map((el) {
                    (el as Map<String, Object?>);
                    return _i2.SimpleClass.fromJson(
                        (el as Map<String, dynamic>));
                  }).toList(),
                  aListOfSimpleStruct:
                      (el['aListOfSimpleStruct'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return ();
                  }).toList(),
                  aListOfString:
                      (el['aListOfString'] as Iterable<Object?>).map((el) {
                    return (el as String);
                  }).toList(),
                  aMapOfBool: (el['aMapOfBool'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as bool),
                    );
                  }),
                  aMapOfDouble:
                      (el['aMapOfDouble'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as double),
                    );
                  }),
                  aMapOfEnum: (el['aMapOfEnum'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      _i2.MyEnum.values.byName((value as String)),
                    );
                  }),
                  aMapOfInt: (el['aMapOfInt'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as int),
                    );
                  }),
                  aMapOfNull: (el['aMapOfNull'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as Null),
                    );
                  }),
                  aMapOfSimpleClass:
                      (el['aMapOfSimpleClass'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    (value as Map<String, Object?>);
                    return MapEntry(
                      key,
                      _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
                    );
                  }),
                  aMapOfSimpleStruct:
                      (el['aMapOfSimpleStruct'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    (value as Map<String, Object?>);
                    return MapEntry(
                      key,
                      (),
                    );
                  }),
                  aMapOfString:
                      (el['aMapOfString'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as String),
                    );
                  }),
                  aNull: (el['aNull'] as Null),
                  aSimpleClass: _i2.SimpleClass.fromJson(
                      (el['aSimpleClass'] as Map<String, dynamic>)),
                  aSimpleStruct: (),
                  aString: (el['aString'] as String),
                  anEnum: _i2.MyEnum.values.byName((el['anEnum'] as String)),
                  anInt: (el['anInt'] as int),
                  anIterableOfBool:
                      (el['anIterableOfBool'] as Iterable<Object?>).map((el) {
                    return (el as bool);
                  }).toList(),
                  anIterableOfDouble:
                      (el['anIterableOfDouble'] as Iterable<Object?>).map((el) {
                    return (el as double);
                  }).toList(),
                  anIterableOfEnum:
                      (el['anIterableOfEnum'] as Iterable<Object?>).map((el) {
                    return _i2.MyEnum.values.byName((el as String));
                  }).toList(),
                  anIterableOfInt:
                      (el['anIterableOfInt'] as Iterable<Object?>).map((el) {
                    return (el as int);
                  }).toList(),
                  anIterableOfNull:
                      (el['anIterableOfNull'] as Iterable<Object?>).map((el) {
                    return (el as Null);
                  }).toList(),
                  anIterableOfSimpleClass:
                      (el['anIterableOfSimpleClass'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return _i2.SimpleClass.fromJson(
                        (el as Map<String, dynamic>));
                  }).toList(),
                  anIterableOfSimpleStruct:
                      (el['anIterableOfSimpleStruct'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return ();
                  }).toList(),
                  anIterableOfString:
                      (el['anIterableOfString'] as Iterable<Object?>).map((el) {
                    return (el as String);
                  }).toList()
                );
        }).toList(),
        (request[r'anIterableOfNullableSimpleClass'] as Iterable<Object?>)
            .map((el) {
          (el as Map<String, Object?>?);
          return el == null
              ? null
              : _i2.SimpleClass?.fromJson((el as Map<String, dynamic>));
        }).toList(),
        (request[r'anIterableOfNullableComplexClass'] as Iterable<Object?>)
            .map((el) {
          (el as Map<String, Object?>?);
          return el == null
              ? null
              : _i2.ComplexClass?.fromJson((el as Map<String, dynamic>));
        }).toList(),
        (request[r'aListOfSimpleStruct'] as Iterable<Object?>).map((el) {
          (el as Map<String, Object?>);
          return ();
        }).toList(),
        (request[r'aListOfComplexStruct'] as Iterable<Object?>).map((el) {
          (el as Map<String, Object?>);
          return (
            aBool: (el['aBool'] as bool),
            aDouble: (el['aDouble'] as double),
            aListOfBool: (el['aListOfBool'] as Iterable<Object?>).map((el) {
              return (el as bool);
            }).toList(),
            aListOfDouble: (el['aListOfDouble'] as Iterable<Object?>).map((el) {
              return (el as double);
            }).toList(),
            aListOfEnum: (el['aListOfEnum'] as Iterable<Object?>).map((el) {
              return _i2.MyEnum.values.byName((el as String));
            }).toList(),
            aListOfInt: (el['aListOfInt'] as Iterable<Object?>).map((el) {
              return (el as int);
            }).toList(),
            aListOfNull: (el['aListOfNull'] as Iterable<Object?>).map((el) {
              return (el as Null);
            }).toList(),
            aListOfSimpleClass:
                (el['aListOfSimpleClass'] as Iterable<Object?>).map((el) {
              (el as Map<String, Object?>);
              return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
            }).toList(),
            aListOfSimpleStruct:
                (el['aListOfSimpleStruct'] as Iterable<Object?>).map((el) {
              (el as Map<String, Object?>);
              return ();
            }).toList(),
            aListOfString: (el['aListOfString'] as Iterable<Object?>).map((el) {
              return (el as String);
            }).toList(),
            aMapOfBool: (el['aMapOfBool'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as bool),
              );
            }),
            aMapOfDouble: (el['aMapOfDouble'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as double),
              );
            }),
            aMapOfEnum: (el['aMapOfEnum'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                _i2.MyEnum.values.byName((value as String)),
              );
            }),
            aMapOfInt: (el['aMapOfInt'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as int),
              );
            }),
            aMapOfNull: (el['aMapOfNull'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as Null),
              );
            }),
            aMapOfSimpleClass:
                (el['aMapOfSimpleClass'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              (value as Map<String, Object?>);
              return MapEntry(
                key,
                _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
              );
            }),
            aMapOfSimpleStruct:
                (el['aMapOfSimpleStruct'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              (value as Map<String, Object?>);
              return MapEntry(
                key,
                (),
              );
            }),
            aMapOfString: (el['aMapOfString'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as String),
              );
            }),
            aNull: (el['aNull'] as Null),
            aSimpleClass: _i2.SimpleClass.fromJson(
                (el['aSimpleClass'] as Map<String, dynamic>)),
            aSimpleStruct: (),
            aString: (el['aString'] as String),
            anEnum: _i2.MyEnum.values.byName((el['anEnum'] as String)),
            anInt: (el['anInt'] as int),
            anIterableOfBool:
                (el['anIterableOfBool'] as Iterable<Object?>).map((el) {
              return (el as bool);
            }).toList(),
            anIterableOfDouble:
                (el['anIterableOfDouble'] as Iterable<Object?>).map((el) {
              return (el as double);
            }).toList(),
            anIterableOfEnum:
                (el['anIterableOfEnum'] as Iterable<Object?>).map((el) {
              return _i2.MyEnum.values.byName((el as String));
            }).toList(),
            anIterableOfInt:
                (el['anIterableOfInt'] as Iterable<Object?>).map((el) {
              return (el as int);
            }).toList(),
            anIterableOfNull:
                (el['anIterableOfNull'] as Iterable<Object?>).map((el) {
              return (el as Null);
            }).toList(),
            anIterableOfSimpleClass:
                (el['anIterableOfSimpleClass'] as Iterable<Object?>).map((el) {
              (el as Map<String, Object?>);
              return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
            }).toList(),
            anIterableOfSimpleStruct:
                (el['anIterableOfSimpleStruct'] as Iterable<Object?>).map((el) {
              (el as Map<String, Object?>);
              return ();
            }).toList(),
            anIterableOfString:
                (el['anIterableOfString'] as Iterable<Object?>).map((el) {
              return (el as String);
            }).toList()
          );
        }).toList(),
        (request[r'aListOfSimpleClass'] as Iterable<Object?>).map((el) {
          (el as Map<String, Object?>);
          return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
        }).toList(),
        (request[r'aListOfComplexClass'] as Iterable<Object?>).map((el) {
          (el as Map<String, Object?>);
          return _i2.ComplexClass.fromJson((el as Map<String, dynamic>));
        }).toList(),
        request[r'aNullableListOfSimpleStruct'] == null
            ? null
            : (request[r'aNullableListOfSimpleStruct'] as Iterable<Object?>)
                .map((el) {
                (el as Map<String, Object?>);
                return ();
              }).toList(),
        request[r'aNullableListOfComplexStruct'] == null
            ? null
            : (request[r'aNullableListOfComplexStruct'] as Iterable<Object?>)
                .map((el) {
                (el as Map<String, Object?>);
                return (
                  aBool: (el['aBool'] as bool),
                  aDouble: (el['aDouble'] as double),
                  aListOfBool:
                      (el['aListOfBool'] as Iterable<Object?>).map((el) {
                    return (el as bool);
                  }).toList(),
                  aListOfDouble:
                      (el['aListOfDouble'] as Iterable<Object?>).map((el) {
                    return (el as double);
                  }).toList(),
                  aListOfEnum:
                      (el['aListOfEnum'] as Iterable<Object?>).map((el) {
                    return _i2.MyEnum.values.byName((el as String));
                  }).toList(),
                  aListOfInt: (el['aListOfInt'] as Iterable<Object?>).map((el) {
                    return (el as int);
                  }).toList(),
                  aListOfNull:
                      (el['aListOfNull'] as Iterable<Object?>).map((el) {
                    return (el as Null);
                  }).toList(),
                  aListOfSimpleClass:
                      (el['aListOfSimpleClass'] as Iterable<Object?>).map((el) {
                    (el as Map<String, Object?>);
                    return _i2.SimpleClass.fromJson(
                        (el as Map<String, dynamic>));
                  }).toList(),
                  aListOfSimpleStruct:
                      (el['aListOfSimpleStruct'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return ();
                  }).toList(),
                  aListOfString:
                      (el['aListOfString'] as Iterable<Object?>).map((el) {
                    return (el as String);
                  }).toList(),
                  aMapOfBool: (el['aMapOfBool'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as bool),
                    );
                  }),
                  aMapOfDouble:
                      (el['aMapOfDouble'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as double),
                    );
                  }),
                  aMapOfEnum: (el['aMapOfEnum'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      _i2.MyEnum.values.byName((value as String)),
                    );
                  }),
                  aMapOfInt: (el['aMapOfInt'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as int),
                    );
                  }),
                  aMapOfNull: (el['aMapOfNull'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as Null),
                    );
                  }),
                  aMapOfSimpleClass:
                      (el['aMapOfSimpleClass'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    (value as Map<String, Object?>);
                    return MapEntry(
                      key,
                      _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
                    );
                  }),
                  aMapOfSimpleStruct:
                      (el['aMapOfSimpleStruct'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    (value as Map<String, Object?>);
                    return MapEntry(
                      key,
                      (),
                    );
                  }),
                  aMapOfString:
                      (el['aMapOfString'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as String),
                    );
                  }),
                  aNull: (el['aNull'] as Null),
                  aSimpleClass: _i2.SimpleClass.fromJson(
                      (el['aSimpleClass'] as Map<String, dynamic>)),
                  aSimpleStruct: (),
                  aString: (el['aString'] as String),
                  anEnum: _i2.MyEnum.values.byName((el['anEnum'] as String)),
                  anInt: (el['anInt'] as int),
                  anIterableOfBool:
                      (el['anIterableOfBool'] as Iterable<Object?>).map((el) {
                    return (el as bool);
                  }).toList(),
                  anIterableOfDouble:
                      (el['anIterableOfDouble'] as Iterable<Object?>).map((el) {
                    return (el as double);
                  }).toList(),
                  anIterableOfEnum:
                      (el['anIterableOfEnum'] as Iterable<Object?>).map((el) {
                    return _i2.MyEnum.values.byName((el as String));
                  }).toList(),
                  anIterableOfInt:
                      (el['anIterableOfInt'] as Iterable<Object?>).map((el) {
                    return (el as int);
                  }).toList(),
                  anIterableOfNull:
                      (el['anIterableOfNull'] as Iterable<Object?>).map((el) {
                    return (el as Null);
                  }).toList(),
                  anIterableOfSimpleClass:
                      (el['anIterableOfSimpleClass'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return _i2.SimpleClass.fromJson(
                        (el as Map<String, dynamic>));
                  }).toList(),
                  anIterableOfSimpleStruct:
                      (el['anIterableOfSimpleStruct'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return ();
                  }).toList(),
                  anIterableOfString:
                      (el['anIterableOfString'] as Iterable<Object?>).map((el) {
                    return (el as String);
                  }).toList()
                );
              }).toList(),
        request[r'aNullableListOfSimpleClass'] == null
            ? null
            : (request[r'aNullableListOfSimpleClass'] as Iterable<Object?>)
                .map((el) {
                (el as Map<String, Object?>);
                return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
              }).toList(),
        request[r'aNullableListOfComplexClass'] == null
            ? null
            : (request[r'aNullableListOfComplexClass'] as Iterable<Object?>)
                .map((el) {
                (el as Map<String, Object?>);
                return _i2.ComplexClass.fromJson((el as Map<String, dynamic>));
              }).toList(),
        (request[r'aListOfNullableSimpleStruct'] as Iterable<Object?>)
            .map((el) {
          (el as Map<String, Object?>?);
          return el == null ? null : ();
        }).toList(),
        (request[r'aListOfNullableComplexStruct'] as Iterable<Object?>)
            .map((el) {
          (el as Map<String, Object?>?);
          return el == null
              ? null
              : (
                  aBool: (el['aBool'] as bool),
                  aDouble: (el['aDouble'] as double),
                  aListOfBool:
                      (el['aListOfBool'] as Iterable<Object?>).map((el) {
                    return (el as bool);
                  }).toList(),
                  aListOfDouble:
                      (el['aListOfDouble'] as Iterable<Object?>).map((el) {
                    return (el as double);
                  }).toList(),
                  aListOfEnum:
                      (el['aListOfEnum'] as Iterable<Object?>).map((el) {
                    return _i2.MyEnum.values.byName((el as String));
                  }).toList(),
                  aListOfInt: (el['aListOfInt'] as Iterable<Object?>).map((el) {
                    return (el as int);
                  }).toList(),
                  aListOfNull:
                      (el['aListOfNull'] as Iterable<Object?>).map((el) {
                    return (el as Null);
                  }).toList(),
                  aListOfSimpleClass:
                      (el['aListOfSimpleClass'] as Iterable<Object?>).map((el) {
                    (el as Map<String, Object?>);
                    return _i2.SimpleClass.fromJson(
                        (el as Map<String, dynamic>));
                  }).toList(),
                  aListOfSimpleStruct:
                      (el['aListOfSimpleStruct'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return ();
                  }).toList(),
                  aListOfString:
                      (el['aListOfString'] as Iterable<Object?>).map((el) {
                    return (el as String);
                  }).toList(),
                  aMapOfBool: (el['aMapOfBool'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as bool),
                    );
                  }),
                  aMapOfDouble:
                      (el['aMapOfDouble'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as double),
                    );
                  }),
                  aMapOfEnum: (el['aMapOfEnum'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      _i2.MyEnum.values.byName((value as String)),
                    );
                  }),
                  aMapOfInt: (el['aMapOfInt'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as int),
                    );
                  }),
                  aMapOfNull: (el['aMapOfNull'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as Null),
                    );
                  }),
                  aMapOfSimpleClass:
                      (el['aMapOfSimpleClass'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    (value as Map<String, Object?>);
                    return MapEntry(
                      key,
                      _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
                    );
                  }),
                  aMapOfSimpleStruct:
                      (el['aMapOfSimpleStruct'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    (value as Map<String, Object?>);
                    return MapEntry(
                      key,
                      (),
                    );
                  }),
                  aMapOfString:
                      (el['aMapOfString'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as String),
                    );
                  }),
                  aNull: (el['aNull'] as Null),
                  aSimpleClass: _i2.SimpleClass.fromJson(
                      (el['aSimpleClass'] as Map<String, dynamic>)),
                  aSimpleStruct: (),
                  aString: (el['aString'] as String),
                  anEnum: _i2.MyEnum.values.byName((el['anEnum'] as String)),
                  anInt: (el['anInt'] as int),
                  anIterableOfBool:
                      (el['anIterableOfBool'] as Iterable<Object?>).map((el) {
                    return (el as bool);
                  }).toList(),
                  anIterableOfDouble:
                      (el['anIterableOfDouble'] as Iterable<Object?>).map((el) {
                    return (el as double);
                  }).toList(),
                  anIterableOfEnum:
                      (el['anIterableOfEnum'] as Iterable<Object?>).map((el) {
                    return _i2.MyEnum.values.byName((el as String));
                  }).toList(),
                  anIterableOfInt:
                      (el['anIterableOfInt'] as Iterable<Object?>).map((el) {
                    return (el as int);
                  }).toList(),
                  anIterableOfNull:
                      (el['anIterableOfNull'] as Iterable<Object?>).map((el) {
                    return (el as Null);
                  }).toList(),
                  anIterableOfSimpleClass:
                      (el['anIterableOfSimpleClass'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return _i2.SimpleClass.fromJson(
                        (el as Map<String, dynamic>));
                  }).toList(),
                  anIterableOfSimpleStruct:
                      (el['anIterableOfSimpleStruct'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return ();
                  }).toList(),
                  anIterableOfString:
                      (el['anIterableOfString'] as Iterable<Object?>).map((el) {
                    return (el as String);
                  }).toList()
                );
        }).toList(),
        (request[r'aListOfNullableSimpleClass'] as Iterable<Object?>).map((el) {
          (el as Map<String, Object?>?);
          return el == null
              ? null
              : _i2.SimpleClass?.fromJson((el as Map<String, dynamic>));
        }).toList(),
        (request[r'aListOfNullableComplexClass'] as Iterable<Object?>)
            .map((el) {
          (el as Map<String, Object?>?);
          return el == null
              ? null
              : _i2.ComplexClass?.fromJson((el as Map<String, dynamic>));
        }).toList(),
        (request[r'aMapOfSimpleStruct'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>);
          return MapEntry(
            key,
            (),
          );
        }),
        (request[r'aMapOfComplexStruct'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>);
          return MapEntry(
            key,
            (
              aBool: (value['aBool'] as bool),
              aDouble: (value['aDouble'] as double),
              aListOfBool:
                  (value['aListOfBool'] as Iterable<Object?>).map((el) {
                return (el as bool);
              }).toList(),
              aListOfDouble:
                  (value['aListOfDouble'] as Iterable<Object?>).map((el) {
                return (el as double);
              }).toList(),
              aListOfEnum:
                  (value['aListOfEnum'] as Iterable<Object?>).map((el) {
                return _i2.MyEnum.values.byName((el as String));
              }).toList(),
              aListOfInt: (value['aListOfInt'] as Iterable<Object?>).map((el) {
                return (el as int);
              }).toList(),
              aListOfNull:
                  (value['aListOfNull'] as Iterable<Object?>).map((el) {
                return (el as Null);
              }).toList(),
              aListOfSimpleClass:
                  (value['aListOfSimpleClass'] as Iterable<Object?>).map((el) {
                (el as Map<String, Object?>);
                return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
              }).toList(),
              aListOfSimpleStruct:
                  (value['aListOfSimpleStruct'] as Iterable<Object?>).map((el) {
                (el as Map<String, Object?>);
                return ();
              }).toList(),
              aListOfString:
                  (value['aListOfString'] as Iterable<Object?>).map((el) {
                return (el as String);
              }).toList(),
              aMapOfBool: (value['aMapOfBool'] as Map<String, Object?>).map((
                key,
                value,
              ) {
                return MapEntry(
                  key,
                  (value as bool),
                );
              }),
              aMapOfDouble:
                  (value['aMapOfDouble'] as Map<String, Object?>).map((
                key,
                value,
              ) {
                return MapEntry(
                  key,
                  (value as double),
                );
              }),
              aMapOfEnum: (value['aMapOfEnum'] as Map<String, Object?>).map((
                key,
                value,
              ) {
                return MapEntry(
                  key,
                  _i2.MyEnum.values.byName((value as String)),
                );
              }),
              aMapOfInt: (value['aMapOfInt'] as Map<String, Object?>).map((
                key,
                value,
              ) {
                return MapEntry(
                  key,
                  (value as int),
                );
              }),
              aMapOfNull: (value['aMapOfNull'] as Map<String, Object?>).map((
                key,
                value,
              ) {
                return MapEntry(
                  key,
                  (value as Null),
                );
              }),
              aMapOfSimpleClass:
                  (value['aMapOfSimpleClass'] as Map<String, Object?>).map((
                key,
                value,
              ) {
                (value as Map<String, Object?>);
                return MapEntry(
                  key,
                  _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
                );
              }),
              aMapOfSimpleStruct:
                  (value['aMapOfSimpleStruct'] as Map<String, Object?>).map((
                key,
                value,
              ) {
                (value as Map<String, Object?>);
                return MapEntry(
                  key,
                  (),
                );
              }),
              aMapOfString:
                  (value['aMapOfString'] as Map<String, Object?>).map((
                key,
                value,
              ) {
                return MapEntry(
                  key,
                  (value as String),
                );
              }),
              aNull: (value['aNull'] as Null),
              aSimpleClass: _i2.SimpleClass.fromJson(
                  (value['aSimpleClass'] as Map<String, dynamic>)),
              aSimpleStruct: (),
              aString: (value['aString'] as String),
              anEnum: _i2.MyEnum.values.byName((value['anEnum'] as String)),
              anInt: (value['anInt'] as int),
              anIterableOfBool:
                  (value['anIterableOfBool'] as Iterable<Object?>).map((el) {
                return (el as bool);
              }).toList(),
              anIterableOfDouble:
                  (value['anIterableOfDouble'] as Iterable<Object?>).map((el) {
                return (el as double);
              }).toList(),
              anIterableOfEnum:
                  (value['anIterableOfEnum'] as Iterable<Object?>).map((el) {
                return _i2.MyEnum.values.byName((el as String));
              }).toList(),
              anIterableOfInt:
                  (value['anIterableOfInt'] as Iterable<Object?>).map((el) {
                return (el as int);
              }).toList(),
              anIterableOfNull:
                  (value['anIterableOfNull'] as Iterable<Object?>).map((el) {
                return (el as Null);
              }).toList(),
              anIterableOfSimpleClass:
                  (value['anIterableOfSimpleClass'] as Iterable<Object?>)
                      .map((el) {
                (el as Map<String, Object?>);
                return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
              }).toList(),
              anIterableOfSimpleStruct:
                  (value['anIterableOfSimpleStruct'] as Iterable<Object?>)
                      .map((el) {
                (el as Map<String, Object?>);
                return ();
              }).toList(),
              anIterableOfString:
                  (value['anIterableOfString'] as Iterable<Object?>).map((el) {
                return (el as String);
              }).toList()
            ),
          );
        }),
        (request[r'aMapOfSimpleClass'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>);
          return MapEntry(
            key,
            _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
          );
        }),
        (request[r'aMapOfComplexClass'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>);
          return MapEntry(
            key,
            _i2.ComplexClass.fromJson((value as Map<String, dynamic>)),
          );
        }),
        request[r'aNullableMapOfSimpleStruct'] == null
            ? null
            : (request[r'aNullableMapOfSimpleStruct'] as Map<String, Object?>)
                .map((
                key,
                value,
              ) {
                (value as Map<String, Object?>);
                return MapEntry(
                  key,
                  (),
                );
              }),
        request[r'aNullableMapOfComplexStruct'] == null
            ? null
            : (request[r'aNullableMapOfComplexStruct'] as Map<String, Object?>)
                .map((
                key,
                value,
              ) {
                (value as Map<String, Object?>);
                return MapEntry(
                  key,
                  (
                    aBool: (value['aBool'] as bool),
                    aDouble: (value['aDouble'] as double),
                    aListOfBool:
                        (value['aListOfBool'] as Iterable<Object?>).map((el) {
                      return (el as bool);
                    }).toList(),
                    aListOfDouble:
                        (value['aListOfDouble'] as Iterable<Object?>).map((el) {
                      return (el as double);
                    }).toList(),
                    aListOfEnum:
                        (value['aListOfEnum'] as Iterable<Object?>).map((el) {
                      return _i2.MyEnum.values.byName((el as String));
                    }).toList(),
                    aListOfInt:
                        (value['aListOfInt'] as Iterable<Object?>).map((el) {
                      return (el as int);
                    }).toList(),
                    aListOfNull:
                        (value['aListOfNull'] as Iterable<Object?>).map((el) {
                      return (el as Null);
                    }).toList(),
                    aListOfSimpleClass:
                        (value['aListOfSimpleClass'] as Iterable<Object?>)
                            .map((el) {
                      (el as Map<String, Object?>);
                      return _i2.SimpleClass.fromJson(
                          (el as Map<String, dynamic>));
                    }).toList(),
                    aListOfSimpleStruct:
                        (value['aListOfSimpleStruct'] as Iterable<Object?>)
                            .map((el) {
                      (el as Map<String, Object?>);
                      return ();
                    }).toList(),
                    aListOfString:
                        (value['aListOfString'] as Iterable<Object?>).map((el) {
                      return (el as String);
                    }).toList(),
                    aMapOfBool:
                        (value['aMapOfBool'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as bool),
                      );
                    }),
                    aMapOfDouble:
                        (value['aMapOfDouble'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as double),
                      );
                    }),
                    aMapOfEnum:
                        (value['aMapOfEnum'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        _i2.MyEnum.values.byName((value as String)),
                      );
                    }),
                    aMapOfInt:
                        (value['aMapOfInt'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as int),
                      );
                    }),
                    aMapOfNull:
                        (value['aMapOfNull'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as Null),
                      );
                    }),
                    aMapOfSimpleClass:
                        (value['aMapOfSimpleClass'] as Map<String, Object?>)
                            .map((
                      key,
                      value,
                    ) {
                      (value as Map<String, Object?>);
                      return MapEntry(
                        key,
                        _i2.SimpleClass.fromJson(
                            (value as Map<String, dynamic>)),
                      );
                    }),
                    aMapOfSimpleStruct:
                        (value['aMapOfSimpleStruct'] as Map<String, Object?>)
                            .map((
                      key,
                      value,
                    ) {
                      (value as Map<String, Object?>);
                      return MapEntry(
                        key,
                        (),
                      );
                    }),
                    aMapOfString:
                        (value['aMapOfString'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as String),
                      );
                    }),
                    aNull: (value['aNull'] as Null),
                    aSimpleClass: _i2.SimpleClass.fromJson(
                        (value['aSimpleClass'] as Map<String, dynamic>)),
                    aSimpleStruct: (),
                    aString: (value['aString'] as String),
                    anEnum:
                        _i2.MyEnum.values.byName((value['anEnum'] as String)),
                    anInt: (value['anInt'] as int),
                    anIterableOfBool:
                        (value['anIterableOfBool'] as Iterable<Object?>)
                            .map((el) {
                      return (el as bool);
                    }).toList(),
                    anIterableOfDouble:
                        (value['anIterableOfDouble'] as Iterable<Object?>)
                            .map((el) {
                      return (el as double);
                    }).toList(),
                    anIterableOfEnum:
                        (value['anIterableOfEnum'] as Iterable<Object?>)
                            .map((el) {
                      return _i2.MyEnum.values.byName((el as String));
                    }).toList(),
                    anIterableOfInt:
                        (value['anIterableOfInt'] as Iterable<Object?>)
                            .map((el) {
                      return (el as int);
                    }).toList(),
                    anIterableOfNull:
                        (value['anIterableOfNull'] as Iterable<Object?>)
                            .map((el) {
                      return (el as Null);
                    }).toList(),
                    anIterableOfSimpleClass:
                        (value['anIterableOfSimpleClass'] as Iterable<Object?>)
                            .map((el) {
                      (el as Map<String, Object?>);
                      return _i2.SimpleClass.fromJson(
                          (el as Map<String, dynamic>));
                    }).toList(),
                    anIterableOfSimpleStruct:
                        (value['anIterableOfSimpleStruct'] as Iterable<Object?>)
                            .map((el) {
                      (el as Map<String, Object?>);
                      return ();
                    }).toList(),
                    anIterableOfString:
                        (value['anIterableOfString'] as Iterable<Object?>)
                            .map((el) {
                      return (el as String);
                    }).toList()
                  ),
                );
              }),
        request[r'aNullableMapOfSimpleClass'] == null
            ? null
            : (request[r'aNullableMapOfSimpleClass'] as Map<String, Object?>)
                .map((
                key,
                value,
              ) {
                (value as Map<String, Object?>);
                return MapEntry(
                  key,
                  _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
                );
              }),
        request[r'aNullableMapOfComplexClass'] == null
            ? null
            : (request[r'aNullableMapOfComplexClass'] as Map<String, Object?>)
                .map((
                key,
                value,
              ) {
                (value as Map<String, Object?>);
                return MapEntry(
                  key,
                  _i2.ComplexClass.fromJson((value as Map<String, dynamic>)),
                );
              }),
        (request[r'aMapOfNullableSimpleStruct'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>?);
          return MapEntry(
            key,
            value == null ? null : (),
          );
        }),
        (request[r'aMapOfNullableComplexStruct'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>?);
          return MapEntry(
            key,
            value == null
                ? null
                : (
                    aBool: (value['aBool'] as bool),
                    aDouble: (value['aDouble'] as double),
                    aListOfBool:
                        (value['aListOfBool'] as Iterable<Object?>).map((el) {
                      return (el as bool);
                    }).toList(),
                    aListOfDouble:
                        (value['aListOfDouble'] as Iterable<Object?>).map((el) {
                      return (el as double);
                    }).toList(),
                    aListOfEnum:
                        (value['aListOfEnum'] as Iterable<Object?>).map((el) {
                      return _i2.MyEnum.values.byName((el as String));
                    }).toList(),
                    aListOfInt:
                        (value['aListOfInt'] as Iterable<Object?>).map((el) {
                      return (el as int);
                    }).toList(),
                    aListOfNull:
                        (value['aListOfNull'] as Iterable<Object?>).map((el) {
                      return (el as Null);
                    }).toList(),
                    aListOfSimpleClass:
                        (value['aListOfSimpleClass'] as Iterable<Object?>)
                            .map((el) {
                      (el as Map<String, Object?>);
                      return _i2.SimpleClass.fromJson(
                          (el as Map<String, dynamic>));
                    }).toList(),
                    aListOfSimpleStruct:
                        (value['aListOfSimpleStruct'] as Iterable<Object?>)
                            .map((el) {
                      (el as Map<String, Object?>);
                      return ();
                    }).toList(),
                    aListOfString:
                        (value['aListOfString'] as Iterable<Object?>).map((el) {
                      return (el as String);
                    }).toList(),
                    aMapOfBool:
                        (value['aMapOfBool'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as bool),
                      );
                    }),
                    aMapOfDouble:
                        (value['aMapOfDouble'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as double),
                      );
                    }),
                    aMapOfEnum:
                        (value['aMapOfEnum'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        _i2.MyEnum.values.byName((value as String)),
                      );
                    }),
                    aMapOfInt:
                        (value['aMapOfInt'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as int),
                      );
                    }),
                    aMapOfNull:
                        (value['aMapOfNull'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as Null),
                      );
                    }),
                    aMapOfSimpleClass:
                        (value['aMapOfSimpleClass'] as Map<String, Object?>)
                            .map((
                      key,
                      value,
                    ) {
                      (value as Map<String, Object?>);
                      return MapEntry(
                        key,
                        _i2.SimpleClass.fromJson(
                            (value as Map<String, dynamic>)),
                      );
                    }),
                    aMapOfSimpleStruct:
                        (value['aMapOfSimpleStruct'] as Map<String, Object?>)
                            .map((
                      key,
                      value,
                    ) {
                      (value as Map<String, Object?>);
                      return MapEntry(
                        key,
                        (),
                      );
                    }),
                    aMapOfString:
                        (value['aMapOfString'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as String),
                      );
                    }),
                    aNull: (value['aNull'] as Null),
                    aSimpleClass: _i2.SimpleClass.fromJson(
                        (value['aSimpleClass'] as Map<String, dynamic>)),
                    aSimpleStruct: (),
                    aString: (value['aString'] as String),
                    anEnum:
                        _i2.MyEnum.values.byName((value['anEnum'] as String)),
                    anInt: (value['anInt'] as int),
                    anIterableOfBool:
                        (value['anIterableOfBool'] as Iterable<Object?>)
                            .map((el) {
                      return (el as bool);
                    }).toList(),
                    anIterableOfDouble:
                        (value['anIterableOfDouble'] as Iterable<Object?>)
                            .map((el) {
                      return (el as double);
                    }).toList(),
                    anIterableOfEnum:
                        (value['anIterableOfEnum'] as Iterable<Object?>)
                            .map((el) {
                      return _i2.MyEnum.values.byName((el as String));
                    }).toList(),
                    anIterableOfInt:
                        (value['anIterableOfInt'] as Iterable<Object?>)
                            .map((el) {
                      return (el as int);
                    }).toList(),
                    anIterableOfNull:
                        (value['anIterableOfNull'] as Iterable<Object?>)
                            .map((el) {
                      return (el as Null);
                    }).toList(),
                    anIterableOfSimpleClass:
                        (value['anIterableOfSimpleClass'] as Iterable<Object?>)
                            .map((el) {
                      (el as Map<String, Object?>);
                      return _i2.SimpleClass.fromJson(
                          (el as Map<String, dynamic>));
                    }).toList(),
                    anIterableOfSimpleStruct:
                        (value['anIterableOfSimpleStruct'] as Iterable<Object?>)
                            .map((el) {
                      (el as Map<String, Object?>);
                      return ();
                    }).toList(),
                    anIterableOfString:
                        (value['anIterableOfString'] as Iterable<Object?>)
                            .map((el) {
                      return (el as String);
                    }).toList()
                  ),
          );
        }),
        (request[r'aMapOfNullableSimpleClass'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>?);
          return MapEntry(
            key,
            value == null
                ? null
                : _i2.SimpleClass?.fromJson((value as Map<String, dynamic>)),
          );
        }),
        (request[r'aMapOfNullableComplexClass'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>?);
          return MapEntry(
            key,
            value == null
                ? null
                : _i2.ComplexClass?.fromJson((value as Map<String, dynamic>)),
          );
        }),
        request[r'aNullableMapOfNullableSimpleStruct'] == null
            ? null
            : (request[r'aNullableMapOfNullableSimpleStruct']
                    as Map<String, Object?>)
                .map((
                key,
                value,
              ) {
                (value as Map<String, Object?>?);
                return MapEntry(
                  key,
                  value == null ? null : (),
                );
              }),
        request[r'aNullableMapOfNullableComplexStruct'] == null
            ? null
            : (request[r'aNullableMapOfNullableComplexStruct']
                    as Map<String, Object?>)
                .map((
                key,
                value,
              ) {
                (value as Map<String, Object?>?);
                return MapEntry(
                  key,
                  value == null
                      ? null
                      : (
                          aBool: (value['aBool'] as bool),
                          aDouble: (value['aDouble'] as double),
                          aListOfBool:
                              (value['aListOfBool'] as Iterable<Object?>)
                                  .map((el) {
                            return (el as bool);
                          }).toList(),
                          aListOfDouble:
                              (value['aListOfDouble'] as Iterable<Object?>)
                                  .map((el) {
                            return (el as double);
                          }).toList(),
                          aListOfEnum:
                              (value['aListOfEnum'] as Iterable<Object?>)
                                  .map((el) {
                            return _i2.MyEnum.values.byName((el as String));
                          }).toList(),
                          aListOfInt: (value['aListOfInt'] as Iterable<Object?>)
                              .map((el) {
                            return (el as int);
                          }).toList(),
                          aListOfNull:
                              (value['aListOfNull'] as Iterable<Object?>)
                                  .map((el) {
                            return (el as Null);
                          }).toList(),
                          aListOfSimpleClass:
                              (value['aListOfSimpleClass'] as Iterable<Object?>)
                                  .map((el) {
                            (el as Map<String, Object?>);
                            return _i2.SimpleClass.fromJson(
                                (el as Map<String, dynamic>));
                          }).toList(),
                          aListOfSimpleStruct: (value['aListOfSimpleStruct']
                                  as Iterable<Object?>)
                              .map((el) {
                            (el as Map<String, Object?>);
                            return ();
                          }).toList(),
                          aListOfString:
                              (value['aListOfString'] as Iterable<Object?>)
                                  .map((el) {
                            return (el as String);
                          }).toList(),
                          aMapOfBool:
                              (value['aMapOfBool'] as Map<String, Object?>)
                                  .map((
                            key,
                            value,
                          ) {
                            return MapEntry(
                              key,
                              (value as bool),
                            );
                          }),
                          aMapOfDouble:
                              (value['aMapOfDouble'] as Map<String, Object?>)
                                  .map((
                            key,
                            value,
                          ) {
                            return MapEntry(
                              key,
                              (value as double),
                            );
                          }),
                          aMapOfEnum:
                              (value['aMapOfEnum'] as Map<String, Object?>)
                                  .map((
                            key,
                            value,
                          ) {
                            return MapEntry(
                              key,
                              _i2.MyEnum.values.byName((value as String)),
                            );
                          }),
                          aMapOfInt:
                              (value['aMapOfInt'] as Map<String, Object?>).map((
                            key,
                            value,
                          ) {
                            return MapEntry(
                              key,
                              (value as int),
                            );
                          }),
                          aMapOfNull:
                              (value['aMapOfNull'] as Map<String, Object?>)
                                  .map((
                            key,
                            value,
                          ) {
                            return MapEntry(
                              key,
                              (value as Null),
                            );
                          }),
                          aMapOfSimpleClass: (value['aMapOfSimpleClass']
                                  as Map<String, Object?>)
                              .map((
                            key,
                            value,
                          ) {
                            (value as Map<String, Object?>);
                            return MapEntry(
                              key,
                              _i2.SimpleClass.fromJson(
                                  (value as Map<String, dynamic>)),
                            );
                          }),
                          aMapOfSimpleStruct: (value['aMapOfSimpleStruct']
                                  as Map<String, Object?>)
                              .map((
                            key,
                            value,
                          ) {
                            (value as Map<String, Object?>);
                            return MapEntry(
                              key,
                              (),
                            );
                          }),
                          aMapOfString:
                              (value['aMapOfString'] as Map<String, Object?>)
                                  .map((
                            key,
                            value,
                          ) {
                            return MapEntry(
                              key,
                              (value as String),
                            );
                          }),
                          aNull: (value['aNull'] as Null),
                          aSimpleClass: _i2.SimpleClass.fromJson(
                              (value['aSimpleClass'] as Map<String, dynamic>)),
                          aSimpleStruct: (),
                          aString: (value['aString'] as String),
                          anEnum: _i2.MyEnum.values
                              .byName((value['anEnum'] as String)),
                          anInt: (value['anInt'] as int),
                          anIterableOfBool:
                              (value['anIterableOfBool'] as Iterable<Object?>)
                                  .map((el) {
                            return (el as bool);
                          }).toList(),
                          anIterableOfDouble:
                              (value['anIterableOfDouble'] as Iterable<Object?>)
                                  .map((el) {
                            return (el as double);
                          }).toList(),
                          anIterableOfEnum:
                              (value['anIterableOfEnum'] as Iterable<Object?>)
                                  .map((el) {
                            return _i2.MyEnum.values.byName((el as String));
                          }).toList(),
                          anIterableOfInt:
                              (value['anIterableOfInt'] as Iterable<Object?>)
                                  .map((el) {
                            return (el as int);
                          }).toList(),
                          anIterableOfNull:
                              (value['anIterableOfNull'] as Iterable<Object?>)
                                  .map((el) {
                            return (el as Null);
                          }).toList(),
                          anIterableOfSimpleClass:
                              (value['anIterableOfSimpleClass']
                                      as Iterable<Object?>)
                                  .map((el) {
                            (el as Map<String, Object?>);
                            return _i2.SimpleClass.fromJson(
                                (el as Map<String, dynamic>));
                          }).toList(),
                          anIterableOfSimpleStruct:
                              (value['anIterableOfSimpleStruct']
                                      as Iterable<Object?>)
                                  .map((el) {
                            (el as Map<String, Object?>);
                            return ();
                          }).toList(),
                          anIterableOfString:
                              (value['anIterableOfString'] as Iterable<Object?>)
                                  .map((el) {
                            return (el as String);
                          }).toList()
                        ),
                );
              }),
        request[r'aNullableMapOfNullableSimpleClass'] == null
            ? null
            : (request[r'aNullableMapOfNullableSimpleClass']
                    as Map<String, Object?>)
                .map((
                key,
                value,
              ) {
                (value as Map<String, Object?>?);
                return MapEntry(
                  key,
                  value == null
                      ? null
                      : _i2.SimpleClass?.fromJson(
                          (value as Map<String, dynamic>)),
                );
              }),
        request[r'aNullableMapOfNullableComplexClass'] == null
            ? null
            : (request[r'aNullableMapOfNullableComplexClass']
                    as Map<String, Object?>)
                .map((
                key,
                value,
              ) {
                (value as Map<String, Object?>?);
                return MapEntry(
                  key,
                  value == null
                      ? null
                      : _i2.ComplexClass?.fromJson(
                          (value as Map<String, dynamic>)),
                );
              }),
      );
    },
    (json) => json as Map<String, dynamic>,
  );

  @override
  _i3.FutureOr<_i4.Response> handler(_i4.Request request) {
    final handler = _i4.Pipeline().addHandler(_inner.handler);
    return handler(request);
  }
}

_i3.Future<void> main(List<String> args) async {
  await _i1.serve(
    args,
    (_) => ComplexTarget(),
  );
}
