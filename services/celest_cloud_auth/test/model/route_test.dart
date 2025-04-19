import 'package:celest_cloud_auth/src/model/route.dart';
import 'package:checks/checks.dart';
import 'package:petitparser/petitparser.dart';
import 'package:test/test.dart';

void main() {
  group('Route', () {
    test('Literal', () {
      const segment = '/v1alpha1/auth/users';
      final literal = RouteLiteral(segment);
      check(literal.parse(segment))
          .isA<Success<String>>()
          .has((it) => it.value, 'value')
          .equals(segment);
    });

    test('Wildcard (greedy)', () {
      final wildcard = RouteWildcard(greedy: true);
      check(wildcard.parse('123'))
          .isA<Success<String>>()
          .has((it) => it.value, 'value')
          .equals('123');
      check(wildcard.parse('123/456'))
          .isA<Success<String>>()
          .has((it) => it.value, 'value')
          .equals('123/456');
    });

    test('Wildcard (greedy, >maxLength)', () {
      final path = '123/456/789' * 1000;
      final wildcard = RouteWildcard(greedy: true);
      check(wildcard.parse(path)).isA<Failure>();
    });

    test('Wildcard (non-greedy)', () {
      final wildcard = RouteWildcard(greedy: false);
      check(wildcard.parse('123'))
          .isA<Success<String>>()
          .has((it) => it.value, 'value')
          .equals('123');
      check(wildcard.parse('123/456'))
          .isA<Success<String>>()
          .has((it) => it.value, 'value')
          .equals('123');
    });

    test('Route', () {
      final route = Route(
        template: '/v1alpha1/auth/{name=users/*}',
        segments: [
          RouteLiteral('v1alpha1'),
          RouteLiteral('auth'),
          RouteParameter(
            variable: 'name',
            segments: [
              RouteLiteral('users'),
              RouteWildcard(greedy: false),
            ],
          ),
        ],
      );
      check(route.parse('/v1alpha1/auth/users/123'))
          .isA<Success<Map<String, String>>>()
          .has((it) => it.value, 'value')
          .deepEquals({'name': 'users/123'});
    });

    group('parse', () {
      for (final testCase in _testCases) {
        test(testCase.route, () {
          final actual = Route.parse(testCase.route);
          check(actual)
              .has((it) => it.segments, 'segments')
              .deepEquals(testCase.expectedSegments);
          check(actual)
              .has((it) => it.verb, 'verb')
              .equals(testCase.expectedVerb);
          check(actual.toString()).equals(testCase.route);
        });
      }
    });

    group('match', () {
      for (final testCase in _testCases) {
        test(testCase.route, () {
          final route = Route.parse(testCase.route);

          for (final matchTest in testCase.matchTests) {
            final actual = route.match(matchTest.route, debug: false);
            if (matchTest.expected case final expected?) {
              check(actual).isNotNull().deepEquals(expected);
            } else {
              check(actual).isNull();
            }
          }
        });
      }
    });
  });
}

typedef _TestCase = ({
  String route,
  List<RouteSegment> expectedSegments,
  RouteVerb? expectedVerb,
  List<_MatchTest> matchTests,
});

typedef _MatchTest = ({
  String route,
  Map<String, String>? expected,
});

final _testCases = <_TestCase>[
  (
    route: '/v1alpha1/auth/users',
    expectedSegments: [
      RouteLiteral('v1alpha1'),
      RouteLiteral('auth'),
      RouteLiteral('users'),
    ],
    expectedVerb: null,
    matchTests: [
      (
        route: '/v1alpha1/auth/users',
        expected: {},
      ),
      (
        route: '/v1alpha1/auth',
        expected: null,
      ),
    ],
  ),
  (
    route: '/v1alpha1/auth/users/{id=**}',
    expectedSegments: [
      RouteLiteral('v1alpha1'),
      RouteLiteral('auth'),
      RouteLiteral('users'),
      RouteParameter(
        variable: 'id',
        segments: [RouteWildcard(greedy: true)],
      ),
    ],
    expectedVerb: null,
    matchTests: [
      (
        route: '/v1alpha1/auth/users/123',
        expected: {'id': '123'},
      ),
      (
        route: '/v1alpha1/auth/users/123/456',
        expected: {'id': '123/456'},
      ),
      (
        route: '/v1alpha1/auth/users',
        expected: null,
      ),
    ],
  ),
  (
    route: '/v1alpha1/auth/{name=users/*}',
    expectedSegments: [
      RouteLiteral('v1alpha1'),
      RouteLiteral('auth'),
      RouteParameter(
        variable: 'name',
        segments: [
          RouteLiteral('users'),
          RouteWildcard(greedy: false),
        ],
      ),
    ],
    expectedVerb: null,
    matchTests: [
      (
        route: '/v1alpha1/auth/users/123',
        expected: {'name': 'users/123'},
      ),
      (
        route: '/v1alpha1/auth/users/123/456',
        expected: null,
      ),
      (
        route: '/v1alpha1/auth',
        expected: null,
      ),
    ],
  ),
  (
    route: '/v1alpha1/auth/{name=users/**}',
    expectedSegments: [
      RouteLiteral('v1alpha1'),
      RouteLiteral('auth'),
      RouteParameter(
        variable: 'name',
        segments: [
          RouteLiteral('users'),
          RouteWildcard(greedy: true),
        ],
      ),
    ],
    expectedVerb: null,
    matchTests: [
      (
        route: '/v1alpha1/auth/users/123',
        expected: {'name': 'users/123'},
      ),
      (
        route: '/v1alpha1/auth/users/123/456',
        expected: {'name': 'users/123/456'},
      ),
      (
        route: '/v1alpha1/auth/users',
        expected: null,
      ),
    ],
  ),
  (
    route: '/v1alpha1/auth/{name=users/*}/email',
    expectedSegments: [
      RouteLiteral('v1alpha1'),
      RouteLiteral('auth'),
      RouteParameter(
        variable: 'name',
        segments: [
          RouteLiteral('users'),
          RouteWildcard(greedy: false),
        ],
      ),
      RouteLiteral('email'),
    ],
    expectedVerb: null,
    matchTests: [
      (
        route: '/v1alpha1/auth/users/123/email',
        expected: {'name': 'users/123'},
      ),
      (
        route: '/v1alpha1/auth/users/123/456/email',
        expected: null,
      ),
      (
        route: '/v1alpha1/auth/users/email',
        expected: null,
      ),
    ],
  ),
  (
    route: '/v1alpha1/{name=organizations/*/projects/*}',
    expectedSegments: [
      RouteLiteral('v1alpha1'),
      RouteParameter(
        variable: 'name',
        segments: [
          RouteLiteral('organizations'),
          RouteWildcard(greedy: false),
          RouteLiteral('projects'),
          RouteWildcard(greedy: false),
        ],
      ),
    ],
    expectedVerb: null,
    matchTests: [
      (
        route: '/v1alpha1/organizations/org_1234/projects/my-project',
        expected: {
          'name': 'organizations/org_1234/projects/my-project',
        },
      ),
    ],
  ),
  (
    route: '/v1alpha1/auth/{name=organizations/*/users/*}',
    expectedSegments: [
      RouteLiteral('v1alpha1'),
      RouteLiteral('auth'),
      RouteParameter(
        variable: 'name',
        segments: [
          RouteLiteral('organizations'),
          RouteWildcard(greedy: false),
          RouteLiteral('users'),
          RouteWildcard(greedy: false),
        ],
      ),
    ],
    expectedVerb: null,
    matchTests: [
      (
        route: '/v1alpha1/auth/organizations/123/users/456',
        expected: {'name': 'organizations/123/users/456'},
      ),
      (
        route: '/v1alpha1/auth/organizations/123/users',
        expected: null,
      ),
      (
        route: '/v1alpha1/auth/organizations/users/123',
        expected: null,
      ),
      (
        route: '/v1alpha1/auth/organizations/123/users/456/789',
        expected: null,
      ),
    ],
  ),
  (
    route: '/v1alpha1/auth/{user.name=organizations/*/users/*}:updateEmail',
    expectedSegments: [
      RouteLiteral('v1alpha1'),
      RouteLiteral('auth'),
      RouteParameter(
        variable: 'user.name',
        segments: [
          RouteLiteral('organizations'),
          RouteWildcard(greedy: false),
          RouteLiteral('users'),
          RouteWildcard(greedy: false),
        ],
      ),
    ],
    expectedVerb: RouteVerb('updateEmail'),
    matchTests: [
      (
        route: '/v1alpha1/auth/organizations/123/users/456:updateEmail',
        expected: {'user.name': 'organizations/123/users/456'},
      ),
      (
        route: '/v1alpha1/auth/organizations/123/users:updateEmail',
        expected: null,
      ),
      (
        route: '/v1alpha1/auth/organizations/users/123:updateEmail',
        expected: null,
      ),
      (
        route: '/v1alpha1/auth/organizations/123/users/456/789:updateEmail',
        expected: null,
      ),
    ],
  ),
  (
    route: '/v1alpha1/{name=projects/*/environments/*}:deploy',
    expectedSegments: [
      RouteLiteral('v1alpha1'),
      RouteParameter(
        variable: 'name',
        segments: [
          RouteLiteral('projects'),
          RouteWildcard(greedy: false),
          RouteLiteral('environments'),
          RouteWildcard(greedy: false),
        ],
      ),
    ],
    expectedVerb: RouteVerb('deploy'),
    matchTests: [
      (
        route:
            '/v1alpha1/projects/prj_01jree4tjseatvbwcbg3s0526r/environments/env_01jree4tqqeefsyvr67fxmp87a:deploy',
        expected: {
          'name':
              'projects/prj_01jree4tjseatvbwcbg3s0526r/environments/env_01jree4tqqeefsyvr67fxmp87a',
        },
      ),
    ],
  ),
  (
    route: '/test/say-hello',
    expectedSegments: [
      RouteLiteral('test'),
      RouteLiteral('say-hello'),
    ],
    expectedVerb: null,
    matchTests: [
      (
        route: '/test/say-hello',
        expected: {},
      ),
      (
        route: '/test/say-hello/',
        expected: null,
      ),
      (
        route: '/test/say-hello/123',
        expected: null,
      ),
    ],
  ),
];
