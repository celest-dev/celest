<p align="center">
<img src="./assets/logo-dark.png#gh-dark-mode-only" width="500">
<img src="./assets/logo-light.png#gh-light-mode-only" width="500">
</p>

## Celest

Celest is the Flutter cloud platform. We enable Flutter and Dart developers to declaratively define their backend infrastructure in Dart.

And to stay up-to-date on the future of Celest, including full server-side rendered Flutter apps, join our newsletter at [celest.dev](https://www.celest.dev/#stay-up-to-date).

## Getting started with Celest

### Prerequisites

To use Celest in your Flutter app, you need the following prerequisites:

1. Install [Flutter](https://docs.flutter.dev/get-started/install)
2. Create a new Flutter project (or choose an existing one)
3. [Download](https://celest.dev/docs/download) and install the Celest CLI

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
    ├── functions/                        # Celest Functions folder
    |   └── greeting.dart                 # Example API file
    ├── lib/
    │   │── client.dart                   # Generated client for your Flutter app
    │   ├── models/                       # Custom API models
    |   |   └── person.dart
    │   └── exceptions/                   # Custom API exceptions
    |       └── bad_name_exception.dart
    └── test/                             # Tests for your backend
```

To start building your serverless cloud function, navigate to the `my_celest_app/celest/functions/` folder and create a file named `<api_name>.dart`. You can create as many APIs as you want in this directory. 
Each file groups and organizes multiple Celest Functions of similar functionality into a namespace.

Celest Functions are defined as top-level functions as shown below.

```dart
@cloud
Future<String> sayHello(String name) async {
  return 'Hello, $name';
}

@cloud
Future<String> sayGoodbye(String name) async {
  return 'Goodbye, $name';
}
```

That's all you need to define your API! Now, you can connect your Flutter app to your cloud functions by using the Celest client as shown in the following example. Replace the contents of the `main.dart` file in your Flutter app to the following code-snippet.

```dart {3,7,24}
import 'package:flutter/material.dart';
// Import the generated Celest client
import 'package:celest_backend/client.dart';

void main() {
  // Initialize Celest at the start of your app
  celest.init(environment: CelestEnvironment.local);
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

## Examples

[![Celest](https://github.com/celest-dev/celest/actions/workflows/examples.yaml/badge.svg)](https://github.com/celest-dev/celest/actions/workflows/examples.yaml)

| Example                    | Description                                                                               |
| -------------------------- | ----------------------------------------------------------------------------------------- |
| [Gemini](examples/gemini/) | Uses Google's [Gemini](https://ai.google.dev/) API for chat completion.                   |
| [OpenAI](examples/openai/) | Uses the [OpenAI](https://platform.openai.com/docs/introduction) API for chat completion. |
| [Todo](examples/todo/)     | A simple todo list application.                                                           |

## Packages

| Package                                    | Description                                                              | Pub                                                                                                                                | Checks                                                                                                                                                                                |
| ------------------------------------------ | ------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [celest](packages/celest/)                 | The main package for defining Celest backends.                           | <a href="https://pub.dev/packages/celest" target="_blank"> <img src="https://img.shields.io/pub/v/celest.svg"></a>                 | [![Celest](https://github.com/celest-dev/celest/actions/workflows/celest.yaml/badge.svg)](https://github.com/celest-dev/celest/actions/workflows/celest.yaml)                         |
| [celest_auth](packages/celest_auth/)       | The authentication and authorization runtimes for Celest.                | <a href="https://pub.dev/packages/celest_auth" target="_blank"> <img src="https://img.shields.io/pub/v/celest_auth.svg"></a>       | [![Celest Auth](https://github.com/celest-dev/celest/actions/workflows/celest_auth.yaml/badge.svg)](https://github.com/celest-dev/celest/actions/workflows/celest_auth.yaml)          |
| [celest_core](packages/celest_core/)       | Core types and utilities shared between Celest packages.                 | <a href="https://pub.dev/packages/celest_core" target="_blank"> <img src="https://img.shields.io/pub/v/celest_core.svg"></a>       | [![Celest Core](https://github.com/celest-dev/celest/actions/workflows/celest_core.yaml/badge.svg)](https://github.com/celest-dev/celest/actions/workflows/celest_core.yaml)          |

## License

This repo is licensed under the [BSD-2-Clause-Patent](https://spdx.org/licenses/BSD-2-Clause-Patent.html) license. See [LICENSE.md](LICENSE.md) for the full text.

## Connect with us

- Follow our [Twitter](https://twitter.com/Celest_Dev) account.
- Schedule a meeting or chat with us live: [Contact](https://celest.dev/contact)
