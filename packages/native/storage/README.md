# native_storage

Provides a unified API for accessing platform-native storage functionality, such as the iOS Keychain and Android SharedPreferences.
Sync and async APIs are provided for all storage operations, where asynchronous APIs use an `Isolate` to perform the operation in 
a background thread.

> See [Web support](#Web) below for more info on how this package behaves in a browser environment.

## Storage Types

All implementations conform to the `NativeStorage` interface, which provides a simple API for reading and writing key-value pairs.
There are three variations of `NativeStorage`: `NativeLocalStorage`, `NativeSecureStorage`, and `IsolatedNativeStorage`. 
By default, a `NativeLocalStorage` instance is returned.

### Local Storage

Using a `NativeLocalStorage` instance, you can read/write values to your application's local data storage which are isolated to your
application and persisted across app restarts.

```dart
final storage = NativeStorage();
storage.write('key', 'value');
print(storage.read('key')); // value
```

The local storage APIs are useful for storing non-sensitive data that should persist across app restarts and be deleted alongside the app.

The platform implementations for local `NativeStorage` are:

| Platform | Implementation |
| -------- | -------------- |
| iOS/macOS | [UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults) |
| Android | [SharedPreferences](https://developer.android.com/reference/android/content/SharedPreferences) |
| Linux | JSON file |
| Windows | [Registry](https://learn.microsoft.com/en-us/windows/win32/sysinfo/about-the-registry) |
| Web | [localStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage) |

### Secure Storage

Sometimes you may need to store sensitive data, such as API keys or user credentials, in a way that is more secure than local storage.
In this case, use the `secure` getter on a `NativeStorage` instance to get a secure variation.

```dart
final secureStorage = storage.secure;
secureStorage.write('key', 'value'); // value is encrypted before being stored
print(secureStorage.read('key')); // value
```

The platform implementations for `NativeSecureStorage` are:

| Platform | Implementation |
| -------- | -------------- |
| iOS/macOS | [Keychain](https://developer.apple.com/documentation/security/keychain_services) |
| Android | [EncryptedSharedPreferences](https://developer.android.com/reference/androidx/security/crypto/EncryptedSharedPreferences) |
| Linux | [libsecret](https://wiki.gnome.org/Projects/Libsecret) |
| Windows | [Security and Identity API](https://learn.microsoft.com/en-us/windows/win32/api/dpapi/) |
| Web | In-Memory (See [Web](#Web)) |

### Isolated Storage

The APIs shown above are all synchronous, which means they will block the main thread while reading/writing data. If you need to perform
storage operations in the background, use the `isolated` getter on a `NativeStorage` instance to get an isolated variation.

```dart
final isolatedStorage = storage.isolated;
await isolated.write('key', 'value'); // value is written in a background thread
print(await isolated.read('key')); // value
```

These can be combined to create a secure, isolated storage for example:

```dart
final secureIsolatedStorage = storage.secure.isolated;
await secureIsolatedStorage.write('key', 'value'); // value is encrypted and written in a background thread
print(await secureIsolatedStorage.read); // value
```

The platform implementations for `IsolatedNativeStorage` are the same as the local/secure storage implementations, but the operations 
are performed using an [Isolate](https://api.dart.dev/stable/dart-isolate/Isolate-class.html).

### Web

When running in a browser environment, there is [no way](https://auth0.com/blog/secure-browser-storage-the-facts/) to securely persist
sensitive data. As a result, the `NativeSecureStorage` implementation for web is an in-memory store that does not persist data across
page reloads. The `NativeLocalStorage` implementation for web, however, uses the browser's `localStorage` API for persistence.

The `IsolatedNativeStorage` implementation for web uses the `NativeLocalStorage` implementation, but does not perform calls in a Web Worker.
