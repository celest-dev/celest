## 1.0.2

- chore: Make close part of the public API (#267)
- refactor(cloud_auth)!: Consolidate session logic (#273)

## 1.0.1

- chore: Bump minimum Dart SDK to 3.5
- chore: Migrate to pub workspaces

## 1.0.0

The first release of Celest V1!

See the release notes for the [celest](https://pub.dev/packages/celest) package for more details.

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

- Use required parameters throughout for better consistency

## 0.3.0

- Initial version.
