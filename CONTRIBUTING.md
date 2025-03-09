# Welcome to the Celest repo

> **Contributors should read these guidelines in full before submitting any changes for review.**

This repository contains the source code for many components of Celest, a project that aims to provide a simple and easy-to-use platform for developers to create and deploy Dart and Flutter applications to the cloud.

## Contributing

### Get Started

To get started contributing to Celest, clone the repository using the `git clone` command:

```bash
$ git clone https://github.com/celest-dev/celest.git
```

The monorepo uses [melos](https://pub.dev/packages/melos) for managing dependency linking and versioning. Before starting, ensure you have melos installed globally:

```bash
$ dart pub global activate melos
```

Then run `melos bootstrap` to link all packages together:

```bash
$ melos bootstrap
```

### Submitting a Pull Request

Ensure that any changes made to a package have accompanying tests. To run tests for a package, navigate to the package directory and run the following command:

```bash
$ dart test
```

Pull request titles should follow [convential commit](https://www.conventionalcommits.org/en/v1.0.0/) format `type(scope): Title` where `type` is the type of change being made (e.g. `feat`, `chore`, `refactor`, etc) and `scope` is the scope of the change (e.g. `auth`, `core`, or `repo` for repo-wide changes). 

For example, a pull request that adds a new feature to Celest Auth should have a title like `feat(auth): Passkey management`.
