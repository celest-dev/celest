import 'package:cedar/cedar.dart';
import 'package:celest_cloud_auth/src/model/cookie.dart';
import 'package:celest_cloud_auth/src/util/random_bytes.dart';
import 'package:corks_cedar/corks_cedar.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.message}');
    if (record.error case final error?) {
      print(error);
    }
    if (record.stackTrace case final stackTrace?) {
      print(stackTrace);
    }
  });

  group('parseCookies', () {
    for (final testCase in _testCases) {
      test(testCase.header, () {
        final actual = parseCookies({'cookie': testCase.header});
        expect(actual, equals(testCase.expected));
      });
    }

    test('parses cork', () async {
      final cork =
          (CedarCork.builder()
                ..issuer = EntityUid.of('Celest::Service', 'test')
                ..bearer = EntityUid.of('Celest::User', 'user'))
              .build();

      final signer = Signer(cork.id, secureRandomBytes(16));
      final signed = await cork.sign(signer);

      final cookies = parseCookies({
        'cookie': ['cork=$signed'],
      });
      expect(cookies['cork'], '$signed');
    });
  });
}

typedef _TestCase = ({List<String> header, Map<String, String> expected});

const _testCases = <_TestCase>[
  (
    header: [r'Cookie-1=v$1', 'c2=v2'],
    expected: {'Cookie-1': r'v$1', 'c2': 'v2'},
  ),
  (
    header: [r'Cookie-1=v$1; c2=v2'],
    expected: {'Cookie-1': r'v$1', 'c2': 'v2'},
  ),
  (
    header: [r'Cookie-1="v$1"; c2="v2"'],
    expected: {'Cookie-1': r'v$1', 'c2': 'v2'},
  ),
  (
    header: [r'Cookie-1="v$1"; c2=v2;'],
    expected: {'Cookie-1': r'v$1', 'c2': 'v2'},
  ),
  (header: [''], expected: {}),
];
