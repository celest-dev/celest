import 'package:celest_cli/pub/pub_exceptions.dart';
import 'package:celest_cli/pub/pub_ignore.dart';
import 'package:celest_cli/pub/pub_source.dart';
import 'package:celest_cli/src/context.dart';
import 'package:file/file.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

/// A reference to a [Package], but not any particular version(s) of it.
///
/// It knows the [name] of a package and a [Description] that is connected
/// with a certain [Source]. This is what you need for listing available
/// versions of a package. See [SystemCache.getVersions].
class PackageRef {
  /// Creates a reference to a package with the given [name], and
  /// [description].
  PackageRef(this.name, this.description);
  final String name;
  final Description description;
  bool get isRoot => description is RootDescription;
  Source get source => description.source;

  /// Creates a reference to the given root package.
  static PackageRef root(Package package) =>
      PackageRef(package.name, RootDescription(package));

  @override
  String toString([PackageDetail? detail]) {
    detail ??= PackageDetail.defaults;
    if (isRoot) return name;

    final buffer = StringBuffer(name);
    if (detail.showSource ?? description is! HostedDescription) {
      buffer.write(' from ${description.source}');
      if (detail.showDescription) {
        buffer.write(' ${description.format()}');
      }
    }

    return buffer.toString();
  }

  PackageRange withConstraint(VersionConstraint constraint) =>
      PackageRange(this, constraint);

  @override
  bool operator ==(Object other) =>
      other is PackageRef &&
      name == other.name &&
      description == other.description;

  @override
  int get hashCode => Object.hash(name, description);
}

/// A reference to a specific version of a package.
///
/// A package ID contains enough information to correctly retrieve the package.
///
/// It's possible for multiple distinct package IDs to point to different
/// packages that have identical contents. For example, the same package may be
/// available from multiple sources. As far as Pub is concerned, those packages
/// are different.
///
/// Note that a package ID's [description] field is a [ResolvedDescription]
/// while [PackageRef.description] and [PackageRange.description] are
/// [Description]s.
class PackageId {
  /// Creates an ID for a package with the given [name], [source], [version],
  /// and [description].
  ///
  /// Since an ID's description is an implementation detail of its source, this
  /// should generally not be called outside of [Source] subclasses.
  PackageId(this.name, this.version, this.description);
  final String name;
  final Version version;
  final ResolvedDescription description;
  bool get isRoot => description is ResolvedRootDescription;
  Source get source => description.description.source;

  /// Creates an ID for the given root package.
  static PackageId root(Package package) => PackageId(
        package.name,
        package.version,
        ResolvedRootDescription(RootDescription(package)),
      );

  @override
  int get hashCode => Object.hash(name, version, description);

  @override
  bool operator ==(Object other) =>
      other is PackageId &&
      name == other.name &&
      version == other.version &&
      description == other.description;

  /// Returns a [PackageRange] that allows only [version] of this package.
  PackageRange toRange() => PackageRange(toRef(), version);

  PackageRef toRef() => PackageRef(name, description.description);

  @override
  String toString([PackageDetail? detail]) {
    detail ??= PackageDetail.defaults;

    final buffer = StringBuffer(name);
    if (detail.showVersion ?? !isRoot) buffer.write(' $version');

    if (!isRoot &&
        (detail.showSource ?? description is! ResolvedHostedDescription)) {
      buffer.write(' from ${description.description.source}');
      if (detail.showDescription) {
        buffer.write(' ${description.format()}');
      }
    }

    return buffer.toString();
  }
}

/// A reference to a constrained range of versions of one package.
///
/// This is represented as a [PackageRef] and a [VersionConstraint].
class PackageRange {
  /// Creates a reference to package with the given [name], [source],
  /// [constraint], and [description].
  ///
  /// Since an ID's description is an implementation detail of its source, this
  /// should generally not be called outside of [Source] subclasses.
  PackageRange(this._ref, this.constraint);
  final PackageRef _ref;

  /// The allowed package versions.
  final VersionConstraint constraint;

  String get name => _ref.name;
  Description get description => _ref.description;
  bool get isRoot => _ref.isRoot;
  Source get source => _ref.source;

  /// Creates a range that selects the root package.
  static PackageRange root(Package package) =>
      PackageRange(PackageRef.root(package), package.version);

  PackageRef toRef() => _ref;

  @override
  String toString([PackageDetail? detail]) {
    detail ??= PackageDetail.defaults;

    final buffer = StringBuffer(name);
    if (detail.showVersion ?? _showVersionConstraint) {
      buffer.write(' $constraint');
    }

    if (!isRoot && (detail.showSource ?? description is! HostedDescription)) {
      buffer.write(' from ${description.source.name}');
      if (detail.showDescription) {
        buffer.write(' ${description.format()}');
      }
    }
    return buffer.toString();
  }

  /// Whether to include the version constraint in [toString] by default.
  bool get _showVersionConstraint {
    if (isRoot) return false;
    if (!constraint.isAny) return true;
    return description.source.hasMultipleVersions;
  }

  /// Returns a copy of [this] with the same semantics, but with a `^`-style
  /// constraint if possible.
  PackageRange withTerseConstraint() {
    if (constraint is! VersionRange) return this;
    if (constraint.toString().startsWith('^')) return this;

    final range = constraint as VersionRange;
    if (!range.includeMin) return this;
    if (range.includeMax) return this;
    final min = range.min;
    if (min == null) return this;
    if (range.max == min.nextBreaking.firstPreRelease) {
      return PackageRange(_ref, VersionConstraint.compatibleWith(min));
    } else {
      return this;
    }
  }

  /// Whether [id] satisfies this dependency.
  ///
  /// Specifically, whether [id] refers to the same package as [this] *and*
  /// [constraint] allows `id.version`.
  bool allows(PackageId id) =>
      name == id.name &&
      description == id.description.description &&
      constraint.allows(id.version);

  @override
  int get hashCode => Object.hash(_ref, constraint);

  @override
  bool operator ==(Object other) =>
      other is PackageRange &&
      _ref == other._ref &&
      other.constraint == constraint;
}

/// An enum of different levels of detail that can be used when displaying a
/// terse package name.
class PackageDetail {
  const PackageDetail({
    this.showVersion,
    bool? showSource,
    bool? showDescription,
  })  : showSource = showDescription ?? showSource,
        showDescription = showDescription ?? false;

  /// The default [PackageDetail] configuration.
  static const defaults = PackageDetail();

  /// Whether to show the package version or version range.
  ///
  /// If this is `null`, the version is shown for all packages other than root
  /// [PackageId]s or [PackageRange]s with `git` or `path` sources and `any`
  /// constraints.
  final bool? showVersion;

  /// Whether to show the package source.
  ///
  /// If this is `null`, the source is shown for all non-hosted, non-root
  /// packages. It's always `true` if [showDescription] is `true`.
  final bool? showSource;

  /// Whether to show the package description.
  ///
  /// This defaults to `false`.
  final bool showDescription;

  /// Returns a [PackageDetail] with the maximum amount of detail between [this]
  /// and [other].
  PackageDetail max(PackageDetail other) => PackageDetail(
        showVersion: showVersion! || other.showVersion!,
        showSource: showSource! || other.showSource!,
        showDescription: showDescription || other.showDescription,
      );
}

/// A named, versioned, unit of code and resource reuse.
class Package {
  /// Loads the package whose root directory is [packageDir].
  ///
  /// [name] is the expected name of that package (e.g. the name given in the
  /// dependency), or `null` if the package being loaded is the entrypoint
  /// package.
  ///
  /// `pubspec_overrides.yaml` is only loaded if [withPubspecOverrides] is
  /// `true`.
  factory Package.load(
    String? name,
    String dir, {
    bool withPubspecOverrides = false,
  }) {
    final url = p.join(dir, 'pubspec.yaml');
    final pubspec = Pubspec.parse(
      readTextFile(url),
      sourceUrl: p.toUri(url),
    );
    return Package._(dir, pubspec);
  }

  Package._(
    this._dir,
    this.pubspec,
  );

  /// Constructs a package with the given pubspec.
  ///
  /// The package will have no directory associated with it.
  Package.inMemory(this.pubspec) : _dir = null;

  /// Creates a package with [pubspec] located at [dir].
  Package(this.pubspec, String this._dir);

  /// Compares [a] and [b] orders them by name then version number.
  ///
  /// This is normally used as a [Comparator] to pass to sort. This does not
  /// take a package's description or root directory into account, so multiple
  /// distinct packages may order the same.
  static int orderByNameAndVersion(Package a, Package b) {
    final name = a.name.compareTo(b.name);
    if (name != 0) return name;

    return a.version.compareTo(b.version);
  }

  final String? _dir;

  /// The path to the directory containing the package.
  ///
  /// It is an error to access this on an in-memory package.
  String get dir {
    if (isInMemory) {
      throw UnsupportedError(
        'Package directory cannot be used for an in-memory package',
      );
    }

    return _dir!;
  }

  /// An in-memory package can be created for doing a resolution without having
  /// a package on disk. Paths should not be resolved for these.
  bool get isInMemory => _dir == null;

  /// The name of the package.
  String get name => pubspec.name;

  /// The package's version.
  Version get version => pubspec.version!;

  /// The parsed pubspec associated with this package.
  final Pubspec pubspec;

  /// Given a relative path within this package, returns its absolute path.
  ///
  /// This is similar to `p.join(dir, part1, ...)`, except that subclasses may
  /// override it to report that certain paths exist elsewhere than within
  /// [dir].
  String path(
    String? part1, [
    String? part2,
    String? part3,
    String? part4,
    String? part5,
    String? part6,
    String? part7,
  ]) {
    if (isInMemory) {
      throw StateError("Package $name is in-memory and doesn't have paths "
          'on disk.');
    }
    return p.join(dir, part1, part2, part3, part4, part5, part6, part7);
  }

  /// Given an absolute path within this package (such as that returned by
  /// [path] or [listFiles]), returns it relative to the package root.
  String relative(String path) {
    if (isInMemory) {
      throw StateError("Package $name is in-memory and doesn't have paths "
          'on disk.');
    }
    return p.relative(path, from: dir);
  }

  static final _basicIgnoreRules = [
    '.*', // Don't include dot-files.
    '!.htaccess', // Include .htaccess anyways.
    'pubspec.lock',
    '!pubspec.lock/', // We allow a directory called pubspec lock.
    '/pubspec_overrides.yaml',
  ];

  /// Returns a list of files that are considered to be part of this package.
  ///
  /// If [beneath] is passed, this will only return files beneath that path,
  /// which is expected to be relative to the package's root directory. If
  /// [recursive] is true, this will return all files beneath that path;
  /// otherwise, it will only return files one level beneath it.
  ///
  /// This will take .pubignore and .gitignore files into account.
  ///
  /// If [dir] is inside a git repository, all ignore files from the repo root
  /// are considered.
  ///
  /// For each directory a .pubignore takes precedence over a .gitignore.
  ///
  /// Note that the returned paths will be always be below [dir], and will
  /// always start with [dir] (thus always be relative to the current working
  /// directory) or absolute id [dir] is absolute.
  ///
  /// To convert them to paths relative to the package root, use [p.relative].
  List<String> listFiles({String? beneath, bool recursive = true}) {
    // An in-memory package has no files.
    if (isInMemory) return [];

    final packageDir = dir;
    final root = packageDir;
    beneath = p
        .toUri(
          p.normalize(
            p.relative(p.join(packageDir, beneath ?? '.'), from: root),
          ),
        )
        .path;
    if (beneath == './') beneath = '.';
    String resolve(String path) {
      if (platform.isWindows) {
        return p.joinAll([root, ...p.posix.split(path)]);
      }
      return p.join(root, path);
    }

    return Ignore.listFiles(
      beneath: beneath,
      listDir: (dir) {
        var contents = fileSystem.directory(resolve(dir)).listSync();
        if (!recursive) {
          contents = contents.where((entity) => entity is! Directory).toList();
        }
        return contents.map((entity) {
          if (linkExists(entity.path)) {
            final target = fileSystem.link(entity.path).targetSync();
            if (dirExists(entity.path)) {
              throw DataException(
                '''Pub does not support publishing packages with directory symlinks: `${entity.path}`.''',
              );
            }
            if (!fileExists(entity.path)) {
              throw DataException(
                '''Pub does not support publishing packages with non-resolving symlink: `${entity.path}` => `$target`.''',
              );
            }
          }
          final relative = p.relative(entity.path, from: root);
          if (platform.isWindows) {
            return p.posix.joinAll(p.split(relative));
          }
          return relative;
        });
      },
      ignoreForDir: (dir) {
        final pubIgnore = resolve('$dir/.pubignore');
        final gitIgnore = resolve('$dir/.gitignore');
        final ignoreFile = fileExists(pubIgnore)
            ? pubIgnore
            : (fileExists(gitIgnore) ? gitIgnore : null);

        final rules = [
          if (dir == beneath) ..._basicIgnoreRules,
          if (ignoreFile != null) readTextFile(ignoreFile),
        ];
        return rules.isEmpty
            ? null
            : Ignore(
                rules,
                onInvalidPattern: (pattern, exception) {},
                // Ignore case on macOS and Windows, because `git clone` and
                // `git init` will set `core.ignoreCase = true` in the local
                // local `.git/config` file for the repository.
                //
                // So on Windows and macOS most users will have case-insensitive
                // behavior with `.gitignore`, hence, it seems reasonable to do
                // the same when we interpret `.gitignore` and `.pubignore`.
                //
                // There are cases where a user may have case-sensitive behavior
                // with `.gitignore` on Windows and macOS:
                //
                //  (A) The user has manually overwritten the repository
                //      configuration setting `core.ignoreCase = false`.
                //
                //  (B) The git-clone or git-init command that create the
                //      repository did not deem `core.ignoreCase = true` to be
                //      appropriate. Documentation for [git-config]][1] implies
                //      this might depend on whether or not the filesystem is
                //      case sensitive:
                //      > If true, this option enables various workarounds to
                //      > enable Git to work better on filesystems that are not
                //      > case sensitive, like FAT.
                //      > ...
                //      > The default is false, except git-clone[1] or
                //      > git-init[1] will probe and set core.ignoreCase true
                //      > if appropriate when the repository is created.
                //
                // In either case, it seems likely that users on Windows and
                // macOS will prefer case-insensitive matching. We specifically
                // know that some tooling will generate `.PDB` files instead of
                // `.pdb`, see: [#3003][2]
                //
                // [1]: https://git-scm.com/docs/git-config/2.14.6#Documentation/git-config.txt-coreignoreCase
                // [2]: https://github.com/dart-lang/pub/issues/3003
                ignoreCase: platform.isMacOS || platform.isWindows,
              );
      },
      isDir: (dir) => dirExists(resolve(dir)),
    ).map(resolve).toList();
  }
}

/// Determines if a file or directory exists at [path].
bool entryExists(String path) =>
    dirExists(path) || fileExists(path) || linkExists(path);

/// Returns whether [link] exists on the file system.
///
/// This returns `true` for any symlink, regardless of what it points at or
/// whether it's broken.
bool linkExists(String link) => fileSystem.link(link).existsSync();

/// Returns whether [file] exists on the file system.
///
/// This returns `true` for a symlink only if that symlink is unbroken and
/// points to a file.
bool fileExists(String file) => fileSystem.file(file).existsSync();

/// Returns whether [dir] exists on the file system.
///
/// This returns `true` for a symlink only if that symlink is unbroken and
/// points to a directory.
bool dirExists(String dir) => fileSystem.directory(dir).existsSync();

/// Reads the contents of the text file [file].
String readTextFile(String file) => fileSystem.file(file).readAsStringSync();
