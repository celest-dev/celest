# cedar

Core types and interfaces of the [Cedar](https://www.cedarpolicy.com/en) policy language in Dart.

Cedar is a policy language for defining and enforcing access control policies in a declarative way. It is used in [Celest](https://celest.dev) for ensuring that only authorized users meeting certain criteria can access your backend.

The actual implementation of the Cedar engine is in [cedar_ffi](https://pub.dev/packages/cedar_ffi), which uses FFI and Dart's native assets feature to bind to the Rust implementation of Cedar. This package only holds the Dart AST representation and is separate from `package:cedar_ffi` so that the types can be used without bundling the native assets of `package:cedar_ffi`.
