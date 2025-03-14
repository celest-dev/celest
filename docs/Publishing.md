# Publishing Celest

Celest is composed of a set of runtime packages, and the CLI. The packages are interdependent on each other and the CLI is
dependent on the core packages.

To publish a new version of Celest, ensure the following steps are performed in order:

1. Ensure all `pubspec.yaml` and `CHANGELOG.md` have been updated with non `-wip` versioning.
2. Publish all runtime packages in transitively-dependent order. 

   For example, since all packages depend on `celest_core`, it must be published first.

3. Update [../apps/cli/lib/src/version.dart]() with the new CLI version.
4. Publish the CLI package.

## Versioning

Runtime packages and the CLI may be published independent of each other. For example, if the CLI and runtime packages are 
all currently at version `1.1.0` and a change needs to be made in `celest_core`, it is okay to publish only `celest_core` so
long as the minor/major version is not changed. Thus, `celest_core` may be published at `1.1.1` or `1.1.0+1` depending on the
change that's needed.

Put another way, the goal is to align the CLI and all runtime packages at the minor version number. Since minor/major version
changes indicate non-trivial changes, it is helpful to be able to refer to these changesets collectively by a single number, 
e.g. "Celest 1.1".
