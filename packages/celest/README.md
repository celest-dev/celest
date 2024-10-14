# Celest

Celest is the Flutter cloud platform, enabling Dart and Flutter developers to define their backend infrastructure purely in Dart.

Celest offers a simple and intuitive way to define cloud functions, authentication, and database services. With Celest, you can build full-stack Flutter applications with ease,
all while using the same language and tools you already know.

## Getting Started

To get started with Celest, you need to install the Celest CLI. You can do this by downloading the latest release from our [website](https://celest.dev/download).

Once you have the CLI installed, you can create a new project by running the following command:

```bash
$ celest init
```
You can run this command from within your Flutter project which will create a new `celest/` directory for your project. Or you can run
this in another directory to have a standalone Celest project.

Once you have a project, run `celest start` to start a local development environment.

```bash
$ celest start
✓ Celest is running on http://localhost:7777
```

This command will start a local server which will run in the background as you write your backend logic. As you make changes to the files in the `celest/` directory, 
the server will hot-reload those changes so you can see them live.

To interact with the running environment, Celest will generate a Dart client which you can use in any Dart or Flutter project. This client 
is generated in the `client/` directory of your `celest/` folder. As you make changes in the local environment, this client will be updated to reflect those changes.

### Example

Here is an example of a simple Celest function:

```dart
import 'package:celest/celest.dart';

@cloud
Future<String> sayHello(String name) async {
  print('Saying hello to $name');
  return 'Hello, $name';
}
```

This function can be called from a Dart project like so:

```dart
import 'package:my_project_client/my_project_client.dart';

Future<void> main() async {
  celest.init(environment: CelestEnvironment.local);
  final response = await celest.functions.sayHello('World');
  print(response); // Hello, World
}
```

## What's Next?

In addition to Dart cloud functions, Celest offers authentication and database services out-of-the-box. To learn more about these features, 
and to see what else you can do with cloud functions, visit our [docs](https://celest.dev/docs).
