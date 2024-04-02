# platform_storage

Provides a unified API for accessing platform-native storage functionality, such as the iOS Keychain and Android SharedPreferences.
Sync and async APIs are provided for all storage operations, where asynchronous APIs use an `Isolate` to perform the operation in 
a background thread.

> See [Web support](#Web) below for more info on how this package behaves in a browser environment.

## `PlatformStorage`

All implementations conform to the `PlatformStorage` interface, which provides a simple API for reading and writing key-value pairs.

There are two flavors of `PlatformStorage` currently: `PlatformLocalStorage` and `PlatformSecureStorage`. Both are constructed with
a required `namespace` parameter and optional `scope`. The `namespace` represents the isolation boundary of the storage values, while
the `scope` is used to separate storage data between different parts of the app,

It is recommended to use your application or bundle identifier as the `namespace`.

### `PlatformLocalStorage`

The local storage APIs are useful for storing non-sensitive data that should persist across app restarts and be deleted alongside the app.

The platform implementations for `PlatformLocalStorage` are:
- **iOS/macOS**: The `UserDefaults` API with a [suite name](https://developer.apple.com/documentation/foundation/nsuserdefaults/1409957-initwithsuitename#discussion) of `namespace<.scope>`.
- **Android**: The `SharedPreferences` API with a [name](https://developer.android.com/reference/android/content/Context.html#getSharedPreferences(java.lang.String,%20int)) of `namespace<.scope>`.
- **Linux**: The `gsettings` API with a schema path of `namespace<.scope>`.
- **Windows**: The `Windows.Storage.ApplicationData.Current.LocalSettings` API with a container name of `namespace<.scope>`.
