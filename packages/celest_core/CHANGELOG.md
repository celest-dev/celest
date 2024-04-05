## 0.4.0-dev.2

- Migrate to `package:native_storage`

## 0.4.0-dev.1

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
