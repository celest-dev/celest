## 1.0.0

The first release of Celest V1! This release includes:

- **Celest Data**

    Celest Data is a brand new database offering from Celest built off of SQLite and [Drift](https://pub.dev/packages/drift).

    To get started with Celest Data, add a new `Database` component to your Celest project and point it at your Drift schema.

    ```dart
    import 'package:celest/celest.dart';
    import 'package:celest_backend/src/database/task_database.dart';

    const project = Project(name: 'tasks');

    const tasksDatabase = Database(
      schema: Schema.drift(TaskDatabase),
    );
    ```

    When you run Celest locally, Celest Data will use SQLite to store your data. And when you deploy your Celest project, Celest Data 
    will automatically switch to using Celest Data backed by [Turso](https://turso.tech/).

- **Celest Cloud Auth**

    [Celest Cloud Auth](https://pub.dev/packages/celest_cloud_auth) is an open-source backend service for authenticating users and authorizing access to resources. It is built on the [Cedar](https://www.cedarpolicy.com/en) policy engine and Celest Data.

    Now, when adding [Auth]() to your Celest project, Celest will automatically generate the necessary code to integrate Celest Cloud 
    Auth into your project so you can start authenticating users and controlling the resources they can access.

    ```dart
    import 'package:celest/celest.dart';

    const project = Project(name: 'my-project');

    const auth = Auth(
      providers: [
          AuthProvider.email(),
      ],
    );
    ```

- **Self-Hosting**

    Celest now supports self-hosting your Celest project. You can run your Celest project on your own server or cloud provider. 
    This allows you to have full control over your backend and data.

    The new `celest build` command will automatically generate a `Dockerfile` which you can deploy to any server of your choice.

- **Improved Developer Experience**

    We have made several improvements to the developer experience, including better error messages, improved documentation, and a 
    new Dart analyzer plugin which helps you more seamlessly navigate your code. Now, when using the `Go To Definition` feature in
    your IDE, you will be taken directly from your frontend to your backend code.

    <br />

    ![Go To Definition](https://github.com/celest-dev/celest/blob/master/assets/analyzer-plugin.gif)

    <br />

- **...and much more on the Roadmap!**

    We are excited to continue building out the Celest platform and have many more features planned for the future. Our initial release
    of Celest V1 provides the foundation for many new features to come include server-side rendering of Flutter app, better integration
    of your Data models and Auth policies, Web Hosting, Storage, and much more!
    
    Stay tuned for more updates by following us on [X](https://x.com/Celest_Dev) and joining our [Discord](https://celest.dev/discord).

Flutter is the future! 🚀

## 0.4.2

- feat: Add support for event streaming via SSE/WebSockets

## 0.4.1

- fix: Pana issues ([dart-lang/pana#1351](https://github.com/dart-lang/pana/issues/1351))

## 0.4.0

This release introduces support for HTTP customization, improved ergonomics, and a preview of running Flutter and UI code in the sky! 
Check out our [blog post](https://celest.dev/blog/fluttering-in-the-sky) for more details.

- feat: Add support for HTTP customization
- feat: Add support for running Flutter and UI code in the cloud
- chore!: Require `@cloud` annotation for cloud functions
- chore!: Replace `@Context.user` with `@principal`
- chore!: Rename generated `Env` annotations to `env`.
- chore!: Rename `InternalServerException` to `InternalServerError`
- chore: Migrate to `package:native_storage`

## 0.3.1

- Makes request context not specific to Celest

## 0.3.0

- Initial release of Celest Auth with email OTP support

## 0.2.0

- Bumps minimum Dart SDK to 3.3
- Adds `JsonValue` hierarchy for representing JSON primitives safely
- Model/exception types from third-party packages no longer need to be exported from `models.dart`/`exceptions.dart`. Only types you've defined in your backend.
- Adds support for `lib/models/` and `lib/exceptions/` folders for better organization of custom types

### Fixes
- fix: Celest crashing when editing files [#25](https://github.com/celest-dev/celest/issues/25)
- fix: Allow Object and Object?/dynamic is models, functions and exceptions [#35](https://github.com/celest-dev/celest/issues/35)
- fix: Incompatibility of custom toJson/fromJson with other non-Celest code [#38](https://github.com/celest-dev/celest/issues/38)
- fix: Allow the code to specify/check if Celest is running locally or in the cloud (and where in the cloud). [#43](https://github.com/celest-dev/celest/issues/43)
- fix: Bug: Custom exception not thrown [#48](https://github.com/celest-dev/celest/issues/48)
- fix: DRY up exception handling in generated client [#49](https://github.com/celest-dev/celest/issues/49)

## 0.1.1

- Update README

## 0.1.0

- Initial version.
