# Celest Cloud Auth

A fully Dart-native solution for authenticating users and authorizing access to resources. Built on the [Cedar](https://www.cedarpolicy.com/en) policy engine and Celest Data.

## Features

- **Authentication**: Securely authenticate users using email OTP, with support for passwordless and social logins coming soon.
- **Authorization**: Define and enforce access control policies using the [Cedar](https://www.cedarpolicy.com/en) policy engine.
- **Data**: Store user data and access control policies in SQLite or Celest Data.

## Getting Started

The easiest way to get started with Celest Cloud Auth is to use the [Celest CLI](https://celest.dev/docs/get-started) and add an [AuthProvider](https://pub.dev/documentation/celest/latest/celest/AuthProvider-class.html) to your project.

```dart
import 'package:celest/celest.dart';

const project = Project(name: 'my-project');

const auth = Auth(
  providers: [
    AuthProvider.email(),
  ],
);
```

Celest will automatically generate the necessary code to integrate Celest Cloud Auth into your project so you can start
authenticating users and controlling the resources they can access.

Celest Cloud Auth can also be integrated into and Dart server, though, using the [shelf](https://pub.dev/packages/shelf) package.

```dart
Future<void> main() async {
  final auth = await CelestCloudAuth.create(
    database: AuthDatabase.memory(),
  );

  // Adds authentication routes.
  final router = Router();
  router.mount('/v1alpha1/auth/', auth.handler);

  // Adds authorization middleware.
  final pipeline = const Pipeline().addMiddleware(auth.middleware);

  final server = await serve(
    pipeline.addHandler(router.call),
    InternetAddress.anyIpV4,
    8080,
  );
  print('Serving at http://${server.address.host}:${server.port}');
}
```
