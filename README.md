<p align="center">
<img src="./assets/logo-dark.png#gh-dark-mode-only" width="500">
<img src="./assets/logo-light.png#gh-light-mode-only" width="500">
</p>

## Celest

Celest is the Flutter cloud platform. We enable Flutter and Dart developers to declaratively define their backend infrastructure in Dart.

And to stay up-to-date on the future of Celest, including managed deployments, join our waitlist at [celest.dev](https://celest.dev).

## Getting started with Celest

### Prerequisites
To use Celest in your Flutter app, you need the following prerequisites:

1. Install [Flutter](https://docs.flutter.dev/get-started/install)
2. Create a new Flutter project (or choose an existing one)
3. [Download](https://celest.dev/download) and install the Celest CLI

### Creating a Celest project

That’s it! You are now ready to start building your backend - all in Dart!

Start by first creating a new Flutter project. If you have an existing Flutter project, you can use that instead. To start a new Flutter project, go to your console and run the following command.

```shell
$ flutter create <flutter_app>
```

Then, navigate to your new Flutter app directory.

```shell
$ cd <flutter_app>
```

Once you are in your Flutter app directory, run the following command to initialize your Celest project.

```shell    
$ celest start
```

Once the command executes, Celest will spin up a local environment and watch for changes made to your backend, generating a Dart client for you to test your changes.

The CLI will also create a folder in your project called `celest`, which will include the following files.

```shell
flutter_app/
└── celest/
    ├── config/
    │   └── .env            # Environment variables
    ├── functions/          # Celest Functions folder
    |   └── greeting.dart   # Example API file
    ├── lib/
    │   │── client.dart     # Generated client for your Flutter app
    │   ├── models.dart     # Custom API models
    │   └── exceptions.dart # Custom API exceptions
    └── test/               # Tests for your backend
```

To get started building your serverless cloud function, navigate to the `<flutter_app>/celest/functions/` folder and create a file named `<api_name>.dart`. You can create as many APIs as you want in this directory. Think of each file as a way to organize and group multiple Celest Functions of similar functionality into a namespace.

Celest Functions are defined as top-level functions as shown below.

```dart
Future<String> sayHello(String name) async {
  return 'Hello, $name';
}

Future<String> sayGoodbye(String name) async {
  return 'Goodbye, $name';
}
```

That's all you need to define your API! Now, you can connect your Flutter app to your cloud functions by using the code-generated client as shown in the following example. Replace the contents of the `main.dart` file in your Flutter app to the following code-snippet.

```dart
import 'package:flutter/material.dart';
// Import the generated Celest client
import 'package:celest_backend/client.dart';

void main() {
  // Initializes Celest in your Flutter app
  celest.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Homepage'),
        ),
        body: Center(
          child: FutureBuilder(
            // Call your function using the Celest client
            future: celest.functions.greeting.sayHello('Celest'),
            builder: (_, snapshot) => switch (snapshot) {
              AsyncSnapshot(:final data?) => Text(data),
              AsyncSnapshot(:final error?) =>
                Text('${error.runtimeType}: $error'),
              _ => const CircularProgressIndicator(),
            },
          ),
        ),
      ),
    );
  }
}
```

You have now set up your Celest project and integrated it into your Flutter app. Follow our [documentation](https://celest.dev/docs/functions/introduction) to learn more about using Celest Functions.

## Connect with us

- Follow our [Twitter](https://twitter.com/Celest_Dev) account.
- Email us at contact@celest.dev
