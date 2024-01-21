import 'package:test/test.dart';

import '../functions/classes.dart';
import '../goldens/client/client.dart';

void main() {
  group('Client', () {
    // late final Process celestProcess;

    setUpAll(() async {
      // celestProcess = await Process.start(
      //   Platform.resolvedExecutable,
      //   [Platform.script.resolve('../../../../bin/celest.dart').toFilePath()],
      //   workingDirectory: Platform.script.resolve('..').toFilePath(),
      // );
      celest.init();
    });

    group('apis', () {
      test('classes', () async {
        await expectLater(
          celest.functions.classes.empty(Empty()),
          completion(isA<Empty>()),
        );

        await expectLater(
          celest.functions.classes.asyncEmpty(Empty()),
          completion(isA<Empty>()),
        );

        await expectLater(
          celest.functions.classes.fields(
            Fields('superField', 'field'),
          ),
          completion(
            isA<Fields>()
                .having((f) => f.superField, 'superField', 'superField')
                .having((f) => f.field, 'field', 'field'),
          ),
        );

        await expectLater(
          celest.functions.classes.asyncFields(
            Fields('superField', 'field'),
          ),
          completion(
            isA<Fields>()
                .having((f) => f.superField, 'superField', 'superField')
                .having((f) => f.field, 'field', 'field'),
          ),
        );

        await expectLater(
          celest.functions.classes.nullableFields(
            Fields('superField', 'field'),
          ),
          completion(
            isA<Fields>()
                .having((f) => f.superField, 'superField', 'superField')
                .having((f) => f.field, 'field', 'field'),
          ),
        );
        await expectLater(
          celest.functions.classes.nullableFields(null),
          completion(isNull),
        );

        await expectLater(
          celest.functions.classes.asyncNullableFields(
            Fields('superField', 'field'),
          ),
          completion(
            isA<Fields>()
                .having((f) => f.superField, 'superField', 'superField')
                .having((f) => f.field, 'field', 'field'),
          ),
        );
        await expectLater(
          celest.functions.classes.asyncNullableFields(null),
          completion(isNull),
        );

        await expectLater(
          celest.functions.classes.namedFields(
            NamedFields(superField: 'superField', field: 'field'),
          ),
          completion(
            isA<NamedFields>()
                .having((f) => f.superField, 'superField', 'superField')
                .having((f) => f.field, 'field', 'field'),
          ),
        );
        await expectLater(
          celest.functions.classes.asyncNamedFields(
            NamedFields(superField: 'superField', field: 'field'),
          ),
          completion(
            isA<NamedFields>()
                .having((f) => f.superField, 'superField', 'superField')
                .having((f) => f.field, 'field', 'field'),
          ),
        );

        await expectLater(
          celest.functions.classes.mixedFields(
            MixedFields('superField', field: 'field'),
          ),
          completion(
            isA<MixedFields>()
                .having((f) => f.superField, 'superField', 'superField')
                .having((f) => f.field, 'field', 'field'),
          ),
        );
        await expectLater(
          celest.functions.classes.asyncMixedFields(
            MixedFields('superField', field: 'field'),
          ),
          completion(
            isA<MixedFields>()
                .having((f) => f.superField, 'superField', 'superField')
                .having((f) => f.field, 'field', 'field'),
          ),
        );

        await expectLater(
          celest.functions.classes.defaultValues(
            DefaultValues(),
          ),
          completion(
            isA<DefaultValues>()
                .having((f) => f.field, 'field', 'default')
                .having((f) => f.nullableField, 'nullableField', isNull)
                .having(
                  (f) => f.nullableFieldWithDefault,
                  'nullableFieldWithDefault',
                  'default',
                )
                .having(
                  (f) => f.fieldWithoutInitializer,
                  'fieldWithoutInitializer',
                  'default',
                ),
          ),
        );
        await expectLater(
          celest.functions.classes.asyncDefaultValues(
            DefaultValues(
              field: 'field',
              nullableField: 'nullableField',
              nullableFieldWithDefault: 'nullableFieldWithDefault',
            ),
          ),
          completion(
            isA<DefaultValues>()
                .having((f) => f.field, 'field', 'field')
                .having(
                  (f) => f.nullableField,
                  'nullableField',
                  'nullableField',
                )
                .having(
                  (f) => f.nullableFieldWithDefault,
                  'nullableFieldWithDefault',
                  'nullableFieldWithDefault',
                )
                .having(
                  (f) => f.fieldWithoutInitializer,
                  'fieldWithoutInitializer',
                  'default',
                ),
          ),
        );
      });
    });
  });
}
