import 'dart:convert';
import 'dart:typed_data';

import 'package:celest_cli/pub/language_version.dart';
import 'package:celest_cli/pub/pub_exceptions.dart';
import 'package:celest_cli/pub/pub_package.dart';
import 'package:celest_cli/pub/pubspec_lock.dart';
import 'package:celest_cli/src/context.dart';
import 'package:convert/convert.dart';
import 'package:meta/meta.dart';
import 'package:pub_semver/pub_semver.dart';

/// The available sources.
final _sources = Map<String, Source>.fromIterable([
  HostedSource.instance,
  GitSource.instance,
  PathSource.instance,
  SdkSource.instance,
], key: (source) => (source as Source).name);

final defaultSource = HostedSource.instance;

Source sources(String? name) {
  return name == null ? defaultSource : (_sources[name] ?? UnknownSource(name));
}

/// A source from which to get packages.
///
/// Each source has many packages that it looks up using [PackageRef]s.
///
/// Other sources are *cached* sources. These extend [CachedSource]. When a
/// package needs a dependency from a cached source, it is first installed in
/// the [SystemCache] and then acquired from there.
///
/// Methods on [Source] that depends on the cache will take it as an argument.
///
/// ## Types of description
///
/// * Pubspec.yaml descriptions. These are included in pubspecs and usually
///   written by hand. They're typically more flexible in the formats they allow
///   to optimize for ease of authoring.
///
/// * [Description]s. These are the descriptions in [PackageRef]s and
///   [PackageRange]. They're parsed directly from user descriptions using
///   [Source.parseRef]. Internally relative paths are stored absolute, such
///   they can be serialized elsewhere.
///
/// * [ResolvedDescription]s. These are the descriptions in [PackageId]s, which
///   uniquely identify and provide the means to locate the concrete code of a
///   package. They may contain additional expensive-to-compute information
///   relative to the corresponding reference descriptions. These are the
///   descriptions stored in lock files. (This is mainly relevant for the
///   resolved-ref of GitDescriptions.)
abstract class Source {
  /// The name of the source.
  ///
  /// Should be lower-case, suitable for use in a filename, and unique across
  /// all sources.
  String get name;

  /// Whether this source can choose between multiple versions of the same
  /// package during version solving.
  ///
  /// Defaults to `false`.
  bool get hasMultipleVersions => false;

  /// Parses a [PackageRef] from a name and a user-provided [description].
  ///
  /// When a [Pubspec] is parsed, it reads in the description for each
  /// dependency. It is up to the dependency's [Source] to determine how that
  /// should be interpreted. This will be called during parsing to validate that
  /// the given [description] is well-formed according to this source, and to
  /// give the source a chance to canonicalize the description. For simple
  /// hosted dependencies like `foo:` or `foo: ^1.2.3`, the [description] may
  /// also be `null`.
  ///
  /// [containingDir] is the path to the directory of the pubspec where this
  /// description appears. It may be `null` if the description is coming from
  /// some in-memory source (such as pulling down a pubspec from
  /// pub.dev).
  ///
  /// [languageVersion] is the minimum Dart version parsed from the pubspec's
  /// `environment` field. Source implementations may use this parameter to only
  /// support specific syntax for some versions.
  ///
  /// The description in the returned [PackageRef] need bear no resemblance to
  /// the original user-provided description.
  ///
  /// Throws a [FormatException] if the description is not valid.
  PackageRef parseRef(
    String name,
    Object? description, {
    String? containingDir,
    required LanguageVersion languageVersion,
  });

  /// Parses a [PackageId] from a name and a serialized description.
  ///
  /// This only accepts descriptions serialized using [serializeDescription]. It
  /// should not be used with user-authored descriptions.
  ///
  /// [containingDir] is the path to the directory lockfile where this
  /// description appears. It may be `null` if the description is coming from
  /// some in-memory source.
  ///
  /// Throws a [FormatException] if the description is not valid.
  PackageId parseId(
    String name,
    Version version,
    Object? description, {
    String? containingDir,
  });

  /// Returns the source's name.
  @override
  String toString() => name;
}

/// The information needed to get a version-listing of a named package from a
/// [Source].
///
/// For a hosted package this would be the host url.
///
/// For a git package this would be the repo url and a ref and a path inside
/// the repo.
///
/// This is the information that goes into a `pubspec.yaml` dependency together
/// with a version constraint.
abstract class Description {
  Source get source;
  Object? serializeForPubspec({
    required String? containingDir,
    required LanguageVersion languageVersion,
  });

  /// Converts `this` into a human-friendly form to show the user.
  ///
  /// Paths are always relative to current dir.
  String format();

  @override
  @mustBeOverridden
  bool operator ==(Object other) =>
      throw UnimplementedError('Subclasses must override');

  @override
  @mustBeOverridden
  int get hashCode => throw UnimplementedError('Subclasses must override');
}

/// A resolved description is a [Description] plus whatever information you need
/// to lock down a specific version.
///
/// This is currently only relevant for the [GitSource] that resolves the
/// [Description.ref] to a specific commit id in [GitSource.doGetVersions].
///
/// This is the information that goes into a `pubspec.lock` file together with
/// a version number (that is represented by a [PackageId].
abstract class ResolvedDescription {
  ResolvedDescription(this.description);
  final Description description;

  /// When a [LockFile] is serialized, it uses this method to get the
  /// [description] in the right format.
  ///
  /// [containingPath] is the containing directory of the root package.
  Object? serializeForLockfile({required String? containingDir});

  /// Converts `this` into a human-friendly form to show the user.
  ///
  /// Paths are always relative to current dir.
  String format() => description.format();

  @override
  @mustBeOverridden
  bool operator ==(Object other) =>
      throw UnimplementedError('Subclasses must override');

  @override
  @mustBeOverridden
  int get hashCode => throw UnimplementedError('Subclasses must override');
}

/// Metadata about a [PackageId].
class PackageStatus {
  PackageStatus({
    this.isDiscontinued = false,
    this.discontinuedReplacedBy,
    this.isRetracted = false,
    this.advisoriesUpdated,
  });

  /// `null` if not [isDiscontinued]. Otherwise contains the
  /// replacement string provided by the host or `null` if there is no
  /// replacement.
  final String? discontinuedReplacedBy;
  final bool isDiscontinued;
  final bool isRetracted;

  /// The latest point in time at which a security advisory that affects this
  /// package has been synchronized into pub, `null` if this package is not
  /// affected by a security advisory.
  final DateTime? advisoriesUpdated;
}

/// A package source that gets packages from Git repos.
class GitSource extends Source {
  GitSource._();

  static GitSource instance = GitSource._();

  @override
  final name = 'git';

  @override
  PackageRef parseRef(
    String name,
    Object? description, {
    String? containingDir,
    LanguageVersion? languageVersion,
  }) {
    String url;
    String? ref;
    String? path;
    if (description is String) {
      url = description;
    } else if (description is! Map) {
      throw const FormatException(
        'The description must be a Git URL or a map '
        "with a 'url' key.",
      );
    } else {
      final descriptionUrl = description['url'];
      if (descriptionUrl is! String) {
        throw const FormatException(
          "The 'url' field of a description must be a string.",
        );
      }
      url = descriptionUrl;

      final descriptionRef = description['ref'];
      if (descriptionRef is! String?) {
        throw const FormatException(
          "The 'ref' field of the description must be a "
          'string.',
        );
      }
      ref = descriptionRef;

      final descriptionPath = description['path'];
      if (descriptionPath is! String?) {
        throw const FormatException(
          "The 'path' field of the description must be a "
          'string.',
        );
      }
      path = descriptionPath;
    }

    return PackageRef(
      name,
      GitDescription(
        url: url,
        containingDir: containingDir,
        ref: ref,
        path: _validatedPath(path),
      ),
    );
  }

  @override
  PackageId parseId(
    String name,
    Version version,
    Object? description, {
    String? containingDir,
  }) {
    if (description is! Map) {
      throw const FormatException(
        "The description must be a map with a 'url' "
        'key.',
      );
    }

    final ref = description['ref'];
    if (ref is! String?) {
      throw const FormatException(
        "The 'ref' field of the description must be a "
        'string.',
      );
    }

    final resolvedRef = description['resolved-ref'];
    if (resolvedRef is! String) {
      throw const FormatException(
        "The 'resolved-ref' field of the description "
        'must be a string.',
      );
    }

    final url = description['url'];
    if (url is! String) {
      throw const FormatException(
        "The 'url' field of the description "
        'must be a string.',
      );
    }
    return PackageId(
      name,
      version,
      ResolvedGitDescription(
        GitDescription(
          url: url,
          ref: ref,
          path: _validatedPath(description['path']),
          containingDir: containingDir,
        ),
        resolvedRef,
      ),
    );
  }

  /// Throws a [FormatException] if [url] isn't a valid Git URL.
  static _ValidatedUrl _validatedUrl(String url, String? containingDir) {
    var relative = false;
    // If the URL contains an @, it's probably an SSH hostname, which we don't
    // know how to validate.
    if (!url.contains('@')) {
      // Otherwise, we use Dart's URL parser to validate the URL.
      final parsed = Uri.parse(url);
      if (!parsed.hasAbsolutePath) {
        // Relative paths coming from pubspecs that are not on the local file
        // system aren't allowed. This can happen if a hosted or git dependency
        // has a git dependency.
        if (containingDir == null) {
          throw FormatException(
            '"$url" is a relative path, but this '
            'isn\'t a local pubspec.',
          );
        }
        // A relative path is stored internally as absolute resolved relative to
        // [containingPath].
        relative = true;
        url = p.url.normalize(
          p.url.join(
            p.toUri(p.absolute(containingDir)).toString(),
            parsed.toString(),
          ),
        );
      }
    }
    return _ValidatedUrl(url, relative);
  }

  /// Normalizes [path].
  ///
  /// Throws a [FormatException] if [path] isn't a [String] parsing as a
  /// relative URL or `null`.
  ///
  /// A relative url here has:
  /// - non-absolute path
  /// - no scheme
  /// - no authority
  String _validatedPath(dynamic path) {
    path ??= '.';
    if (path is! String) {
      throw const FormatException(
        "The 'path' field of the description must be a "
        'string.',
      );
    }

    // Use Dart's URL parser to validate the URL.
    final parsed = Uri.parse(path);
    if (parsed.hasAbsolutePath ||
        parsed.hasScheme ||
        parsed.hasAuthority ||
        parsed.hasFragment ||
        parsed.hasQuery) {
      throw const FormatException(
        "The 'path' field of the description must be a relative path URL.",
      );
    }
    if (!p.url.isWithin('.', path) && !p.url.equals('.', path)) {
      throw const FormatException(
        "The 'path' field of the description must not reach outside the "
        'repository.',
      );
    }
    return p.url.normalize(parsed.toString());
  }
}

class GitDescription extends Description {
  GitDescription._({
    required this.url,
    required this.relative,
    required String? ref,
    required String? path,
  }) : ref = ref ?? 'HEAD',
       path = path ?? '.';

  factory GitDescription({
    required String url,
    required String? ref,
    required String? path,
    required String? containingDir,
  }) {
    final validatedUrl = GitSource._validatedUrl(url, containingDir);
    return GitDescription._(
      url: validatedUrl.url,
      relative: validatedUrl.wasRelative,
      ref: ref,
      path: path,
    );
  }

  /// The url of the repo of this package.
  ///
  /// If the url was relative in the pubspec.yaml it will be resolved relative
  /// to the pubspec location, and stored here as an absolute file url, and
  /// [relative] will be true.
  ///
  /// This will not always parse as a [Uri] due the fact that `Uri.parse` does not allow strings of
  /// the form: 'git@github.com:dart-lang/pub.git'.
  final String url;

  /// `true` if [url] was parsed from a relative url.
  final bool relative;

  /// The git ref to resolve for finding the commit.
  final String ref;

  /// Relative path of the package inside the git repo.
  ///
  /// Represented as a relative url.
  final String path;

  @override
  String format() {
    var result =
        '${prettyUri(url)} at '
        '$ref';
    if (path != '.') result += ' in $path';
    return result;
  }

  @override
  Object? serializeForPubspec({
    required String? containingDir,
    required LanguageVersion languageVersion,
  }) {
    final relativeUrl =
        containingDir != null && relative
            ? p.url.relative(
              url,
              from: p.toUri(p.normalize(p.absolute(containingDir))).toString(),
            )
            : url;
    if (ref == 'HEAD' && path == '.') return relativeUrl;
    return {
      'url': relativeUrl,
      if (ref != 'HEAD') 'ref': ref,
      if (path != '.') 'path': path,
    };
  }

  @override
  GitSource get source => GitSource.instance;

  @override
  bool operator ==(Object other) {
    return other is GitDescription &&
        other.url == url &&
        other.ref == ref &&
        other.path == path;
  }

  GitDescription withRef(String newRef) =>
      GitDescription._(url: url, relative: relative, ref: newRef, path: path);

  @override
  int get hashCode => Object.hash(url, ref, path);

  // Similar in intend to [p.prettyUri] but does not fail if the input doesn't
  // parse with [Uri.parse].
  static String prettyUri(String url) {
    // HACK: Working around the fact that `Uri.parse` does not allow strings of
    // the form: 'git@github.com:dart-lang/pub.git'.
    final parsedAsUri = Uri.tryParse(url);
    if (parsedAsUri == null) {
      return url;
    }
    return p.prettyUri(url);
  }
}

class ResolvedGitDescription extends ResolvedDescription {
  ResolvedGitDescription(GitDescription super.description, this.resolvedRef);
  @override
  GitDescription get description => super.description as GitDescription;

  final String resolvedRef;

  @override
  String format() {
    var result =
        '${GitDescription.prettyUri(description.url)} at '
        '${resolvedRef.substring(0, 6)}';
    if (description.path != '.') result += ' in ${description.path}';
    return result;
  }

  @override
  Object? serializeForLockfile({required String? containingDir}) {
    final url =
        description.relative && containingDir != null
            ? p.url.relative(
              description.url,
              from: Uri.file(p.absolute(containingDir)).toString(),
            )
            : description.url;
    return {
      'url': url,
      'ref': description.ref,
      'resolved-ref': resolvedRef,
      'path': description.path,
    };
  }

  @override
  bool operator ==(Object other) {
    return other is ResolvedGitDescription &&
        other.description == description &&
        other.resolvedRef == resolvedRef;
  }

  @override
  int get hashCode => Object.hash(description, resolvedRef);
}

class _ValidatedUrl {
  _ValidatedUrl(this.url, this.wasRelative);
  final String url;
  final bool wasRelative;
}

const contentHashesDocumentationUrl = 'https://dart.dev/go/content-hashes';

/// Validates and normalizes a [hostedUrl] which is pointing to a pub server.
///
/// A [hostedUrl] is a URL pointing to a _hosted pub server_ as defined by the
/// [repository-spec-v2][1]. The default value is `pub.dev`, and can be
/// overwritten using `PUB_HOSTED_URL`. It can also specified for individual
/// hosted-dependencies in `pubspec.yaml`, and for the root package using the
/// `publish_to` key.
///
/// The [hostedUrl] is always normalized to a [Uri] with path that ends in slash
/// unless the path is merely `/`, in which case we normalize to the bare
/// domain.
///
/// We change `https://pub.dartlang.org` to `https://pub.dev`, this  maintains
/// backwards compatibility with `pubspec.lock`-files which contain
/// `https://pub.dartlang.org`.
///
/// Throws [FormatException] if there is anything wrong with [hostedUrl].
///
/// [1]: ../../../doc/repository-spec-v2.md
Uri validateAndNormalizeHostedUrl(String hostedUrl) {
  Uri u;
  try {
    u = Uri.parse(hostedUrl);
  } on FormatException catch (e) {
    throw FormatException('invalid url: ${e.message}', e.source, e.offset);
  }
  if (!u.hasScheme || (u.scheme != 'http' && u.scheme != 'https')) {
    throw FormatException('url scheme must be https:// or http://', hostedUrl);
  }
  if (!u.hasAuthority || u.host == '') {
    throw FormatException('url must have a hostname', hostedUrl);
  }
  if (u.userInfo != '') {
    throw FormatException('user-info is not supported in url', hostedUrl);
  }
  if (u.hasQuery) {
    throw FormatException('querystring is not supported in url', hostedUrl);
  }
  if (u.hasFragment) {
    throw FormatException('fragment is not supported in url', hostedUrl);
  }
  u = u.normalizePath();
  // If we have a path of only `/`
  if (u.path == '/') {
    u = u.replace(path: '');
  }
  // If there is a path, and it doesn't end in a slash we normalize to slash
  if (u.path.isNotEmpty && !u.path.endsWith('/')) {
    u = u.replace(path: '${u.path}/');
  }
  // pub.dev and pub.dartlang.org are identical.
  //
  // We rewrite here to avoid caching both, and to avoid having different
  // credentials for these two.
  //
  // Changing this to pub.dev raises the following concerns:
  //
  //  1. It would blow through users caches.
  //  2. It would cause conflicts for users checking pubspec.lock into git, if using
  //     different versions of the dart-sdk / pub client.
  //  3. It might cause other problems (investigation needed) for pubspec.lock across
  //     different versions of the dart-sdk / pub client.
  //  4. It would expand the API surface we're committed to supporting long-term.
  //
  // Clearly, a bit of investigation is necessary before we update this to
  // pub.dev, it might be attractive to do next time we change the server API.
  if (u == Uri.parse('https://pub.dartlang.org')) {
    u = Uri.parse('https://pub.dev');
  }
  return u;
}

/// A package source that gets packages from a package hosting site that uses
/// the same API as pub.dev.
class HostedSource extends Source {
  HostedSource._();
  static HostedSource instance = HostedSource._();

  @override
  final name = 'hosted';
  @override
  final hasMultipleVersions = true;

  static String pubDevUrl = 'https://pub.dev';
  static String pubDartlangUrl = 'https://pub.dartlang.org';

  static bool isPubDevUrl(String url) {
    final parsedUrl = Uri.parse(url);
    if (parsedUrl.scheme != 'http' && parsedUrl.scheme != 'https') {
      // A non http(s) url is not pub.dev.
      return false;
    }
    if (parsedUrl.host.isEmpty) {
      // The empty host is not pub.dev.
      return false;
    }
    final origin = parsedUrl.origin;
    return origin == pubDevUrl || origin == pubDartlangUrl;
  }

  static bool isFromPubDev(PackageId id) {
    final description = id.description.description;
    return description is HostedDescription && isPubDevUrl(description.url);
  }

  /// Gets the default URL for the package server for hosted dependencies.
  late final String defaultUrl = () {
    // Changing this to pub.dev raises the following concerns:
    //
    //  1. It would blow through users caches.
    //  2. It would cause conflicts for users checking pubspec.lock into git, if using
    //     different versions of the dart-sdk / pub client.
    //  3. It might cause other problems (investigation needed) for pubspec.lock across
    //     different versions of the dart-sdk / pub client.
    //  4. It would expand the API surface we're committed to supporting long-term.
    //
    // Clearly, a bit of investigation is necessary before we update this to
    // pub.dev, it might be attractive to do next time we change the server API.
    try {
      const defaultHostedUrl = 'https://pub.dev';
      return validateAndNormalizeHostedUrl(
        platform.environment['PUB_HOSTED_URL'] ?? defaultHostedUrl,
      ).toString();
    } on FormatException catch (e) {
      throw ConfigException(
        'Invalid `PUB_HOSTED_URL="${e.source}"`: ${e.message}',
      );
    }
  }();

  /// Whether extra metadata headers should be sent for HTTP requests to a given
  /// [url].
  static bool shouldSendAdditionalMetadataFor(Uri url) {
    if (!HostedSource.isPubDevUrl(url.toString())) return false;

    if (platform.environment.containsKey('CI') &&
        platform.environment['CI'] != 'false') {
      return false;
    }

    return true;
  }

  /// Returns a reference to a hosted package named [name].
  ///
  /// If [url] is passed, it's the URL of the pub server from which the package
  /// should be downloaded. [url] will be normalized and validated using
  /// [validateAndNormalizeHostedUrl]. This can throw a [FormatException].
  PackageRef refFor(String name, {String? url}) {
    final d = HostedDescription(name, url ?? defaultUrl);
    return PackageRef(name, d);
  }

  /// Ensures that [description] is a valid hosted package description.
  ///
  /// Simple hosted dependencies only consist of a plain string, which is
  /// resolved against the default host. In this case, [description] will be
  /// null.
  ///
  /// Hosted dependencies may also specify a custom host from which the package
  /// is fetched. There are two syntactic forms of those dependencies:
  ///
  ///  1. With an url and an optional name in a map: `hosted: {url: <url>}`
  ///  2. With a direct url: `hosted: <url>`
  @override
  PackageRef parseRef(
    String name,
    Object? description, {
    String? containingDir,
    required LanguageVersion languageVersion,
  }) {
    return PackageRef(
      name,
      _parseDescription(name, description, languageVersion),
    );
  }

  @override
  PackageId parseId(
    String name,
    Version version,
    Object? description, {
    String? containingDir,
  }) {
    // Old pub versions only wrote `description: <pkg>` into the lock file.
    if (description is String) {
      if (description != name) {
        throw const FormatException(
          'The description should be the same as the name',
        );
      }
      return PackageId(
        name,
        version,
        ResolvedHostedDescription(
          HostedDescription(name, defaultUrl),
          sha256: null,
        ),
      );
    }
    if (description is! Map) {
      throw const FormatException(
        'The description should be a string or a map.',
      );
    }
    final url = description['url'];
    if (url is! String) {
      throw const FormatException('The url should be a string.');
    }
    final sha256 = description['sha256'];
    if (sha256 != null && sha256 is! String) {
      throw const FormatException('The sha256 should be a string.');
    }
    final foundName = description['name'];
    if (foundName is! String) {
      throw const FormatException('The name should be a string.');
    }
    if (foundName != name) {
      throw FormatException('The name should be $name');
    }
    return PackageId(
      name,
      version,
      ResolvedHostedDescription(
        HostedDescription(name, url),
        sha256: _parseContentHash(sha256 as String?),
      ),
    );
  }

  /// Decodes a sha256 hash from a lock-file or package-listing.
  /// It is expected to be a hex-encoded String of length 64.
  ///
  /// Throws a [FormatException] if the string cannot be decoded.
  Uint8List? _parseContentHash(String? encoded) {
    if (encoded == null) return null;
    if (encoded.length != 64) {
      throw const FormatException('Content-hash has incorrect length');
    }
    try {
      return hex.decode(encoded) as Uint8List;
    } on FormatException catch (e) {
      return throw FormatException(
        'Badly formatted content-hash: ${e.message}',
      );
    }
  }

  /// Parses the description for a package.
  ///
  /// If the package parses correctly, this returns a (name, url) pair. If not,
  /// this throws a descriptive FormatException.
  HostedDescription _parseDescription(
    String packageName,
    Object? description,
    LanguageVersion languageVersion,
  ) {
    if (description == null) {
      // Simple dependency without a `hosted` block, use the default server.
      return HostedDescription(packageName, defaultUrl);
    }

    final canUseShorthandSyntax = languageVersion.supportsShorterHostedSyntax;

    if (description is String) {
      // Old versions of pub (pre Dart 2.15) interpret `hosted: foo` as
      // `hosted: {name: foo, url: <default>}`.
      // For later versions, we treat it as `hosted: {name: <inferred>,
      // url: foo}` if a user opts in by raising their min SDK environment.
      //
      // Since the old behavior is very rarely used and we want to show a
      // helpful error message if the new syntax is used without raising the SDK
      // environment, we throw an error if something that looks like a URI is
      // used as a package name.
      if (canUseShorthandSyntax) {
        return HostedDescription(packageName, description);
      } else {
        if (_looksLikePackageName.hasMatch(description)) {
          // Valid use of `hosted: package` dependency with an old SDK
          // environment.
          return HostedDescription(description, defaultUrl);
        } else {
          throw FormatException(
            'Using `hosted: <url>` is only supported with a minimum SDK '
            'constraint of ${LanguageVersion.firstVersionWithShorterHostedSyntax}.',
          );
        }
      }
    }

    if (description is! Map) {
      throw const FormatException(
        'The description must be a package name or map.',
      );
    }

    var name = description['name'];
    if (canUseShorthandSyntax) name ??= packageName;

    if (name is! String) {
      throw FormatException(
        "The 'name' key must have a string value without "
        'a minimum Dart SDK constraint of ${LanguageVersion.firstVersionWithShorterHostedSyntax}.0 or higher.',
      );
    }

    final u = description['url'];
    if (u != null && u is! String) {
      throw const FormatException("The 'url' key must be a string value.");
    }
    final url = u ?? defaultUrl;

    return HostedDescription(name, url as String);
  }

  static final RegExp _looksLikePackageName = RegExp(
    r'^[a-zA-Z_]+[a-zA-Z0-9_]*$',
  );
}

/// The [PackageName.description] for a [HostedSource], storing the package name
/// and resolved URI of the package server.
class HostedDescription extends Description {
  HostedDescription._(this.packageName, this.url);

  // This can be used to construct a description with any specific url.
  factory HostedDescription.raw(String packageName, String url) =>
      HostedDescription._(packageName, url);

  factory HostedDescription(String packageName, String url) =>
      HostedDescription._(
        packageName,
        validateAndNormalizeHostedUrl(url).toString(),
      );
  final String packageName;
  final String url;

  @override
  int get hashCode => Object.hash(packageName, url);

  @override
  bool operator ==(Object other) {
    return other is HostedDescription &&
        other.packageName == packageName &&
        other.url == url;
  }

  @override
  String format() => 'on $url';

  @override
  Object? serializeForPubspec({
    required String? containingDir,
    required LanguageVersion languageVersion,
  }) {
    if (url == source.defaultUrl) {
      return null;
    }
    if (languageVersion >=
        LanguageVersion.firstVersionWithShorterHostedSyntax) {
      return url;
    }
    return {'url': url, 'name': packageName};
  }

  @override
  HostedSource get source => HostedSource.instance;
}

class ResolvedHostedDescription extends ResolvedDescription {
  ResolvedHostedDescription(
    HostedDescription super.description, {
    required this.sha256,
  });
  @override
  HostedDescription get description => super.description as HostedDescription;

  /// The content hash of the package archive (the `tar.gz` file) of the
  /// PackageId described by this.
  ///
  /// This can be obtained in several ways:
  /// * Reported from a server in the archive_sha256 field.
  ///   (will be null if the server does not report this.)
  /// * Obtained from a pubspec.lock
  ///   (will be null for legacy lock-files).
  /// * Read from the <PUB_CACHE>/hosted-hashes/<server>/<package>-<version>.sha256 file.
  ///   (will be null if the file doesn't exist for corrupt or legacy caches).
  final Uint8List? sha256;

  @override
  Object? serializeForLockfile({required String? containingDir}) {
    final hash = sha256;
    return {
      'name': description.packageName,
      'url': description.url,
      if (hash != null) 'sha256': hex.encode(hash),
    };
  }

  @override
  // We do not include the sha256 in the hashCode because of the equality
  // semantics.
  int get hashCode => description.hashCode;

  @override
  bool operator ==(Object other) {
    return other is ResolvedHostedDescription &&
        other.description == description &&
        // A [sha256] of `null` means that we don't know the hash yet.
        // Therefore we have to assume it is equal to any known value.
        (sha256 == null ||
            other.sha256 == null ||
            fixedTimeBytesEquals(sha256, other.sha256));
  }

  ResolvedHostedDescription withSha256(Uint8List? newSha256) =>
      ResolvedHostedDescription(description, sha256: newSha256);
}

/// Information about a security advisory affecting a package. The information
/// is retrieved from /api/packages/$package/advisories
class Advisory {
  Advisory(this.id, this.affectedVersions, this.aliases);
  String id;
  List<String> affectedVersions;
  List<String> aliases;
}

/// Compares two lists. If the lists have equal length this comparison will
/// iterate all elements, thus taking a fixed amount of time making timing
/// attacks harder.
bool fixedTimeBytesEquals(List<int>? a, List<int>? b) {
  if (a == null || b == null) return a == b;
  if (a.length != b.length) return false;
  var e = 0;
  for (var i = 0; i < a.length; i++) {
    e |= a[i] ^ b[i];
  }
  return e == 0;
}

/// Replace each instance of [matcher] in [source] with the return value of
/// [fn].
String replace(String source, Pattern matcher, String Function(Match) fn) {
  final buffer = StringBuffer();
  var start = 0;
  for (final match in matcher.allMatches(source)) {
    buffer.write(source.substring(start, match.start));
    start = match.end;
    buffer.write(fn(match));
  }
  buffer.write(source.substring(start));
  return buffer.toString();
}

/// A package [Source] that gets packages from a given local file path.
class PathSource extends Source {
  PathSource._();
  static PathSource instance = PathSource._();

  @override
  final name = 'path';

  // /// Returns a reference to a path package named [name] at [path].
  // PackageRef<PathDescription> refFor(String name, String path) {
  //   if (p.isRelative(path)) {
  //     PackageRef(name, {'path':p.absolute(path), 'relative': p.isRelative(path)});
  //   }
  //   return PackageRef(name, {'path': path, 'relative': p.isRelative(path)});
  // }
  //{name: myapp, dev_dependencies: {foo: 1.2.2}, dependency_overrides: {foo: {path: ../foo}}, environment: {sdk: >=0.1.2 <1.0.0}}
  //{name: myapp, dev_dependencies: {foo: ^1.2.2}, dependency_overrides: {foo: {path: ../foo}}, environment: {sdk: >=0.1.2 <1.0.0}}
  /// Returns an ID for a path package with the given [name] and [version] at
  /// [path].
  ///
  /// If [path] is relative it is resolved relative to [relativeTo]
  PackageId idFor(
    String name,
    Version version,
    String path,
    String relativeTo,
  ) {
    return PackageId(
      name,
      version,
      ResolvedPathDescription(
        PathDescription(p.join(relativeTo, path), p.isRelative(path)),
      ),
    );
  }

  /// Parses a path dependency.
  ///
  /// This takes in a path string and returns a map. The "path" key will be the
  /// original path but resolved relative to the containing path. The
  /// "relative" key will be `true` if the original path was relative.
  @override
  PackageRef parseRef(
    String name,
    Object? description, {
    String? containingDir,
    LanguageVersion? languageVersion,
  }) {
    if (description is! String) {
      throw const FormatException('The description must be a path string.');
    }
    var dir = description;
    // Resolve the path relative to the containing file path, and remember
    // whether the original path was relative or absolute.
    final isRelative = p.isRelative(description);
    if (isRelative) {
      // Relative paths coming from pubspecs that are not on the local file
      // system aren't allowed. This can happen if a hosted or git dependency
      // has a path dependency.
      if (containingDir == null) {
        throw FormatException(
          '"$description" is a relative path, but this '
          'isn\'t a local pubspec.',
        );
      }

      dir = p.normalize(p.absolute(p.join(containingDir, description)));
    }
    return PackageRef(name, PathDescription(dir, isRelative));
  }

  @override
  PackageId parseId(
    String name,
    Version version,
    Object? description, {
    String? containingDir,
  }) {
    if (description is! Map) {
      throw const FormatException('The description must be a map.');
    }
    var path = description['path'];
    if (path is! String) {
      throw const FormatException(
        "The 'path' field of the description must "
        'be a string.',
      );
    }
    final relative = description['relative'];
    if (relative is! bool) {
      throw const FormatException(
        "The 'relative' field of the description "
        'must be a boolean.',
      );
    }

    // Resolve the path relative to the containing file path.
    if (relative) {
      // Relative paths coming from lockfiles that are not on the local file
      // system aren't allowed.
      if (containingDir == null) {
        throw FormatException(
          '"$description" is a relative path, but this '
          'isn\'t a local pubspec.',
        );
      }

      path = p.normalize(p.absolute(p.join(containingDir, path)));
    }

    return PackageId(
      name,
      version,
      ResolvedPathDescription(PathDescription(path, relative)),
    );
  }

  /// On both Windows and linux we prefer `/` in the pubspec.lock for relative
  /// paths.
  static String relativePathWithPosixSeparators(String path) {
    assert(p.isRelative(path));
    return p.posix.joinAll(p.split(path));
  }
}

class PathDescription extends Description {
  PathDescription(this.path, this.relative) : assert(!p.isRelative(path));
  final String path;
  final bool relative;
  @override
  String format() {
    return relative ? p.relative(path) : path;
  }

  @override
  Object? serializeForPubspec({
    required String? containingDir,
    required LanguageVersion languageVersion,
  }) {
    return relative
        ? PathSource.relativePathWithPosixSeparators(
          p.relative(path, from: containingDir),
        )
        : path;
  }

  @override
  Source get source => PathSource.instance;

  @override
  bool operator ==(Object other) {
    return other is PathDescription &&
        p.canonicalize(path) == p.canonicalize(other.path);
  }

  @override
  int get hashCode => p.canonicalize(path).hashCode;
}

class ResolvedPathDescription extends ResolvedDescription {
  ResolvedPathDescription(PathDescription super.description);
  @override
  PathDescription get description => super.description as PathDescription;

  @override
  Object? serializeForLockfile({required String? containingDir}) {
    if (description.relative) {
      return {
        'path': PathSource.relativePathWithPosixSeparators(
          p.relative(description.path, from: containingDir),
        ),
        'relative': true,
      };
    }
    return {'path': description.path, 'relative': p.relative('false')};
  }

  @override
  bool operator ==(Object other) =>
      other is ResolvedPathDescription && other.description == description;

  @override
  int get hashCode => description.hashCode;
}

class RootSource extends Source {
  RootSource._();
  static final RootSource instance = RootSource._();

  @override
  String get name => 'root';

  @override
  PackageId parseId(
    String name,
    Version version,
    Object? description, {
    String? containingDir,
  }) {
    throw UnsupportedError('Trying to parse a root package description.');
  }

  @override
  PackageRef parseRef(
    String name,
    Object? description, {
    String? containingDir,
    required LanguageVersion languageVersion,
  }) {
    throw UnsupportedError('Trying to parse a root package description.');
  }
}

class ResolvedRootDescription extends ResolvedDescription {
  ResolvedRootDescription(RootDescription super.description);

  @override
  Object? serializeForLockfile({required String? containingDir}) {
    throw UnsupportedError('Trying to serialize a root package description.');
  }

  @override
  bool operator ==(Object other) =>
      other is ResolvedRootDescription && other.description == description;

  @override
  int get hashCode => description.hashCode;
}

class RootDescription extends Description {
  RootDescription(this.package);
  final Package package;
  @override
  String format() {
    throw UnsupportedError('Trying to format a root package description.');
  }

  @override
  Object? serializeForPubspec({
    required String? containingDir,
    required LanguageVersion languageVersion,
  }) {
    throw UnsupportedError('Trying to serialize the root package description.');
  }

  @override
  Source get source => RootSource.instance;

  @override
  bool operator ==(Object other) =>
      other is RootDescription && other.package == package;

  @override
  int get hashCode => 'root'.hashCode;
}

/// A package [Source] that gets packages from a hard-coded SDK.
class SdkSource extends Source {
  SdkSource._();
  static final SdkSource instance = SdkSource._();

  @override
  final name = 'sdk';

  /// Parses an SDK dependency.
  @override
  PackageRef parseRef(
    String name,
    Object? description, {
    String? containingDir,
    LanguageVersion? languageVersion,
  }) {
    if (description is! String) {
      throw const FormatException('The description must be an SDK name.');
    }

    return PackageRef(name, SdkDescription(description));
  }

  @override
  PackageId parseId(
    String name,
    Version version,
    Object? description, {
    String? containingDir,
  }) {
    if (description is! String) {
      throw const FormatException('The description must be an SDK name.');
    }

    return PackageId(
      name,
      version,
      ResolvedSdkDescription(SdkDescription(description)),
    );
  }
}

class SdkDescription extends Description {
  SdkDescription(this.sdk);

  /// The sdk the described package comes from.
  final String sdk;
  @override
  String format() => sdk;

  @override
  Object? serializeForPubspec({
    required String? containingDir,
    required LanguageVersion languageVersion,
  }) {
    return sdk;
  }

  @override
  Source get source => SdkSource.instance;

  @override
  int get hashCode => sdk.hashCode;

  @override
  bool operator ==(Object other) {
    return other is SdkDescription && other.sdk == sdk;
  }
}

class ResolvedSdkDescription extends ResolvedDescription {
  ResolvedSdkDescription(SdkDescription super.description);
  @override
  SdkDescription get description => super.description as SdkDescription;

  @override
  Object? serializeForLockfile({required String? containingDir}) {
    return description.sdk;
  }

  @override
  int get hashCode => description.hashCode;

  @override
  bool operator ==(Object other) {
    return other is ResolvedSdkDescription && other.description == description;
  }
}

/// A [Null Object] that represents a source not recognized by pub.
///
/// It provides some default behavior so that pub can work with sources it
/// doesn't recognize.
///
/// [null object]: http://en.wikipedia.org/wiki/Null_Object_pattern
class UnknownSource extends Source {
  UnknownSource(this.name);
  @override
  final String name;

  /// Two unknown sources are the same if their names are the same.
  @override
  bool operator ==(Object other) =>
      other is UnknownSource && other.name == name;

  @override
  int get hashCode => name.hashCode;

  @override
  PackageRef parseRef(
    String name,
    Object? description, {
    String? containingDir,
    LanguageVersion? languageVersion,
  }) => PackageRef(name, UnknownDescription(description, this));

  @override
  PackageId parseId(
    String name,
    Version version,
    Object? description, {
    String? containingDir,
  }) => PackageId(
    name,
    version,
    ResolvedUnknownDescription(UnknownDescription(description, this)),
  );
}

class UnknownDescription extends Description {
  UnknownDescription(this.description, this.source);
  final Object? description;
  @override
  final UnknownSource source;

  @override
  String format() {
    return json.encode(description);
  }

  @override
  Object? serializeForPubspec({
    required String? containingDir,
    required LanguageVersion languageVersion,
  }) {
    throw UnsupportedError(
      "Cannot serialize a package description from an unknown source '${source.name}'.",
    );
  }

  @override
  bool operator ==(Object other) =>
      other is UnknownDescription &&
      source.name == other.source.name &&
      json.encode(description) == json.encode(other.description);

  @override
  int get hashCode => Object.hash(source.name, json.encode(description));
}

class ResolvedUnknownDescription extends ResolvedDescription {
  ResolvedUnknownDescription(UnknownDescription super.description);

  @override
  Object? serializeForLockfile({required String? containingDir}) {
    throw UnsupportedError(
      "Cannot serialize a package description from an unknown source '${description.source.name}'.",
    );
  }

  @override
  bool operator ==(Object other) =>
      other is ResolvedUnknownDescription && description == other.description;

  @override
  int get hashCode => description.hashCode;
}
