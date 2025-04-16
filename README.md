<p align="center">
<img src="./assets/logo-dark.png#gh-dark-mode-only" width="500">
<img src="./assets/logo-light.png#gh-light-mode-only" width="500">
</p>

## Celest

> [!WARNING]
> Celest is in the process of being open-sourced. During this process, many of the previously valid links like [celest.dev]() will be
> unavailable. We expect this process to be completed by the end of April 2025.

Celest is the Flutter cloud platform. We enable Flutter and Dart developers to declaratively define their backend infrastructure in Dart.

And to stay up-to-date on the future of Celest, including full server-side rendered Flutter apps, join our newsletter at [celest.dev](https://www.celest.dev/#stay-up-to-date).

## Getting Started

To get started with Celest, you'll need to configure your development environment so that you have Flutter and the Celest CLI installed on your machine.

1. Install [Flutter](https://docs.flutter.dev/get-started/install) from the official website
2. [Download](https://celest.dev/download) and install the Celest CLI

### Creating a project

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
and to see what else you can do with cloud functions, visit our [docs](https://celest.dev/docs) and explore the different examples and
packages available in this repo.

## Examples

[![Celest](https://github.com/celest-dev/celest/actions/workflows/examples.yaml/badge.svg)](https://github.com/celest-dev/celest/actions/workflows/examples.yaml)

| Example                        | Description                                                                               |
| ------------------------------ | ----------------------------------------------------------------------------------------- |
| [Firebase](examples/firebase/) | Showcases how to integrate Firebase Auth with Celest.                                     |
| [Gemini](examples/gemini/)     | Uses Google's [Gemini](https://ai.google.dev/) API for chat completion.                   |
| [OpenAI](examples/openai/)     | Uses the [OpenAI](https://platform.openai.com/docs/introduction) API for chat completion. |
| [Supabase](examples/supabase/) | Showcases how to integrate Supabase Auth with Celest.                                     |
| [Tasks](examples/tasks/)       | Uses Celest Data to build a simple task tracking app with persistence.                    |

## Packages

| Package                                | Description                                                   | Pub                                                                                                                            | Checks                                                                                                                                                                          |
| -------------------------------------- | ------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [celest](packages/celest/)             | The main package for defining Celest backends.                | <a href="https://pub.dev/packages/celest" target="_blank"> <img src="https://img.shields.io/pub/v/celest.svg"></a>             | [![Celest](https://github.com/celest-dev/celest/actions/workflows/celest.yaml/badge.svg)](https://github.com/celest-dev/celest/actions/workflows/celest.yaml)                   |
| [celest_ast](packages/celest_ast/)     | A structured representation of Celest projects.               | <a href="https://pub.dev/packages/celest_ast" target="_blank"> <img src="https://img.shields.io/pub/v/celest_ast.svg"></a>     | [![Celest AST](https://github.com/celest-dev/celest/actions/workflows/celest_ast.yaml/badge.svg)](https://github.com/celest-dev/celest/actions/workflows/celest_ast.yaml)       |
| [celest_auth](packages/celest_auth/)   | The authentication and authorization runtimes for Celest.     | <a href="https://pub.dev/packages/celest_auth" target="_blank"> <img src="https://img.shields.io/pub/v/celest_auth.svg"></a>   | [![Celest Auth](https://github.com/celest-dev/celest/actions/workflows/celest_auth.yaml/badge.svg)](https://github.com/celest-dev/celest/actions/workflows/celest_auth.yaml)    |
| [celest_cloud](packages/celest_cloud/) | API contracts and Dart clients for the Celest Cloud platform. | <a href="https://pub.dev/packages/celest_cloud" target="_blank"> <img src="https://img.shields.io/pub/v/celest_cloud.svg"></a> | [![Celest Cloud](https://github.com/celest-dev/celest/actions/workflows/celest_cloud.yaml/badge.svg)](https://github.com/celest-dev/celest/actions/workflows/celest_cloud.yaml) |
| [celest_core](packages/celest_core/)   | Core types and utilities shared between Celest packages.      | <a href="https://pub.dev/packages/celest_core" target="_blank"> <img src="https://img.shields.io/pub/v/celest_core.svg"></a>   | [![Celest Core](https://github.com/celest-dev/celest/actions/workflows/celest_core.yaml/badge.svg)](https://github.com/celest-dev/celest/actions/workflows/celest_core.yaml)    |

## Services

| Service                                          | Description                                                                                                                         | Pub                                                                                                                                      | Checks                                                                                                                                                                                         |
| ------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [celest_cloud_auth](packages/celest_cloud_auth/) | A Dart-native authentication and authorization solution built on [Cedar](https://github.com/celest-dev/cedar-dart) and Celest Data. | <a href="https://pub.dev/packages/celest_cloud_auth" target="_blank"> <img src="https://img.shields.io/pub/v/celest_cloud_auth.svg"></a> | [![Celest Cloud Auth](https://github.com/celest-dev/celest/actions/workflows/celest_cloud_auth.yaml/badge.svg)](https://github.com/celest-dev/celest/actions/workflows/celest_cloud_auth.yaml) |

## License

This repo is licensed under the [BSD-2-Clause-Patent](https://spdx.org/licenses/BSD-2-Clause-Patent.html) license. See [LICENSE.md](LICENSE.md) for the full text.

## Connect with us

- Follow our [Twitter](https://twitter.com/Celest_Dev) account.
- Schedule a meeting or chat with us live: [Contact](https://celest.dev/contact)
