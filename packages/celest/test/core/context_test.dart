import 'dart:async';

import 'package:celest/src/core/context.dart';
import 'package:test/test.dart';

FutureOr<T> _withRootContext<T>(
  ContextKey<String> key,
  FutureOr<T> Function(Context root) body,
) {
  return Context.withCurrentZoneAsRoot<T>(
    overrides: _override<String>(key, 'value'),
    body: body,
  );
}

ContextOverrides _override<V extends Object?>(ContextKey<V> key, V? value) {
  return <ContextKey<Object?>, Object?>{key as ContextKey<Object?>: value};
}

void main() {
  const key = ContextKey<String>('key');

  group('ZoneContext', () {
    test('global', () async {
      await _withRootContext(key, (Context root) {
        expect(Context.current, same(root));
        expect(root.containsLocal(key), isTrue);
        expect(root.get(key), 'value');
      });
    });

    test('get parent', () async {
      await _withRootContext(key, (Context root) {
        return root.bind(
          body: (Context child) {
            return child.bind(
              body: (Context grandChild) {
                expect(grandChild, isNot(same(child)));
                expect(grandChild, isNot(same(root)));
                expect(
                  grandChild.parent,
                  same(child),
                  reason: 'parent returns the closest active parent',
                );
              },
            );
          },
        );
      });
    });

    test('inherits from parent', () async {
      await _withRootContext(key, (Context root) {
        expect(
          Context.current,
          same(root),
          reason: 'Every Zone should have its own ZoneContext',
        );

        return root.bind(
          body: (Context child) {
            expect(Context.current, same(child));
            expect(child.parent, same(root));
            expect(root.parent, isNull);

            expect(child.containsLocal(key), isFalse);
            expect(
              child.get(key),
              'value',
              reason: 'child inherits value from parent',
            );

            return child.bind(
              overrides: _override<String>(key, 'new value'),
              body: (Context inner) {
                expect(
                  inner.get(key),
                  'new value',
                  reason: 'get returns the value in the current context',
                );
                expect(
                  root.get(key),
                  'value',
                  reason: 'parent context is not modified',
                );
              },
            );
          },
        );
      });
    });

    test('putIfAbsent shadows parent value', () async {
      await _withRootContext(key, (Context root) {
        var invocationCount = 0;

        FutureOr<Context> ensureValue(Context context) {
          if (context.containsLocal(key)) {
            return context;
          }
          invocationCount++;
          return context.bind(
            overrides: _override<String>(key, 'child default'),
            body: (Context override) => override,
          );
        }

        return root.bind(
          body: (Context child) async {
            final Context first = await ensureValue(child);
            expect(invocationCount, 1);
            expect(first.get(key), 'child default');
            expect(root.get(key), 'value');

            final Context second = await ensureValue(first);
            expect(invocationCount, 1);
            expect(second.get(key), 'child default');
          },
        );
      });
    });

    test('update shadows parent value', () async {
      await _withRootContext(key, (Context root) {
        return root.bind(
          body: (Context child) {
            return child.bind(
              overrides: _override<String>(key, '${child.get(key)!}_child'),
              body: (Context scoped) {
                expect(scoped.get(key), 'value_child');
                expect(root.get(key), 'value');
              },
            );
          },
        );
      });
    });

    test('setting null stores local override', () async {
      await _withRootContext(key, (Context root) {
        return root.bind(
          body: (Context child) {
            expect(child.get(key), 'value');

            return child.bind(
              overrides: _override<String>(key, null),
              body: (Context cleared) {
                expect(cleared.get(key), isNull);
                expect(root.get(key), 'value');

                return cleared.bind(
                  body: (Context grandChild) {
                    expect(grandChild.get(key), isNull);
                    final ContextOverrides overrides =
                        grandChild.snapshotLocal();
                    expect(overrides[key], isNull);
                    expect(root.get(key), 'value');
                  },
                );
              },
            );
          },
        );
      });
    });

    test('restores root state after synchronous error', () async {
      await _withRootContext(key, (Context root) {
        expect(root.get(key), 'value');

        expect(
          () => Context.withCurrentZoneAsRoot(
            overrides: _override<String>(key, 'temporary'),
            body: (Context temporaryRoot) {
              expect(temporaryRoot, same(root));
              expect(temporaryRoot.parent, isNull);
              expect(temporaryRoot.get(key), 'temporary');
              throw StateError('boom');
            },
          ),
          throwsStateError,
        );

        expect(Context.current, same(root));
        expect(root.get(key), 'value');
        expect(Context.current.get(key), 'value');
      });
    });

    test('cannot set values in root outside of root Zone', () async {
      await _withRootContext(key, (Context root) {
        expect(root.parent, isNull);
        expect(Context.root.isRoot, isTrue);
      });
    });
  });

  test('ZoneContextKey toString is independent of context state', () {
    expect(const ContextKey<int>().toString(), '<int>');
    expect(const ContextKey<int>('custom').toString(), 'custom');
  });
}
