# Cedar FFI

A Dart FFI wrapper for the [Cedar](https://www.cedarpolicy.com/en) policy engine.

## Usage

> The library uses Dart's native assets feature to compile and link the Cedar policy engine into any Dart or Flutter application. Since Cedar is written in Rust, usage of this library also requires having the latest stable Rust toolchain installed.

See the [example](example/bin/example.dart) for a simple example of how to use the library.

## Development

The Cedar policy language is written in Rust. To bridge to Dart, some lightweight bindings have been written in [src](src/) which allows Dart to call into the Rust library.

### Generating the FFI bindings

The FFI bindings are generated using the `ffigen` tool. To regenerate the bindings, run the following command:

```sh
$ dart --enable-experiment=native-assets run ffigen
```
