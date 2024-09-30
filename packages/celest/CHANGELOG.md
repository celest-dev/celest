## 0.5.0-dev.2

## 0.5.0-dev.1

- chore: Bump dependencies

## 0.5.0-dev.0

- feat: Add social sign-in support
- fix: Allow `null` for `@httpQuery` and `@httpHeader` parameters, defaulting to the parameter name.
- chore: Migrate to new Cloud API

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
