## 1.0.0

The first release of Celest V1!

See the release notes for the [celest](https://pub.dev/packages/celest) package for more details.

## 0.4.2

- feat: Add support for event streaming via SSE/WebSockets

## 0.4.1

- chore(core): Deserialize errors returned from backend

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

## 0.3.2

- Broaden `package:web` constraint to `>=0.4.0 <0.6.0` to improve compatibility with package ecosystem

## 0.3.1

- Fix secure storage issues on Android and Linux

## 0.3.0

- Adds `SecureStorage` interface for storage of sensitive data in the platform keychain
- Adds core Auth types and interfaces

## 0.2.1

- Overrides `toString` for `CloudException` types.

## 0.2.0

- Bumps minimum Dart SDK to 3.3
- Adds `JsonValue` hierarchy for representing JSON primitives safely
- Adds `Serializer.define` for creating serializers from functions
- Adds `TypeToken` to enable serialization of extension types
- Make `SerializationException` implement `BadRequestException`

## 0.1.1

- Update README
- Improve error message of `SerializationException`

## 0.1.0

- Initial version.
