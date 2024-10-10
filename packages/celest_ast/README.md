# Celest AST

A structured representation of Celest projects and services.

There are two representations of Celest projects in this package: `Project` and `ResolvedProject`. The Celest CLI manipulates a `Project` model
as it parses and interprets your Celest project. At this stage, there still may be missing pieces--for example, the value of environment variables
which have not been provided yet. Once the CLI has collected the necessary information to piece together all the project components, it transforms
the `Project` model into a `ResolvedProject` which is consumed by Celest Cloud and the Celest runtime. Once a project has been resolved, it contains
all the necessary information to run and deploy as a Celest service.

## Protobufs

The `ResolvedProject` model is available as both a Dart type and a Protobuf message. The Dart type serves to provide a more ergonomic interface for
walking and manipulating the project model, while the Protobuf message is used for serializing and deserializing the project model across languages
and across the wire.

To regenerate the protobufs, run `make` from the package root.
