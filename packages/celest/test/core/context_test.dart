import 'dart:async';

import 'package:celest/src/core/context.dart';
import 'package:test/test.dart';

void main() {
  const key = ContextKey<String>('key');
  Context.root = Context.current;
  Context.root.put(key, 'value');

  group('Context', () {
    test('global', () {
      expect(Context.current, same(context));
    });

    test('get parent', () {
      final Context root = Context.root;
      runZoned(() {
        runZoned(() {
          runZoned(() {
            expect(context, isNot(same(root)));
            expect(
              context.parent,
              same(root),
              reason: 'parent returns the closest active parent',
            );
          });
        });
      });
    });

    test('inherits from parent', () {
      final Context parent = Context.root;
      runZoned(() {
        expect(
          context,
          isNot(same(parent)),
          reason: 'Every Zone should have its own Context',
        );
        expect(Context.current, same(context));
        expect(context.parent, same(parent));
        expect(parent.parent, isNull);

        expect(
          context[key],
          isNull,
          reason: 'operator [] does not search parent values',
        );
        expect(context.get(key), 'value', reason: 'get searches parent values');

        context[key] = 'new value';
        expect(
          context[key],
          'new value',
          reason: 'operator []= sets the value in the current context',
        );
        expect(parent[key], 'value', reason: 'parent context is not modified');
        expect(
          context.get(key),
          'new value',
          reason: 'get returns the value in the current context',
        );

        expect(context.remove(key), isNotNull);
        expect(
          context[key],
          isNull,
          reason: 'remove removes the value from the current context',
        );
        expect(parent[key], 'value', reason: 'parent context is not modified');
        expect(
          context.get(key),
          'value',
          reason: 'get returns the value in the parent context',
        );
      });
    });

    test('cannot set values in root outside of root Zone', () {
      final Context root = Context.root;
      expect(
        () => root[key] = 'value',
        throwsA(
          isA<UnsupportedError>().having(
            (e) => e.message,
            'message',
            contains('root context'),
          ),
        ),
        reason: 'Tests run in a different Zone than the root context',
      );
    });
  });
}
