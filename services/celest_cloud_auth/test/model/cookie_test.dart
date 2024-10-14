import 'package:celest_cloud_auth/src/model/cookie.dart';
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
        final actual = parseCookies({
          'cookie': testCase.header,
        });
        expect(actual, equals(testCase.expected));
      });
    }
  });
}

typedef _TestCase = ({
  List<String> header,
  Map<String, String> expected,
});

const _testCases = <_TestCase>[
  (
    header: [r'Cookie-1=v$1', 'c2=v2'],
    expected: {
      'Cookie-1': r'v$1',
      'c2': 'v2',
    },
  ),
  (
    header: [r'Cookie-1=v$1; c2=v2'],
    expected: {
      'Cookie-1': r'v$1',
      'c2': 'v2',
    },
  ),
  (
    header: [r'Cookie-1="v$1"; c2="v2"'],
    expected: {
      'Cookie-1': r'v$1',
      'c2': 'v2',
    },
  ),
  (
    header: [r'Cookie-1="v$1"; c2=v2;'],
    expected: {
      'Cookie-1': r'v$1',
      'c2': 'v2',
    },
  ),
  (
    header: [''],
    expected: {},
  ),
];
