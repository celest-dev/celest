import 'package:celest_cloud/celest_cloud.dart' as pb;
import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/model/interop.dart';
import 'package:celest_cloud_auth/src/util/typeid.dart';
import 'package:celest_cloud_core/celest_cloud_core.dart';
import 'package:celest_core/celest_core.dart';
import 'package:checks/checks.dart';
import 'package:collection/collection.dart';
import 'package:test/test.dart';

import '../tester.dart';

void main() {
  final tester = AuthorizationTester(persistData: true);

  group('UsersService', () {
    tester.setUp();

    group('getUser', () {
      final userId = typeId<User>();
      final route = ('GET', '/v1alpha1/auth/users/$userId');

      test('unauthenticated', () async {
        await tester.httpTest({
          route: expectStatus(401),
        });

        final cloud = tester.cloud();
        await check(cloud.users.get('users/$userId'))
            .throws<UnauthorizedException>();
      });

      test('anonymous', () async {
        final (user, cork) = await tester.createUser(
          roles: const [roleAnonymous],
        );

        await tester.httpTest(cork: cork, {
          // Passes authorization since we have a valid cork but fails since we
          // have no record of the user in the DB.
          route: expectStatus(404),
        });

        final cloud = tester.cloud(cork: cork);
        await check(cloud.users.get('users/$userId'))
            .throws<NotFoundException>();
      });

      test('authenticated', () async {
        final (user, cork) = await tester.createUser(
          userId: userId,
          roles: const [roleAuthenticated],
        );
        await tester.httpTest(cork: cork, {
          route: expectAll([
            expectStatus(200),
            expectBody({
              'name': 'users/$userId',
              'userId': userId,
              'createTime': (Subject<Object?> it) => it
                  .isA<String>()
                  .has(DateTime.parse, 'DateTime')
                  .isLessOrEqual(DateTime.now()),
              'emails': [user.primaryEmail!.toJson()],
            }),
          ]),
        });

        final cloud = tester.cloud(cork: cork);
        final me = await cloud.users.get('users/me');

        await check(cloud.users.get('users/$userId')).completes(
          (it) => it
            ..equals(me)
            ..has((it) => it.userId, 'userId').equals(userId)
            ..has((it) => it.emails, 'emails').isNotEmpty(),
        );
      });

      test('admin', () async {
        const email = 'admin@celest.dev';
        final (user, cork) = await tester.createUser(
          userId: userId,
          email: email,
          roles: const [roleAdmin],
        );
        await tester.httpTest(cork: cork, {
          route: expectAll([
            expectStatus(200),
            expectBody({
              'name': 'users/$userId',
              'userId': userId,
              'createTime': (Subject<Object?> it) => it
                  .isA<String>()
                  .has(DateTime.parse, 'DateTime')
                  .isLessOrEqual(DateTime.now()),
              'emails': [
                {
                  'email': email,
                  'isVerified': false,
                  'isPrimary': true,
                }
              ],
            }),
          ]),
        });

        final cloud = tester.cloud(cork: cork);
        final me = await cloud.users.get('users/me');

        await check(cloud.users.get('users/$userId')).completes(
          (it) => it
            ..equals(me)
            ..has((it) => it.userId, 'userId').equals(userId)
            ..has((it) => it.emails, 'emails').isNotEmpty(),
        );
      });
    });

    group('listUsers', () {
      const route = ('GET', '/v1alpha1/auth/users');
      const request = {
        'pageSize': '10',
      };

      group('pagination', () {
        final userIds = List.generate(100, (_) => typeId<User>());
        setUp(() async {
          await Future.wait(
            userIds.map(
              (userId) => tester.db.createUser(
                user: User(
                  userId: userId,
                  roles: const [roleAuthenticated],
                ),
              ),
            ),
          );
        });

        test('defaults', () async {
          final result = await tester.usersService.listUsers();
          check(result.users).length.equals(10);
          check(result.hasNextPageToken()).isTrue();
        });

        for (final pageSize in [1, 10, 25, 50, 100, 200]) {
          test('pageSize=$pageSize', () async {
            final seen = <String>{};
            final numPages = userIds.length ~/ pageSize + 1;

            PageToken? pageToken;
            for (var page = 1;; page++) {
              context.logger.finest('page=$page, pageToken=$pageToken');
              final result = await tester.usersService.listUsers(
                pageSize: pageSize,
                pageToken: pageToken?.encode(),
              );
              context.logger.finest('result=$result');
              for (final user in result.users) {
                check(
                  because: 'We should not have seen ${user.userId} before',
                  seen.add(user.userId),
                ).isTrue();
              }
              if (page == numPages) {
                check(result, because: 'Expect $page/$numPages to be the last')
                    .has((it) => it.hasNextPageToken(), 'hasNextPageToken')
                    .isFalse();
                check(result.users).length.equals(userIds.length % pageSize);
                break;
              }
              check(result.users).length.equals(pageSize);
              check(result)
                  .has((it) => it.hasNextPageToken(), 'hasNextPageToken')
                  .isTrue();
              pageToken = PageToken.parse(result.nextPageToken);
            }
          });
        }
      });

      group('order by', () {
        const numUsers = 10;
        var users = List.generate(
          numUsers,
          (i) => User(
            userId: typeId<User>(),
            givenName: 'User $i',
            familyName: '${numUsers - i}',
            roles: const [roleAuthenticated],
          ),
        );
        late Map<String, List<User> Function(List<User>)> expectedByColumn;

        setUp(() async {
          final createdUsers = <User>[];
          for (final user in users) {
            final createdUser = await tester.db.createUser(
              user: user,
            );
            createdUsers.add(createdUser);
            // Create users in a staggered fashion to ensure that the create
            // time is different for each user.
            await Future<void>.delayed(const Duration(milliseconds: 10));
          }
          users = createdUsers;

          expectedByColumn = {
            'create_time': (users) =>
                users.sortedBy((user) => user.createTime!),
            'given_name': (users) => users.sortedBy((user) => user.givenName!),
            'family_name': (users) =>
                users.sortedBy((user) => user.familyName!),
          };
        });

        const columns = ['create_time', 'given_name', 'family_name'];
        for (final column in columns) {
          test('ascending', () async {
            final result = await tester.usersService.listUsers(
              orderBy: column,
            );
            check(result.users.map((user) => user.toModel()))
                .deepEquals(expectedByColumn[column]!(users));
          });

          test('descending', () async {
            final result = await tester.usersService.listUsers(
              orderBy: '-$column',
            );
            check(result.users.map((user) => user.toModel())).deepEquals(
              expectedByColumn[column]!(users).reversed,
            );
          });
        }
      });

      group('auth', () {
        test('unauthenticated', () async {
          await tester.httpTest(query: request, {
            route: expectStatus(401),
          });
        });

        test('anonymous', () async {
          final (user, cork) = await tester.createUser(
            roles: const [roleAnonymous],
          );

          await tester.httpTest(cork: cork, query: request, {
            // Passes authorization but fails authentication since we have no
            // record of the user in the DB.
            route: expectStatus(403),
          });

          final cloud = tester.cloud(cork: cork);
          await check(cloud.users.list()).throws<PermissionDeniedException>();
        });

        test('authenticated', () async {
          final (user, cork) = await tester.createUser(
            roles: const [roleAuthenticated],
          );
          await tester.httpTest(cork: cork, query: request, {
            route: expectAll([
              // Only admins can list users
              expectStatus(403),
            ]),
          });

          final cloud = tester.cloud(cork: cork);
          await check(cloud.users.list()).throws<PermissionDeniedException>();
        });

        test('admin', () async {
          final (user, cork) = await tester.createUser(
            roles: const [roleAdmin],
          );
          final userId = user.userId;
          await tester.httpTest(cork: cork, query: request, {
            route: expectAll([
              expectStatus(200),
              expectBody({
                'users': [
                  {
                    'name': 'users/$userId',
                    'userId': userId,
                    'emails': [user.primaryEmail!.toJson()],
                    'createTime': (Subject<Object?> it) => it
                        .isA<String>()
                        .has(DateTime.parse, 'DateTime')
                        .isLessOrEqual(DateTime.now()),
                  },
                ],
              }),
            ]),
          });

          final cloud = tester.cloud(cork: cork);
          await check(cloud.users.list()).completes(
            (it) => it
              ..has((it) => it.users, 'users').length.equals(1)
              ..has((it) => it.users.first.userId, 'userId').equals(userId),
          );
        });
      });
    });

    group('updateUser', () {
      final userId = typeId<User>();

      test('can update fields', () async {
        final (user, cork) = await tester.createUser(
          userId: userId,
          roles: const [roleAuthenticated],
        );
        final before = await tester.usersService.getUser(userId: userId);
        check(before.givenName).isNull();
        check(before.familyName).isNull();
        check(before.updateTime).isNull();
        check(before).equals(user);
        final updated = await tester.usersService.updateUser(
          userId: userId,
          givenName: 'John',
          familyName: 'Doe',
        );
        check(updated.givenName).equals('John');
        check(updated.familyName).equals('Doe');
        check(updated.updateTime).isNotNull();
        final after = await tester.usersService.getUser(userId: userId);
        check(after).equals(updated);
      });

      test('can set field mask', () async {
        final (user, cork) = await tester.createUser(
          userId: userId,
          roles: const [roleAuthenticated],
        );
        final before = await tester.usersService.getUser(userId: userId);
        check(before.givenName).isNull();
        check(before.familyName).isNull();
        check(before.updateTime).isNull();
        check(before).equals(user);
        final updated = await tester.usersService.updateUser(
          userId: userId,
          givenName: 'John',
          familyName: 'Doe',
          updateMask: ['given_name'],
        );
        check(updated.givenName).equals('John');
        check(updated.familyName).isNull();
        check(updated.updateTime).isNotNull();
        final after = await tester.usersService.getUser(userId: userId);
        check(after).equals(updated);
      });

      group('auth', () {
        final selfRoute = ('PATCH', '/v1alpha1/auth/users/$userId');

        final otherUserId = typeId<User>();
        final otherRoute = ('PATCH', '/v1alpha1/auth/users/$otherUserId');

        const request = {
          'givenName': 'John',
          'familyName': 'Doe',
        };

        test('unauthenticated', () async {
          await tester.httpTest({
            selfRoute: expectStatus(401),
          });

          final cloud = tester.cloud();
          await check(
            cloud.users.update(
              user: pb.User(
                name: 'users/$userId',
                givenName: 'John',
                familyName: 'Doe',
              ),
              updateMask: pb.FieldMask(paths: ['given_name', 'family_name']),
            ),
          ).throws<UnauthorizedException>();
        });

        test('anonymous', () async {
          final (user, cork) = await tester.createUser(
            roles: const [roleAnonymous],
          );

          await tester.httpTest(cork: cork, body: request, {
            // Passes authorization but fails authentication since we have no
            // record of the user in the DB.
            selfRoute: expectStatus(403),
          });

          final cloud = tester.cloud(cork: cork);
          await check(
            cloud.users.update(
              user: pb.User(
                name: 'users/$userId',
                givenName: 'John',
                familyName: 'Doe',
              ),
              updateMask: pb.FieldMask(paths: ['given_name', 'family_name']),
            ),
          ).throws<PermissionDeniedException>();
        });

        test('authenticated', () async {
          final (user, cork) = await tester.createUser(
            userId: userId,
            roles: const [roleAuthenticated],
          );
          await tester.createUser(
            userId: otherUserId,
            roles: const [roleAuthenticated],
          );
          await tester.httpTest(cork: cork, body: request, {
            // Can update self
            selfRoute: expectStatus(200),

            // but not others
            otherRoute: expectStatus(403),
          });

          final cloud = tester.cloud(cork: cork);
          await check(
            cloud.users.update(
              user: pb.User(
                name: 'users/$userId',
                givenName: 'John',
                familyName: 'Doe',
              ),
              updateMask: pb.FieldMask(paths: ['given_name', 'family_name']),
            ),
          ).completes(
            (it) => it
              ..has((it) => it.givenName, 'givenName').equals('John')
              ..has((it) => it.familyName, 'familyName').equals('Doe'),
          );

          await check(
            cloud.users.update(
              user: pb.User(
                name: 'users/$otherUserId',
                givenName: 'John',
                familyName: 'Doe',
              ),
              updateMask: pb.FieldMask(paths: ['given_name', 'family_name']),
            ),
          ).throws<PermissionDeniedException>();
        });

        test('admin', () async {
          final (user, cork) = await tester.createUser(
            userId: userId,
            roles: const [roleAdmin],
          );
          await tester.createUser(
            userId: otherUserId,
            roles: const [roleAuthenticated],
          );

          await tester.httpTest(cork: cork, body: request, {
            // Can update self
            selfRoute: expectStatus(200),

            // and others
            otherRoute: expectStatus(200),
          });

          final cloud = tester.cloud(cork: cork);
          await check(
            cloud.users.update(
              user: pb.User(
                name: 'users/$userId',
                givenName: 'John',
                familyName: 'Doe',
              ),
              updateMask: pb.FieldMask(paths: ['given_name', 'family_name']),
            ),
          ).completes(
            (it) => it
              ..has((it) => it.givenName, 'givenName').equals('John')
              ..has((it) => it.familyName, 'familyName').equals('Doe'),
          );

          await check(
            cloud.users.update(
              user: pb.User(
                name: 'users/$otherUserId',
                givenName: 'John',
                familyName: 'Doe',
              ),
              updateMask: pb.FieldMask(paths: ['given_name', 'family_name']),
            ),
          ).completes(
            (it) => it
              ..has((it) => it.givenName, 'givenName').equals('John')
              ..has((it) => it.familyName, 'familyName').equals('Doe'),
          );
        });
      });
    });

    group('deleteUser', () {
      final userId = typeId<User>();

      test('can delete user', () async {
        final (user, cork) = await tester.createUser(
          userId: userId,
          roles: const [roleAuthenticated],
        );
        final before = await tester.usersService.getUser(userId: userId);
        check(before).equals(user);
        await tester.usersService.deleteUser(userId: userId);
        await check(tester.usersService.getUser(userId: userId))
            .throws((it) => it.isA<NotFoundException>());
      });

      group('auth', () {
        final selfRoute = ('DELETE', '/v1alpha1/auth/users/$userId');

        final otherUserId = typeId<User>();
        final otherRoute = ('DELETE', '/v1alpha1/auth/users/$otherUserId');

        setUp(() async {
          await tester.db.cloudAuthUsersDrift.deleteUser(userId: otherUserId);
        });

        test('unauthenticated', () async {
          await tester.httpTest({
            selfRoute: expectStatus(401),
          });

          final cloud = tester.cloud();
          await check(cloud.users.delete('users/$userId'))
              .throws<UnauthorizedException>();
        });

        test('anonymous', () async {
          final (user, cork) = await tester.createUser(
            userId: userId,
            roles: const [roleAnonymous],
          );

          await tester.httpTest(cork: cork, {
            selfRoute: expectStatus(200),
          });
        });

        test('anonymous (cloud)', () async {
          final (user, cork) = await tester.createUser(
            userId: userId,
            roles: const [roleAnonymous],
          );

          final cloud = tester.cloud(cork: cork);
          await check(cloud.users.delete('users/$userId')).completes();
        });

        test('authenticated', () async {
          final (user, cork) = await tester.createUser(
            userId: userId,
            roles: const [roleAuthenticated],
          );
          await tester.createUser(
            userId: otherUserId,
            roles: const [roleAuthenticated],
          );
          await tester.httpTest(cork: cork, {
            // Cannot delete others
            otherRoute: expectStatus(403),

            // and can delete self
            selfRoute: expectStatus(200),
          });

          // and then nothing more
          await tester.httpTest(cork: cork, {
            selfRoute: expectStatus(401),
          });
        });

        test('authenticated (cloud)', () async {
          final (user, cork) = await tester.createUser(
            userId: userId,
            roles: const [roleAuthenticated],
          );
          await tester.createUser(
            userId: otherUserId,
            roles: const [roleAuthenticated],
          );

          final cloud = tester.cloud(cork: cork);
          // Cannot delete others
          await check(cloud.users.delete('users/$otherUserId'))
              .throws<PermissionDeniedException>();

          // and can delete self
          await check(cloud.users.delete('users/$userId')).completes();

          // and then nothing more
          await check(cloud.users.delete('users/$userId'))
              .throws<UnauthorizedException>();
        });

        test('admin', () async {
          final (user, cork) = await tester.createUser(
            userId: userId,
            roles: const [roleAdmin],
          );
          await tester.createUser(
            userId: otherUserId,
            roles: const [roleAuthenticated],
          );

          await tester.httpTest(cork: cork, {
            // Can delete others
            otherRoute: expectStatus(200),

            // and can delete self
            selfRoute: expectStatus(200),
          });

          // and then nothing more
          await tester.httpTest(cork: cork, {
            selfRoute: expectStatus(401),
          });
        });

        test('admin (cloud)', () async {
          final (user, cork) = await tester.createUser(
            userId: userId,
            roles: const [roleAdmin],
          );
          await tester.createUser(
            userId: otherUserId,
            roles: const [roleAuthenticated],
          );

          final cloud = tester.cloud(cork: cork);

          // Can delete others
          await check(cloud.users.delete('users/$otherUserId')).completes();

          // and can delete self
          await check(cloud.users.delete('users/$userId')).completes();

          // and then nothing more
          await check(cloud.users.delete('users/$userId'))
              .throws<UnauthorizedException>();
        });
      });
    });
  });
}
