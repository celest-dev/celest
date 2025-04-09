// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openapi_ast.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const OpenApiOperationType _$get = const OpenApiOperationType._('get');
const OpenApiOperationType _$put = const OpenApiOperationType._('put');
const OpenApiOperationType _$post = const OpenApiOperationType._('post');
const OpenApiOperationType _$delete = const OpenApiOperationType._('delete');
const OpenApiOperationType _$options = const OpenApiOperationType._('options');
const OpenApiOperationType _$head = const OpenApiOperationType._('head');
const OpenApiOperationType _$patch = const OpenApiOperationType._('patch');
const OpenApiOperationType _$trace = const OpenApiOperationType._('trace');

OpenApiOperationType _$OpenApiOperationTypeValueOf(String name) {
  switch (name) {
    case 'get':
      return _$get;
    case 'put':
      return _$put;
    case 'post':
      return _$post;
    case 'delete':
      return _$delete;
    case 'options':
      return _$options;
    case 'head':
      return _$head;
    case 'patch':
      return _$patch;
    case 'trace':
      return _$trace;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<OpenApiOperationType> _$OpenApiOperationTypeValues =
    new BuiltSet<OpenApiOperationType>(const <OpenApiOperationType>[
  _$get,
  _$put,
  _$post,
  _$delete,
  _$options,
  _$head,
  _$patch,
  _$trace,
]);

const OpenApiParameterLocation _$query =
    const OpenApiParameterLocation._('query');
const OpenApiParameterLocation _$header =
    const OpenApiParameterLocation._('header');
const OpenApiParameterLocation _$path =
    const OpenApiParameterLocation._('path');
const OpenApiParameterLocation _$cookie =
    const OpenApiParameterLocation._('cookie');

OpenApiParameterLocation _$OpenApiParameterLocationValueOf(String name) {
  switch (name) {
    case 'query':
      return _$query;
    case 'header':
      return _$header;
    case 'path':
      return _$path;
    case 'cookie':
      return _$cookie;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<OpenApiParameterLocation> _$OpenApiParameterLocationValues =
    new BuiltSet<OpenApiParameterLocation>(const <OpenApiParameterLocation>[
  _$query,
  _$header,
  _$path,
  _$cookie,
]);

const OpenApiParameterStyle _$matrix = const OpenApiParameterStyle._('matrix');
const OpenApiParameterStyle _$label = const OpenApiParameterStyle._('label');
const OpenApiParameterStyle _$form = const OpenApiParameterStyle._('form');
const OpenApiParameterStyle _$simple = const OpenApiParameterStyle._('simple');
const OpenApiParameterStyle _$spaceDelimited =
    const OpenApiParameterStyle._('spaceDelimited');
const OpenApiParameterStyle _$pipeDelimited =
    const OpenApiParameterStyle._('pipeDelimited');
const OpenApiParameterStyle _$deepObject =
    const OpenApiParameterStyle._('deepObject');

OpenApiParameterStyle _$OpenApiParameterStyleValueOf(String name) {
  switch (name) {
    case 'matrix':
      return _$matrix;
    case 'label':
      return _$label;
    case 'form':
      return _$form;
    case 'simple':
      return _$simple;
    case 'spaceDelimited':
      return _$spaceDelimited;
    case 'pipeDelimited':
      return _$pipeDelimited;
    case 'deepObject':
      return _$deepObject;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<OpenApiParameterStyle> _$OpenApiParameterStyleValues =
    new BuiltSet<OpenApiParameterStyle>(const <OpenApiParameterStyle>[
  _$matrix,
  _$label,
  _$form,
  _$simple,
  _$spaceDelimited,
  _$pipeDelimited,
  _$deepObject,
]);

const OpenApiSecuritySchemeType _$apiKey =
    const OpenApiSecuritySchemeType._('apiKey');
const OpenApiSecuritySchemeType _$http =
    const OpenApiSecuritySchemeType._('http');
const OpenApiSecuritySchemeType _$oauth2 =
    const OpenApiSecuritySchemeType._('oauth2');
const OpenApiSecuritySchemeType _$openIdConnect =
    const OpenApiSecuritySchemeType._('openIdConnect');

OpenApiSecuritySchemeType _$OpenApiSecuritySchemeTypeValueOf(String name) {
  switch (name) {
    case 'apiKey':
      return _$apiKey;
    case 'http':
      return _$http;
    case 'oauth2':
      return _$oauth2;
    case 'openIdConnect':
      return _$openIdConnect;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<OpenApiSecuritySchemeType> _$OpenApiSecuritySchemeTypeValues =
    new BuiltSet<OpenApiSecuritySchemeType>(const <OpenApiSecuritySchemeType>[
  _$apiKey,
  _$http,
  _$oauth2,
  _$openIdConnect,
]);

abstract mixin class OpenApiComponentBuilder<T extends OpenApiComponent<T>> {
  void replace(OpenApiComponent<T> other);
  void update(void Function(OpenApiComponentBuilder<T>) updates);
  String? get summary;
  set summary(String? summary);

  String? get description;
  set description(String? description);

  String? get ref;
  set ref(String? ref);

  YamlNode? get node;
  set node(YamlNode? node);

  MapBuilder<String, JsonObject> get extensions;
  set extensions(MapBuilder<String, JsonObject>? extensions);
}

class _$OpenApiExternalDocs extends OpenApiExternalDocs {
  @override
  final String url;
  @override
  final String? description;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiExternalDocs(
          [void Function(OpenApiExternalDocsBuilder)? updates]) =>
      (new OpenApiExternalDocsBuilder()..update(updates))._build();

  _$OpenApiExternalDocs._(
      {required this.url,
      this.description,
      this.ref,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(url, r'OpenApiExternalDocs', 'url');
  }

  @override
  OpenApiExternalDocs rebuild(
          void Function(OpenApiExternalDocsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiExternalDocsBuilder toBuilder() =>
      new OpenApiExternalDocsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiExternalDocs &&
        url == other.url &&
        description == other.description &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiExternalDocs')
          ..add('url', url)
          ..add('description', description)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiExternalDocsBuilder
    implements Builder<OpenApiExternalDocs, OpenApiExternalDocsBuilder> {
  _$OpenApiExternalDocs? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiExternalDocsBuilder();

  OpenApiExternalDocsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _description = $v.description;
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiExternalDocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiExternalDocs;
  }

  @override
  void update(void Function(OpenApiExternalDocsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiExternalDocs build() => _build();

  _$OpenApiExternalDocs _build() {
    _$OpenApiExternalDocs _$result;
    try {
      _$result = _$v ??
          new _$OpenApiExternalDocs._(
            url: BuiltValueNullFieldError.checkNotNull(
                url, r'OpenApiExternalDocs', 'url'),
            description: description,
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiExternalDocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiDocument extends OpenApiDocument {
  @override
  final Version version;
  @override
  final OpenApiInfo info;
  @override
  final String? jsonSchemaDialect;
  @override
  final BuiltList<OpenApiServer> servers;
  @override
  final BuiltMap<String, OpenApiComponentOrRef<OpenApiPathItem>> paths;
  @override
  final OpenApiComponents components;
  @override
  final BuiltList<OpenApiSecurityRequirement> securityRequirements;
  @override
  final OpenApiExternalDocs? externalDocs;
  @override
  final BuiltList<OpenApiTag> tags;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiDocument([void Function(OpenApiDocumentBuilder)? updates]) =>
      (new OpenApiDocumentBuilder()..update(updates))._build();

  _$OpenApiDocument._(
      {required this.version,
      required this.info,
      this.jsonSchemaDialect,
      required this.servers,
      required this.paths,
      required this.components,
      required this.securityRequirements,
      this.externalDocs,
      required this.tags,
      this.ref,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        version, r'OpenApiDocument', 'version');
    BuiltValueNullFieldError.checkNotNull(info, r'OpenApiDocument', 'info');
    BuiltValueNullFieldError.checkNotNull(
        servers, r'OpenApiDocument', 'servers');
    BuiltValueNullFieldError.checkNotNull(paths, r'OpenApiDocument', 'paths');
    BuiltValueNullFieldError.checkNotNull(
        components, r'OpenApiDocument', 'components');
    BuiltValueNullFieldError.checkNotNull(
        securityRequirements, r'OpenApiDocument', 'securityRequirements');
    BuiltValueNullFieldError.checkNotNull(tags, r'OpenApiDocument', 'tags');
  }

  @override
  OpenApiDocument rebuild(void Function(OpenApiDocumentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiDocumentBuilder toBuilder() =>
      new OpenApiDocumentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiDocument &&
        version == other.version &&
        info == other.info &&
        jsonSchemaDialect == other.jsonSchemaDialect &&
        servers == other.servers &&
        paths == other.paths &&
        components == other.components &&
        securityRequirements == other.securityRequirements &&
        externalDocs == other.externalDocs &&
        tags == other.tags &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, info.hashCode);
    _$hash = $jc(_$hash, jsonSchemaDialect.hashCode);
    _$hash = $jc(_$hash, servers.hashCode);
    _$hash = $jc(_$hash, paths.hashCode);
    _$hash = $jc(_$hash, components.hashCode);
    _$hash = $jc(_$hash, securityRequirements.hashCode);
    _$hash = $jc(_$hash, externalDocs.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiDocument')
          ..add('version', version)
          ..add('info', info)
          ..add('jsonSchemaDialect', jsonSchemaDialect)
          ..add('servers', servers)
          ..add('paths', paths)
          ..add('components', components)
          ..add('securityRequirements', securityRequirements)
          ..add('externalDocs', externalDocs)
          ..add('tags', tags)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiDocumentBuilder
    implements Builder<OpenApiDocument, OpenApiDocumentBuilder> {
  _$OpenApiDocument? _$v;

  Version? _version;
  Version? get version => _$this._version;
  set version(Version? version) => _$this._version = version;

  OpenApiInfoBuilder? _info;
  OpenApiInfoBuilder get info => _$this._info ??= new OpenApiInfoBuilder();
  set info(OpenApiInfoBuilder? info) => _$this._info = info;

  String? _jsonSchemaDialect;
  String? get jsonSchemaDialect => _$this._jsonSchemaDialect;
  set jsonSchemaDialect(String? jsonSchemaDialect) =>
      _$this._jsonSchemaDialect = jsonSchemaDialect;

  ListBuilder<OpenApiServer>? _servers;
  ListBuilder<OpenApiServer> get servers =>
      _$this._servers ??= new ListBuilder<OpenApiServer>();
  set servers(ListBuilder<OpenApiServer>? servers) => _$this._servers = servers;

  MapBuilder<String, OpenApiComponentOrRef<OpenApiPathItem>>? _paths;
  MapBuilder<String, OpenApiComponentOrRef<OpenApiPathItem>> get paths =>
      _$this._paths ??=
          new MapBuilder<String, OpenApiComponentOrRef<OpenApiPathItem>>();
  set paths(
          MapBuilder<String, OpenApiComponentOrRef<OpenApiPathItem>>? paths) =>
      _$this._paths = paths;

  OpenApiComponentsBuilder? _components;
  OpenApiComponentsBuilder get components =>
      _$this._components ??= new OpenApiComponentsBuilder();
  set components(OpenApiComponentsBuilder? components) =>
      _$this._components = components;

  ListBuilder<OpenApiSecurityRequirement>? _securityRequirements;
  ListBuilder<OpenApiSecurityRequirement> get securityRequirements =>
      _$this._securityRequirements ??=
          new ListBuilder<OpenApiSecurityRequirement>();
  set securityRequirements(
          ListBuilder<OpenApiSecurityRequirement>? securityRequirements) =>
      _$this._securityRequirements = securityRequirements;

  OpenApiExternalDocsBuilder? _externalDocs;
  OpenApiExternalDocsBuilder get externalDocs =>
      _$this._externalDocs ??= new OpenApiExternalDocsBuilder();
  set externalDocs(OpenApiExternalDocsBuilder? externalDocs) =>
      _$this._externalDocs = externalDocs;

  ListBuilder<OpenApiTag>? _tags;
  ListBuilder<OpenApiTag> get tags =>
      _$this._tags ??= new ListBuilder<OpenApiTag>();
  set tags(ListBuilder<OpenApiTag>? tags) => _$this._tags = tags;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiDocumentBuilder();

  OpenApiDocumentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _version = $v.version;
      _info = $v.info.toBuilder();
      _jsonSchemaDialect = $v.jsonSchemaDialect;
      _servers = $v.servers.toBuilder();
      _paths = $v.paths.toBuilder();
      _components = $v.components.toBuilder();
      _securityRequirements = $v.securityRequirements.toBuilder();
      _externalDocs = $v.externalDocs?.toBuilder();
      _tags = $v.tags.toBuilder();
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiDocument other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiDocument;
  }

  @override
  void update(void Function(OpenApiDocumentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiDocument build() => _build();

  _$OpenApiDocument _build() {
    _$OpenApiDocument _$result;
    try {
      _$result = _$v ??
          new _$OpenApiDocument._(
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'OpenApiDocument', 'version'),
            info: info.build(),
            jsonSchemaDialect: jsonSchemaDialect,
            servers: servers.build(),
            paths: paths.build(),
            components: components.build(),
            securityRequirements: securityRequirements.build(),
            externalDocs: _externalDocs?.build(),
            tags: tags.build(),
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'info';
        info.build();

        _$failedField = 'servers';
        servers.build();
        _$failedField = 'paths';
        paths.build();
        _$failedField = 'components';
        components.build();
        _$failedField = 'securityRequirements';
        securityRequirements.build();
        _$failedField = 'externalDocs';
        _externalDocs?.build();
        _$failedField = 'tags';
        tags.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiDocument', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiInfo extends OpenApiInfo {
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? apiVersion;
  @override
  final OpenApiContact? contact;
  @override
  final OpenApiLicense? license;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiInfo([void Function(OpenApiInfoBuilder)? updates]) =>
      (new OpenApiInfoBuilder()..update(updates))._build();

  _$OpenApiInfo._(
      {this.title,
      this.description,
      this.apiVersion,
      this.contact,
      this.license,
      this.ref,
      this.node,
      this.extensions})
      : super._();

  @override
  OpenApiInfo rebuild(void Function(OpenApiInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiInfoBuilder toBuilder() => new OpenApiInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiInfo &&
        title == other.title &&
        description == other.description &&
        apiVersion == other.apiVersion &&
        contact == other.contact &&
        license == other.license &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, apiVersion.hashCode);
    _$hash = $jc(_$hash, contact.hashCode);
    _$hash = $jc(_$hash, license.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiInfo')
          ..add('title', title)
          ..add('description', description)
          ..add('apiVersion', apiVersion)
          ..add('contact', contact)
          ..add('license', license)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiInfoBuilder implements Builder<OpenApiInfo, OpenApiInfoBuilder> {
  _$OpenApiInfo? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _apiVersion;
  String? get apiVersion => _$this._apiVersion;
  set apiVersion(String? apiVersion) => _$this._apiVersion = apiVersion;

  OpenApiContactBuilder? _contact;
  OpenApiContactBuilder get contact =>
      _$this._contact ??= new OpenApiContactBuilder();
  set contact(OpenApiContactBuilder? contact) => _$this._contact = contact;

  OpenApiLicenseBuilder? _license;
  OpenApiLicenseBuilder get license =>
      _$this._license ??= new OpenApiLicenseBuilder();
  set license(OpenApiLicenseBuilder? license) => _$this._license = license;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiInfoBuilder();

  OpenApiInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _apiVersion = $v.apiVersion;
      _contact = $v.contact?.toBuilder();
      _license = $v.license?.toBuilder();
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiInfo;
  }

  @override
  void update(void Function(OpenApiInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiInfo build() => _build();

  _$OpenApiInfo _build() {
    _$OpenApiInfo _$result;
    try {
      _$result = _$v ??
          new _$OpenApiInfo._(
            title: title,
            description: description,
            apiVersion: apiVersion,
            contact: _contact?.build(),
            license: _license?.build(),
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'contact';
        _contact?.build();
        _$failedField = 'license';
        _license?.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiLicense extends OpenApiLicense {
  @override
  final String name;
  @override
  final String? identifier;
  @override
  final String? url;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiLicense([void Function(OpenApiLicenseBuilder)? updates]) =>
      (new OpenApiLicenseBuilder()..update(updates))._build();

  _$OpenApiLicense._(
      {required this.name,
      this.identifier,
      this.url,
      this.ref,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'OpenApiLicense', 'name');
  }

  @override
  OpenApiLicense rebuild(void Function(OpenApiLicenseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiLicenseBuilder toBuilder() =>
      new OpenApiLicenseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiLicense &&
        name == other.name &&
        identifier == other.identifier &&
        url == other.url &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, identifier.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiLicense')
          ..add('name', name)
          ..add('identifier', identifier)
          ..add('url', url)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiLicenseBuilder
    implements Builder<OpenApiLicense, OpenApiLicenseBuilder> {
  _$OpenApiLicense? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _identifier;
  String? get identifier => _$this._identifier;
  set identifier(String? identifier) => _$this._identifier = identifier;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiLicenseBuilder();

  OpenApiLicenseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _identifier = $v.identifier;
      _url = $v.url;
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiLicense other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiLicense;
  }

  @override
  void update(void Function(OpenApiLicenseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiLicense build() => _build();

  _$OpenApiLicense _build() {
    _$OpenApiLicense _$result;
    try {
      _$result = _$v ??
          new _$OpenApiLicense._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'OpenApiLicense', 'name'),
            identifier: identifier,
            url: url,
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiLicense', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiServer extends OpenApiServer {
  @override
  final String url;
  @override
  final String? description;
  @override
  final BuiltMap<String, OpenApiServerVariable> variables;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiServer([void Function(OpenApiServerBuilder)? updates]) =>
      (new OpenApiServerBuilder()..update(updates))._build();

  _$OpenApiServer._(
      {required this.url,
      this.description,
      required this.variables,
      this.ref,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(url, r'OpenApiServer', 'url');
    BuiltValueNullFieldError.checkNotNull(
        variables, r'OpenApiServer', 'variables');
  }

  @override
  OpenApiServer rebuild(void Function(OpenApiServerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiServerBuilder toBuilder() => new OpenApiServerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiServer &&
        url == other.url &&
        description == other.description &&
        variables == other.variables &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, variables.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiServer')
          ..add('url', url)
          ..add('description', description)
          ..add('variables', variables)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiServerBuilder
    implements Builder<OpenApiServer, OpenApiServerBuilder> {
  _$OpenApiServer? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  MapBuilder<String, OpenApiServerVariable>? _variables;
  MapBuilder<String, OpenApiServerVariable> get variables =>
      _$this._variables ??= new MapBuilder<String, OpenApiServerVariable>();
  set variables(MapBuilder<String, OpenApiServerVariable>? variables) =>
      _$this._variables = variables;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiServerBuilder();

  OpenApiServerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _description = $v.description;
      _variables = $v.variables.toBuilder();
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiServer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiServer;
  }

  @override
  void update(void Function(OpenApiServerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiServer build() => _build();

  _$OpenApiServer _build() {
    _$OpenApiServer _$result;
    try {
      _$result = _$v ??
          new _$OpenApiServer._(
            url: BuiltValueNullFieldError.checkNotNull(
                url, r'OpenApiServer', 'url'),
            description: description,
            variables: variables.build(),
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'variables';
        variables.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiServer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiServerVariable extends OpenApiServerVariable {
  @override
  final String name;
  @override
  final BuiltList<String>? enumValues;
  @override
  final String defaultValue;
  @override
  final String? description;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiServerVariable(
          [void Function(OpenApiServerVariableBuilder)? updates]) =>
      (new OpenApiServerVariableBuilder()..update(updates))._build();

  _$OpenApiServerVariable._(
      {required this.name,
      this.enumValues,
      required this.defaultValue,
      this.description,
      this.ref,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'OpenApiServerVariable', 'name');
    BuiltValueNullFieldError.checkNotNull(
        defaultValue, r'OpenApiServerVariable', 'defaultValue');
  }

  @override
  OpenApiServerVariable rebuild(
          void Function(OpenApiServerVariableBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiServerVariableBuilder toBuilder() =>
      new OpenApiServerVariableBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiServerVariable &&
        name == other.name &&
        enumValues == other.enumValues &&
        defaultValue == other.defaultValue &&
        description == other.description &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, enumValues.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiServerVariable')
          ..add('name', name)
          ..add('enumValues', enumValues)
          ..add('defaultValue', defaultValue)
          ..add('description', description)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiServerVariableBuilder
    implements Builder<OpenApiServerVariable, OpenApiServerVariableBuilder> {
  _$OpenApiServerVariable? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<String>? _enumValues;
  ListBuilder<String> get enumValues =>
      _$this._enumValues ??= new ListBuilder<String>();
  set enumValues(ListBuilder<String>? enumValues) =>
      _$this._enumValues = enumValues;

  String? _defaultValue;
  String? get defaultValue => _$this._defaultValue;
  set defaultValue(String? defaultValue) => _$this._defaultValue = defaultValue;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiServerVariableBuilder();

  OpenApiServerVariableBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _enumValues = $v.enumValues?.toBuilder();
      _defaultValue = $v.defaultValue;
      _description = $v.description;
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiServerVariable other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiServerVariable;
  }

  @override
  void update(void Function(OpenApiServerVariableBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiServerVariable build() => _build();

  _$OpenApiServerVariable _build() {
    _$OpenApiServerVariable _$result;
    try {
      _$result = _$v ??
          new _$OpenApiServerVariable._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'OpenApiServerVariable', 'name'),
            enumValues: _enumValues?.build(),
            defaultValue: BuiltValueNullFieldError.checkNotNull(
                defaultValue, r'OpenApiServerVariable', 'defaultValue'),
            description: description,
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'enumValues';
        _enumValues?.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiServerVariable', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiPathItem extends OpenApiPathItem {
  @override
  final String? summary;
  @override
  final String? description;
  @override
  final BuiltMap<OpenApiOperationType, OpenApiOperation> operations;
  @override
  final BuiltList<OpenApiServer>? servers;
  @override
  final BuiltList<OpenApiComponentOrRef<OpenApiParameter>> parameters;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiPathItem([void Function(OpenApiPathItemBuilder)? updates]) =>
      (new OpenApiPathItemBuilder()..update(updates))._build();

  _$OpenApiPathItem._(
      {this.summary,
      this.description,
      required this.operations,
      this.servers,
      required this.parameters,
      this.ref,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        operations, r'OpenApiPathItem', 'operations');
    BuiltValueNullFieldError.checkNotNull(
        parameters, r'OpenApiPathItem', 'parameters');
  }

  @override
  OpenApiPathItem rebuild(void Function(OpenApiPathItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiPathItemBuilder toBuilder() =>
      new OpenApiPathItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiPathItem &&
        summary == other.summary &&
        description == other.description &&
        operations == other.operations &&
        servers == other.servers &&
        parameters == other.parameters &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, operations.hashCode);
    _$hash = $jc(_$hash, servers.hashCode);
    _$hash = $jc(_$hash, parameters.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiPathItem')
          ..add('summary', summary)
          ..add('description', description)
          ..add('operations', operations)
          ..add('servers', servers)
          ..add('parameters', parameters)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiPathItemBuilder
    implements
        Builder<OpenApiPathItem, OpenApiPathItemBuilder>,
        OpenApiComponentBuilder<OpenApiPathItem> {
  _$OpenApiPathItem? _$v;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(covariant String? summary) => _$this._summary = summary;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  MapBuilder<OpenApiOperationType, OpenApiOperation>? _operations;
  MapBuilder<OpenApiOperationType, OpenApiOperation> get operations =>
      _$this._operations ??=
          new MapBuilder<OpenApiOperationType, OpenApiOperation>();
  set operations(
          covariant MapBuilder<OpenApiOperationType, OpenApiOperation>?
              operations) =>
      _$this._operations = operations;

  ListBuilder<OpenApiServer>? _servers;
  ListBuilder<OpenApiServer> get servers =>
      _$this._servers ??= new ListBuilder<OpenApiServer>();
  set servers(covariant ListBuilder<OpenApiServer>? servers) =>
      _$this._servers = servers;

  ListBuilder<OpenApiComponentOrRef<OpenApiParameter>>? _parameters;
  ListBuilder<OpenApiComponentOrRef<OpenApiParameter>> get parameters =>
      _$this._parameters ??=
          new ListBuilder<OpenApiComponentOrRef<OpenApiParameter>>();
  set parameters(
          covariant ListBuilder<OpenApiComponentOrRef<OpenApiParameter>>?
              parameters) =>
      _$this._parameters = parameters;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(covariant YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiPathItemBuilder();

  OpenApiPathItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _summary = $v.summary;
      _description = $v.description;
      _operations = $v.operations.toBuilder();
      _servers = $v.servers?.toBuilder();
      _parameters = $v.parameters.toBuilder();
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiPathItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiPathItem;
  }

  @override
  void update(void Function(OpenApiPathItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiPathItem build() => _build();

  _$OpenApiPathItem _build() {
    _$OpenApiPathItem _$result;
    try {
      _$result = _$v ??
          new _$OpenApiPathItem._(
            summary: summary,
            description: description,
            operations: operations.build(),
            servers: _servers?.build(),
            parameters: parameters.build(),
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'operations';
        operations.build();
        _$failedField = 'servers';
        _servers?.build();
        _$failedField = 'parameters';
        parameters.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiPathItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiOperation extends OpenApiOperation {
  @override
  final OpenApiOperationType type;
  @override
  final BuiltList<String> tags;
  @override
  final String? summary;
  @override
  final String? description;
  @override
  final String? operationId;
  @override
  final BuiltList<OpenApiComponentOrRef<OpenApiParameter>> parameters;
  @override
  final OpenApiComponentOrRef<OpenApiRequestBody>? requestBody;
  @override
  final BuiltMap<StatusCodeOrRange, OpenApiComponentOrRef<OpenApiResponse>>
      responses;
  @override
  final OpenApiComponentOrRef<OpenApiResponse>? defaultResponse;
  @override
  final bool? deprecated;
  @override
  final BuiltList<OpenApiServer>? servers;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiOperation(
          [void Function(OpenApiOperationBuilder)? updates]) =>
      (new OpenApiOperationBuilder()..update(updates))._build();

  _$OpenApiOperation._(
      {required this.type,
      required this.tags,
      this.summary,
      this.description,
      this.operationId,
      required this.parameters,
      this.requestBody,
      required this.responses,
      this.defaultResponse,
      this.deprecated,
      this.servers,
      this.ref,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'OpenApiOperation', 'type');
    BuiltValueNullFieldError.checkNotNull(tags, r'OpenApiOperation', 'tags');
    BuiltValueNullFieldError.checkNotNull(
        parameters, r'OpenApiOperation', 'parameters');
    BuiltValueNullFieldError.checkNotNull(
        responses, r'OpenApiOperation', 'responses');
  }

  @override
  OpenApiOperation rebuild(void Function(OpenApiOperationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiOperationBuilder toBuilder() =>
      new OpenApiOperationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiOperation &&
        type == other.type &&
        tags == other.tags &&
        summary == other.summary &&
        description == other.description &&
        operationId == other.operationId &&
        parameters == other.parameters &&
        requestBody == other.requestBody &&
        responses == other.responses &&
        defaultResponse == other.defaultResponse &&
        deprecated == other.deprecated &&
        servers == other.servers &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, operationId.hashCode);
    _$hash = $jc(_$hash, parameters.hashCode);
    _$hash = $jc(_$hash, requestBody.hashCode);
    _$hash = $jc(_$hash, responses.hashCode);
    _$hash = $jc(_$hash, defaultResponse.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, servers.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiOperation')
          ..add('type', type)
          ..add('tags', tags)
          ..add('summary', summary)
          ..add('description', description)
          ..add('operationId', operationId)
          ..add('parameters', parameters)
          ..add('requestBody', requestBody)
          ..add('responses', responses)
          ..add('defaultResponse', defaultResponse)
          ..add('deprecated', deprecated)
          ..add('servers', servers)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiOperationBuilder
    implements Builder<OpenApiOperation, OpenApiOperationBuilder> {
  _$OpenApiOperation? _$v;

  OpenApiOperationType? _type;
  OpenApiOperationType? get type => _$this._type;
  set type(OpenApiOperationType? type) => _$this._type = type;

  ListBuilder<String>? _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String>? tags) => _$this._tags = tags;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _operationId;
  String? get operationId => _$this._operationId;
  set operationId(String? operationId) => _$this._operationId = operationId;

  ListBuilder<OpenApiComponentOrRef<OpenApiParameter>>? _parameters;
  ListBuilder<OpenApiComponentOrRef<OpenApiParameter>> get parameters =>
      _$this._parameters ??=
          new ListBuilder<OpenApiComponentOrRef<OpenApiParameter>>();
  set parameters(
          ListBuilder<OpenApiComponentOrRef<OpenApiParameter>>? parameters) =>
      _$this._parameters = parameters;

  OpenApiComponentOrRefBuilder<OpenApiRequestBody>? _requestBody;
  OpenApiComponentOrRefBuilder<OpenApiRequestBody> get requestBody =>
      _$this._requestBody ??=
          new OpenApiComponentOrRefBuilder<OpenApiRequestBody>();
  set requestBody(
          OpenApiComponentOrRefBuilder<OpenApiRequestBody>? requestBody) =>
      _$this._requestBody = requestBody;

  MapBuilder<StatusCodeOrRange, OpenApiComponentOrRef<OpenApiResponse>>?
      _responses;
  MapBuilder<StatusCodeOrRange, OpenApiComponentOrRef<OpenApiResponse>>
      get responses => _$this._responses ??= new MapBuilder<StatusCodeOrRange,
          OpenApiComponentOrRef<OpenApiResponse>>();
  set responses(
          MapBuilder<StatusCodeOrRange, OpenApiComponentOrRef<OpenApiResponse>>?
              responses) =>
      _$this._responses = responses;

  OpenApiComponentOrRefBuilder<OpenApiResponse>? _defaultResponse;
  OpenApiComponentOrRefBuilder<OpenApiResponse> get defaultResponse =>
      _$this._defaultResponse ??=
          new OpenApiComponentOrRefBuilder<OpenApiResponse>();
  set defaultResponse(
          OpenApiComponentOrRefBuilder<OpenApiResponse>? defaultResponse) =>
      _$this._defaultResponse = defaultResponse;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(bool? deprecated) => _$this._deprecated = deprecated;

  ListBuilder<OpenApiServer>? _servers;
  ListBuilder<OpenApiServer> get servers =>
      _$this._servers ??= new ListBuilder<OpenApiServer>();
  set servers(ListBuilder<OpenApiServer>? servers) => _$this._servers = servers;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiOperationBuilder();

  OpenApiOperationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _tags = $v.tags.toBuilder();
      _summary = $v.summary;
      _description = $v.description;
      _operationId = $v.operationId;
      _parameters = $v.parameters.toBuilder();
      _requestBody = $v.requestBody?.toBuilder();
      _responses = $v.responses.toBuilder();
      _defaultResponse = $v.defaultResponse?.toBuilder();
      _deprecated = $v.deprecated;
      _servers = $v.servers?.toBuilder();
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiOperation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiOperation;
  }

  @override
  void update(void Function(OpenApiOperationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiOperation build() => _build();

  _$OpenApiOperation _build() {
    OpenApiOperation._validate(this);
    _$OpenApiOperation _$result;
    try {
      _$result = _$v ??
          new _$OpenApiOperation._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'OpenApiOperation', 'type'),
            tags: tags.build(),
            summary: summary,
            description: description,
            operationId: operationId,
            parameters: parameters.build(),
            requestBody: _requestBody?.build(),
            responses: responses.build(),
            defaultResponse: _defaultResponse?.build(),
            deprecated: deprecated,
            servers: _servers?.build(),
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();

        _$failedField = 'parameters';
        parameters.build();
        _$failedField = 'requestBody';
        _requestBody?.build();
        _$failedField = 'responses';
        responses.build();
        _$failedField = 'defaultResponse';
        _defaultResponse?.build();

        _$failedField = 'servers';
        _servers?.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiOperation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiParameter extends OpenApiParameter {
  @override
  final String name;
  @override
  final OpenApiParameterLocation location;
  @override
  final String? description;
  @override
  final bool? required;
  @override
  final bool? deprecated;
  @override
  final bool? allowEmptyValue;
  @override
  final OpenApiParameterStyle? style;
  @override
  final bool? explode;
  @override
  final bool? allowReserved;
  @override
  final OpenApiComponentOrRef<OpenApiSchema>? schema;
  @override
  final (MediaType, OpenApiMediaType)? content;
  @override
  final String? summary;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiParameter(
          [void Function(OpenApiParameterBuilder)? updates]) =>
      (new OpenApiParameterBuilder()..update(updates))._build();

  _$OpenApiParameter._(
      {required this.name,
      required this.location,
      this.description,
      this.required,
      this.deprecated,
      this.allowEmptyValue,
      this.style,
      this.explode,
      this.allowReserved,
      this.schema,
      this.content,
      this.summary,
      this.ref,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'OpenApiParameter', 'name');
    BuiltValueNullFieldError.checkNotNull(
        location, r'OpenApiParameter', 'location');
  }

  @override
  OpenApiParameter rebuild(void Function(OpenApiParameterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiParameterBuilder toBuilder() =>
      new OpenApiParameterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is OpenApiParameter &&
        name == other.name &&
        location == other.location &&
        description == other.description &&
        required == other.required &&
        deprecated == other.deprecated &&
        allowEmptyValue == other.allowEmptyValue &&
        style == other.style &&
        explode == other.explode &&
        allowReserved == other.allowReserved &&
        schema == other.schema &&
        content == _$dynamicOther.content &&
        summary == other.summary &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, allowEmptyValue.hashCode);
    _$hash = $jc(_$hash, style.hashCode);
    _$hash = $jc(_$hash, explode.hashCode);
    _$hash = $jc(_$hash, allowReserved.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiParameter')
          ..add('name', name)
          ..add('location', location)
          ..add('description', description)
          ..add('required', required)
          ..add('deprecated', deprecated)
          ..add('allowEmptyValue', allowEmptyValue)
          ..add('style', style)
          ..add('explode', explode)
          ..add('allowReserved', allowReserved)
          ..add('schema', schema)
          ..add('content', content)
          ..add('summary', summary)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiParameterBuilder
    implements
        Builder<OpenApiParameter, OpenApiParameterBuilder>,
        OpenApiComponentBuilder<OpenApiParameter> {
  _$OpenApiParameter? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  OpenApiParameterLocation? _location;
  OpenApiParameterLocation? get location => _$this._location;
  set location(covariant OpenApiParameterLocation? location) =>
      _$this._location = location;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _required;
  bool? get required => _$this._required;
  set required(covariant bool? required) => _$this._required = required;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  bool? _allowEmptyValue;
  bool? get allowEmptyValue => _$this._allowEmptyValue;
  set allowEmptyValue(covariant bool? allowEmptyValue) =>
      _$this._allowEmptyValue = allowEmptyValue;

  OpenApiParameterStyle? _style;
  OpenApiParameterStyle? get style => _$this._style;
  set style(covariant OpenApiParameterStyle? style) => _$this._style = style;

  bool? _explode;
  bool? get explode => _$this._explode;
  set explode(covariant bool? explode) => _$this._explode = explode;

  bool? _allowReserved;
  bool? get allowReserved => _$this._allowReserved;
  set allowReserved(covariant bool? allowReserved) =>
      _$this._allowReserved = allowReserved;

  OpenApiComponentOrRefBuilder<OpenApiSchema>? _schema;
  OpenApiComponentOrRefBuilder<OpenApiSchema> get schema =>
      _$this._schema ??= new OpenApiComponentOrRefBuilder<OpenApiSchema>();
  set schema(covariant OpenApiComponentOrRefBuilder<OpenApiSchema>? schema) =>
      _$this._schema = schema;

  (MediaType, OpenApiMediaType)? _content;
  (MediaType, OpenApiMediaType)? get content => _$this._content;
  set content(covariant (MediaType, OpenApiMediaType)? content) =>
      _$this._content = content;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(covariant String? summary) => _$this._summary = summary;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(covariant YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiParameterBuilder();

  OpenApiParameterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _location = $v.location;
      _description = $v.description;
      _required = $v.required;
      _deprecated = $v.deprecated;
      _allowEmptyValue = $v.allowEmptyValue;
      _style = $v.style;
      _explode = $v.explode;
      _allowReserved = $v.allowReserved;
      _schema = $v.schema?.toBuilder();
      _content = $v.content;
      _summary = $v.summary;
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiParameter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiParameter;
  }

  @override
  void update(void Function(OpenApiParameterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiParameter build() => _build();

  _$OpenApiParameter _build() {
    OpenApiParameter._validate(this);
    _$OpenApiParameter _$result;
    try {
      _$result = _$v ??
          new _$OpenApiParameter._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'OpenApiParameter', 'name'),
            location: BuiltValueNullFieldError.checkNotNull(
                location, r'OpenApiParameter', 'location'),
            description: description,
            required: required,
            deprecated: deprecated,
            allowEmptyValue: allowEmptyValue,
            style: style,
            explode: explode,
            allowReserved: allowReserved,
            schema: _schema?.build(),
            content: content,
            summary: summary,
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'schema';
        _schema?.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiParameter', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiMediaType extends OpenApiMediaType {
  @override
  final OpenApiComponentOrRef<OpenApiSchema> schema;
  @override
  final BuiltMap<String, OpenApiEncoding> encoding;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiMediaType(
          [void Function(OpenApiMediaTypeBuilder)? updates]) =>
      (new OpenApiMediaTypeBuilder()..update(updates))._build();

  _$OpenApiMediaType._(
      {required this.schema,
      required this.encoding,
      this.ref,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        schema, r'OpenApiMediaType', 'schema');
    BuiltValueNullFieldError.checkNotNull(
        encoding, r'OpenApiMediaType', 'encoding');
  }

  @override
  OpenApiMediaType rebuild(void Function(OpenApiMediaTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiMediaTypeBuilder toBuilder() =>
      new OpenApiMediaTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiMediaType &&
        schema == other.schema &&
        encoding == other.encoding &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, encoding.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiMediaType')
          ..add('schema', schema)
          ..add('encoding', encoding)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiMediaTypeBuilder
    implements Builder<OpenApiMediaType, OpenApiMediaTypeBuilder> {
  _$OpenApiMediaType? _$v;

  OpenApiComponentOrRefBuilder<OpenApiSchema>? _schema;
  OpenApiComponentOrRefBuilder<OpenApiSchema> get schema =>
      _$this._schema ??= new OpenApiComponentOrRefBuilder<OpenApiSchema>();
  set schema(OpenApiComponentOrRefBuilder<OpenApiSchema>? schema) =>
      _$this._schema = schema;

  MapBuilder<String, OpenApiEncoding>? _encoding;
  MapBuilder<String, OpenApiEncoding> get encoding =>
      _$this._encoding ??= new MapBuilder<String, OpenApiEncoding>();
  set encoding(MapBuilder<String, OpenApiEncoding>? encoding) =>
      _$this._encoding = encoding;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiMediaTypeBuilder();

  OpenApiMediaTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _schema = $v.schema.toBuilder();
      _encoding = $v.encoding.toBuilder();
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiMediaType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiMediaType;
  }

  @override
  void update(void Function(OpenApiMediaTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiMediaType build() => _build();

  _$OpenApiMediaType _build() {
    _$OpenApiMediaType _$result;
    try {
      _$result = _$v ??
          new _$OpenApiMediaType._(
            schema: schema.build(),
            encoding: encoding.build(),
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'schema';
        schema.build();
        _$failedField = 'encoding';
        encoding.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiMediaType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiRequestBody extends OpenApiRequestBody {
  @override
  final BuiltMap<MediaType, OpenApiMediaType> content;
  @override
  final String? description;
  @override
  final bool? required;
  @override
  final String? summary;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiRequestBody(
          [void Function(OpenApiRequestBodyBuilder)? updates]) =>
      (new OpenApiRequestBodyBuilder()..update(updates))._build();

  _$OpenApiRequestBody._(
      {required this.content,
      this.description,
      this.required,
      this.summary,
      this.ref,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        content, r'OpenApiRequestBody', 'content');
  }

  @override
  OpenApiRequestBody rebuild(
          void Function(OpenApiRequestBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiRequestBodyBuilder toBuilder() =>
      new OpenApiRequestBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiRequestBody &&
        content == other.content &&
        description == other.description &&
        required == other.required &&
        summary == other.summary &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiRequestBody')
          ..add('content', content)
          ..add('description', description)
          ..add('required', required)
          ..add('summary', summary)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiRequestBodyBuilder
    implements
        Builder<OpenApiRequestBody, OpenApiRequestBodyBuilder>,
        OpenApiComponentBuilder<OpenApiRequestBody> {
  _$OpenApiRequestBody? _$v;

  MapBuilder<MediaType, OpenApiMediaType>? _content;
  MapBuilder<MediaType, OpenApiMediaType> get content =>
      _$this._content ??= new MapBuilder<MediaType, OpenApiMediaType>();
  set content(covariant MapBuilder<MediaType, OpenApiMediaType>? content) =>
      _$this._content = content;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _required;
  bool? get required => _$this._required;
  set required(covariant bool? required) => _$this._required = required;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(covariant String? summary) => _$this._summary = summary;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(covariant YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiRequestBodyBuilder();

  OpenApiRequestBodyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _content = $v.content.toBuilder();
      _description = $v.description;
      _required = $v.required;
      _summary = $v.summary;
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiRequestBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiRequestBody;
  }

  @override
  void update(void Function(OpenApiRequestBodyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiRequestBody build() => _build();

  _$OpenApiRequestBody _build() {
    OpenApiRequestBody._validate(this);
    _$OpenApiRequestBody _$result;
    try {
      _$result = _$v ??
          new _$OpenApiRequestBody._(
            content: content.build(),
            description: description,
            required: required,
            summary: summary,
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'content';
        content.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiRequestBody', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiEncoding extends OpenApiEncoding {
  @override
  final MediaType contentType;
  @override
  final BuiltMap<String, OpenApiComponentOrRef<OpenApiHeader>> headers;
  @override
  final OpenApiParameterStyle? style;
  @override
  final bool? explode;
  @override
  final bool? allowReserved;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiEncoding([void Function(OpenApiEncodingBuilder)? updates]) =>
      (new OpenApiEncodingBuilder()..update(updates))._build();

  _$OpenApiEncoding._(
      {required this.contentType,
      required this.headers,
      this.style,
      this.explode,
      this.allowReserved,
      this.ref,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        contentType, r'OpenApiEncoding', 'contentType');
    BuiltValueNullFieldError.checkNotNull(
        headers, r'OpenApiEncoding', 'headers');
  }

  @override
  OpenApiEncoding rebuild(void Function(OpenApiEncodingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiEncodingBuilder toBuilder() =>
      new OpenApiEncodingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiEncoding &&
        contentType == other.contentType &&
        headers == other.headers &&
        style == other.style &&
        explode == other.explode &&
        allowReserved == other.allowReserved &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, contentType.hashCode);
    _$hash = $jc(_$hash, headers.hashCode);
    _$hash = $jc(_$hash, style.hashCode);
    _$hash = $jc(_$hash, explode.hashCode);
    _$hash = $jc(_$hash, allowReserved.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiEncoding')
          ..add('contentType', contentType)
          ..add('headers', headers)
          ..add('style', style)
          ..add('explode', explode)
          ..add('allowReserved', allowReserved)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiEncodingBuilder
    implements Builder<OpenApiEncoding, OpenApiEncodingBuilder> {
  _$OpenApiEncoding? _$v;

  MediaType? _contentType;
  MediaType? get contentType => _$this._contentType;
  set contentType(MediaType? contentType) => _$this._contentType = contentType;

  MapBuilder<String, OpenApiComponentOrRef<OpenApiHeader>>? _headers;
  MapBuilder<String, OpenApiComponentOrRef<OpenApiHeader>> get headers =>
      _$this._headers ??=
          new MapBuilder<String, OpenApiComponentOrRef<OpenApiHeader>>();
  set headers(
          MapBuilder<String, OpenApiComponentOrRef<OpenApiHeader>>? headers) =>
      _$this._headers = headers;

  OpenApiParameterStyle? _style;
  OpenApiParameterStyle? get style => _$this._style;
  set style(OpenApiParameterStyle? style) => _$this._style = style;

  bool? _explode;
  bool? get explode => _$this._explode;
  set explode(bool? explode) => _$this._explode = explode;

  bool? _allowReserved;
  bool? get allowReserved => _$this._allowReserved;
  set allowReserved(bool? allowReserved) =>
      _$this._allowReserved = allowReserved;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiEncodingBuilder();

  OpenApiEncodingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contentType = $v.contentType;
      _headers = $v.headers.toBuilder();
      _style = $v.style;
      _explode = $v.explode;
      _allowReserved = $v.allowReserved;
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiEncoding other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiEncoding;
  }

  @override
  void update(void Function(OpenApiEncodingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiEncoding build() => _build();

  _$OpenApiEncoding _build() {
    _$OpenApiEncoding _$result;
    try {
      _$result = _$v ??
          new _$OpenApiEncoding._(
            contentType: BuiltValueNullFieldError.checkNotNull(
                contentType, r'OpenApiEncoding', 'contentType'),
            headers: headers.build(),
            style: style,
            explode: explode,
            allowReserved: allowReserved,
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'headers';
        headers.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiEncoding', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiResponse extends OpenApiResponse {
  @override
  final StatusCodeOrRange? statusCode;
  @override
  final String description;
  @override
  final BuiltMap<String, OpenApiComponentOrRef<OpenApiHeader>>? headers;
  @override
  final BuiltMap<MediaType, OpenApiMediaType>? content;
  @override
  final String? summary;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiResponse([void Function(OpenApiResponseBuilder)? updates]) =>
      (new OpenApiResponseBuilder()..update(updates))._build();

  _$OpenApiResponse._(
      {this.statusCode,
      required this.description,
      this.headers,
      this.content,
      this.summary,
      this.ref,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        description, r'OpenApiResponse', 'description');
  }

  @override
  OpenApiResponse rebuild(void Function(OpenApiResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiResponseBuilder toBuilder() =>
      new OpenApiResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiResponse &&
        statusCode == other.statusCode &&
        description == other.description &&
        headers == other.headers &&
        content == other.content &&
        summary == other.summary &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, statusCode.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, headers.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiResponse')
          ..add('statusCode', statusCode)
          ..add('description', description)
          ..add('headers', headers)
          ..add('content', content)
          ..add('summary', summary)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiResponseBuilder
    implements
        Builder<OpenApiResponse, OpenApiResponseBuilder>,
        OpenApiComponentBuilder<OpenApiResponse> {
  _$OpenApiResponse? _$v;

  StatusCodeOrRange? _statusCode;
  StatusCodeOrRange? get statusCode => _$this._statusCode;
  set statusCode(covariant StatusCodeOrRange? statusCode) =>
      _$this._statusCode = statusCode;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  MapBuilder<String, OpenApiComponentOrRef<OpenApiHeader>>? _headers;
  MapBuilder<String, OpenApiComponentOrRef<OpenApiHeader>> get headers =>
      _$this._headers ??=
          new MapBuilder<String, OpenApiComponentOrRef<OpenApiHeader>>();
  set headers(
          covariant MapBuilder<String, OpenApiComponentOrRef<OpenApiHeader>>?
              headers) =>
      _$this._headers = headers;

  MapBuilder<MediaType, OpenApiMediaType>? _content;
  MapBuilder<MediaType, OpenApiMediaType> get content =>
      _$this._content ??= new MapBuilder<MediaType, OpenApiMediaType>();
  set content(covariant MapBuilder<MediaType, OpenApiMediaType>? content) =>
      _$this._content = content;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(covariant String? summary) => _$this._summary = summary;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(covariant YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiResponseBuilder();

  OpenApiResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _statusCode = $v.statusCode;
      _description = $v.description;
      _headers = $v.headers?.toBuilder();
      _content = $v.content?.toBuilder();
      _summary = $v.summary;
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiResponse;
  }

  @override
  void update(void Function(OpenApiResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiResponse build() => _build();

  _$OpenApiResponse _build() {
    _$OpenApiResponse _$result;
    try {
      _$result = _$v ??
          new _$OpenApiResponse._(
            statusCode: statusCode,
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'OpenApiResponse', 'description'),
            headers: _headers?.build(),
            content: _content?.build(),
            summary: summary,
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'headers';
        _headers?.build();
        _$failedField = 'content';
        _content?.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiHeader extends OpenApiHeader {
  @override
  final OpenApiComponentOrRef<OpenApiSchema> schema;
  @override
  final String? description;
  @override
  final bool? required;
  @override
  final bool? deprecated;
  @override
  final bool? allowEmptyValue;
  @override
  final OpenApiParameterStyle? style;
  @override
  final bool? explode;
  @override
  final bool? allowReserved;
  @override
  final (MediaType, OpenApiMediaType)? content;
  @override
  final String? summary;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiHeader([void Function(OpenApiHeaderBuilder)? updates]) =>
      (new OpenApiHeaderBuilder()..update(updates))._build();

  _$OpenApiHeader._(
      {required this.schema,
      this.description,
      this.required,
      this.deprecated,
      this.allowEmptyValue,
      this.style,
      this.explode,
      this.allowReserved,
      this.content,
      this.summary,
      this.ref,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(schema, r'OpenApiHeader', 'schema');
  }

  @override
  OpenApiHeader rebuild(void Function(OpenApiHeaderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiHeaderBuilder toBuilder() => new OpenApiHeaderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is OpenApiHeader &&
        schema == other.schema &&
        description == other.description &&
        required == other.required &&
        deprecated == other.deprecated &&
        allowEmptyValue == other.allowEmptyValue &&
        style == other.style &&
        explode == other.explode &&
        allowReserved == other.allowReserved &&
        content == _$dynamicOther.content &&
        summary == other.summary &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, allowEmptyValue.hashCode);
    _$hash = $jc(_$hash, style.hashCode);
    _$hash = $jc(_$hash, explode.hashCode);
    _$hash = $jc(_$hash, allowReserved.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiHeader')
          ..add('schema', schema)
          ..add('description', description)
          ..add('required', required)
          ..add('deprecated', deprecated)
          ..add('allowEmptyValue', allowEmptyValue)
          ..add('style', style)
          ..add('explode', explode)
          ..add('allowReserved', allowReserved)
          ..add('content', content)
          ..add('summary', summary)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiHeaderBuilder
    implements
        Builder<OpenApiHeader, OpenApiHeaderBuilder>,
        OpenApiComponentBuilder<OpenApiHeader> {
  _$OpenApiHeader? _$v;

  OpenApiComponentOrRefBuilder<OpenApiSchema>? _schema;
  OpenApiComponentOrRefBuilder<OpenApiSchema> get schema =>
      _$this._schema ??= new OpenApiComponentOrRefBuilder<OpenApiSchema>();
  set schema(covariant OpenApiComponentOrRefBuilder<OpenApiSchema>? schema) =>
      _$this._schema = schema;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _required;
  bool? get required => _$this._required;
  set required(covariant bool? required) => _$this._required = required;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  bool? _allowEmptyValue;
  bool? get allowEmptyValue => _$this._allowEmptyValue;
  set allowEmptyValue(covariant bool? allowEmptyValue) =>
      _$this._allowEmptyValue = allowEmptyValue;

  OpenApiParameterStyle? _style;
  OpenApiParameterStyle? get style => _$this._style;
  set style(covariant OpenApiParameterStyle? style) => _$this._style = style;

  bool? _explode;
  bool? get explode => _$this._explode;
  set explode(covariant bool? explode) => _$this._explode = explode;

  bool? _allowReserved;
  bool? get allowReserved => _$this._allowReserved;
  set allowReserved(covariant bool? allowReserved) =>
      _$this._allowReserved = allowReserved;

  (MediaType, OpenApiMediaType)? _content;
  (MediaType, OpenApiMediaType)? get content => _$this._content;
  set content(covariant (MediaType, OpenApiMediaType)? content) =>
      _$this._content = content;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(covariant String? summary) => _$this._summary = summary;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(covariant YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiHeaderBuilder();

  OpenApiHeaderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _schema = $v.schema.toBuilder();
      _description = $v.description;
      _required = $v.required;
      _deprecated = $v.deprecated;
      _allowEmptyValue = $v.allowEmptyValue;
      _style = $v.style;
      _explode = $v.explode;
      _allowReserved = $v.allowReserved;
      _content = $v.content;
      _summary = $v.summary;
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiHeader other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiHeader;
  }

  @override
  void update(void Function(OpenApiHeaderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiHeader build() => _build();

  _$OpenApiHeader _build() {
    _$OpenApiHeader _$result;
    try {
      _$result = _$v ??
          new _$OpenApiHeader._(
            schema: schema.build(),
            description: description,
            required: required,
            deprecated: deprecated,
            allowEmptyValue: allowEmptyValue,
            style: style,
            explode: explode,
            allowReserved: allowReserved,
            content: content,
            summary: summary,
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'schema';
        schema.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiHeader', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiComponents extends OpenApiComponents {
  @override
  final BuiltMap<String, OpenApiSchema> schemas;
  @override
  final BuiltMap<String, OpenApiResponse> responses;
  @override
  final BuiltMap<String, OpenApiParameter> parameters;
  @override
  final BuiltMap<String, OpenApiRequestBody> requestBodies;
  @override
  final BuiltMap<String, OpenApiHeader> headers;
  @override
  final BuiltMap<String, OpenApiSecurityScheme> securitySchemes;
  @override
  final BuiltMap<String, OpenApiPathItem> paths;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiComponents(
          [void Function(OpenApiComponentsBuilder)? updates]) =>
      (new OpenApiComponentsBuilder()..update(updates))._build();

  _$OpenApiComponents._(
      {required this.schemas,
      required this.responses,
      required this.parameters,
      required this.requestBodies,
      required this.headers,
      required this.securitySchemes,
      required this.paths,
      this.ref,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        schemas, r'OpenApiComponents', 'schemas');
    BuiltValueNullFieldError.checkNotNull(
        responses, r'OpenApiComponents', 'responses');
    BuiltValueNullFieldError.checkNotNull(
        parameters, r'OpenApiComponents', 'parameters');
    BuiltValueNullFieldError.checkNotNull(
        requestBodies, r'OpenApiComponents', 'requestBodies');
    BuiltValueNullFieldError.checkNotNull(
        headers, r'OpenApiComponents', 'headers');
    BuiltValueNullFieldError.checkNotNull(
        securitySchemes, r'OpenApiComponents', 'securitySchemes');
    BuiltValueNullFieldError.checkNotNull(paths, r'OpenApiComponents', 'paths');
  }

  @override
  OpenApiComponents rebuild(void Function(OpenApiComponentsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiComponentsBuilder toBuilder() =>
      new OpenApiComponentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiComponents &&
        schemas == other.schemas &&
        responses == other.responses &&
        parameters == other.parameters &&
        requestBodies == other.requestBodies &&
        headers == other.headers &&
        securitySchemes == other.securitySchemes &&
        paths == other.paths &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, schemas.hashCode);
    _$hash = $jc(_$hash, responses.hashCode);
    _$hash = $jc(_$hash, parameters.hashCode);
    _$hash = $jc(_$hash, requestBodies.hashCode);
    _$hash = $jc(_$hash, headers.hashCode);
    _$hash = $jc(_$hash, securitySchemes.hashCode);
    _$hash = $jc(_$hash, paths.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiComponents')
          ..add('schemas', schemas)
          ..add('responses', responses)
          ..add('parameters', parameters)
          ..add('requestBodies', requestBodies)
          ..add('headers', headers)
          ..add('securitySchemes', securitySchemes)
          ..add('paths', paths)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiComponentsBuilder
    implements Builder<OpenApiComponents, OpenApiComponentsBuilder> {
  _$OpenApiComponents? _$v;

  MapBuilder<String, OpenApiSchema>? _schemas;
  MapBuilder<String, OpenApiSchema> get schemas =>
      _$this._schemas ??= new MapBuilder<String, OpenApiSchema>();
  set schemas(MapBuilder<String, OpenApiSchema>? schemas) =>
      _$this._schemas = schemas;

  MapBuilder<String, OpenApiResponse>? _responses;
  MapBuilder<String, OpenApiResponse> get responses =>
      _$this._responses ??= new MapBuilder<String, OpenApiResponse>();
  set responses(MapBuilder<String, OpenApiResponse>? responses) =>
      _$this._responses = responses;

  MapBuilder<String, OpenApiParameter>? _parameters;
  MapBuilder<String, OpenApiParameter> get parameters =>
      _$this._parameters ??= new MapBuilder<String, OpenApiParameter>();
  set parameters(MapBuilder<String, OpenApiParameter>? parameters) =>
      _$this._parameters = parameters;

  MapBuilder<String, OpenApiRequestBody>? _requestBodies;
  MapBuilder<String, OpenApiRequestBody> get requestBodies =>
      _$this._requestBodies ??= new MapBuilder<String, OpenApiRequestBody>();
  set requestBodies(MapBuilder<String, OpenApiRequestBody>? requestBodies) =>
      _$this._requestBodies = requestBodies;

  MapBuilder<String, OpenApiHeader>? _headers;
  MapBuilder<String, OpenApiHeader> get headers =>
      _$this._headers ??= new MapBuilder<String, OpenApiHeader>();
  set headers(MapBuilder<String, OpenApiHeader>? headers) =>
      _$this._headers = headers;

  MapBuilder<String, OpenApiSecurityScheme>? _securitySchemes;
  MapBuilder<String, OpenApiSecurityScheme> get securitySchemes =>
      _$this._securitySchemes ??=
          new MapBuilder<String, OpenApiSecurityScheme>();
  set securitySchemes(
          MapBuilder<String, OpenApiSecurityScheme>? securitySchemes) =>
      _$this._securitySchemes = securitySchemes;

  MapBuilder<String, OpenApiPathItem>? _paths;
  MapBuilder<String, OpenApiPathItem> get paths =>
      _$this._paths ??= new MapBuilder<String, OpenApiPathItem>();
  set paths(MapBuilder<String, OpenApiPathItem>? paths) =>
      _$this._paths = paths;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiComponentsBuilder();

  OpenApiComponentsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _schemas = $v.schemas.toBuilder();
      _responses = $v.responses.toBuilder();
      _parameters = $v.parameters.toBuilder();
      _requestBodies = $v.requestBodies.toBuilder();
      _headers = $v.headers.toBuilder();
      _securitySchemes = $v.securitySchemes.toBuilder();
      _paths = $v.paths.toBuilder();
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiComponents other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiComponents;
  }

  @override
  void update(void Function(OpenApiComponentsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiComponents build() => _build();

  _$OpenApiComponents _build() {
    _$OpenApiComponents _$result;
    try {
      _$result = _$v ??
          new _$OpenApiComponents._(
            schemas: schemas.build(),
            responses: responses.build(),
            parameters: parameters.build(),
            requestBodies: requestBodies.build(),
            headers: headers.build(),
            securitySchemes: securitySchemes.build(),
            paths: paths.build(),
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'schemas';
        schemas.build();
        _$failedField = 'responses';
        responses.build();
        _$failedField = 'parameters';
        parameters.build();
        _$failedField = 'requestBodies';
        requestBodies.build();
        _$failedField = 'headers';
        headers.build();
        _$failedField = 'securitySchemes';
        securitySchemes.build();
        _$failedField = 'paths';
        paths.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiComponents', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiSchema extends OpenApiSchema {
  @override
  final String? name;
  @override
  final ItemOrList<JsonType>? type;
  @override
  final bool? nullable;
  @override
  final BuiltList<OpenApiComponentOrRef<OpenApiSchema>>? allOf;
  @override
  final BuiltList<OpenApiComponentOrRef<OpenApiSchema>>? oneOf;
  @override
  final BuiltList<OpenApiComponentOrRef<OpenApiSchema>>? anyOf;
  @override
  final OpenApiComponentOrRef<OpenApiSchema>? items;
  @override
  final int? maxItems;
  @override
  final int? minItems;
  @override
  final bool? uniqueItems;
  @override
  final BuiltMap<String, OpenApiComponentOrRef<OpenApiSchema>>? properties;
  @override
  final OpenApiAdditionalProperties? additionalProperties;
  @override
  final int? maxProperties;
  @override
  final int? minProperties;
  @override
  final BuiltSet<String>? required;
  @override
  final JsonTypeFormat? format;
  @override
  final num? multipleOf;
  @override
  final num? maximum;
  @override
  final bool? exclusiveMaximum;
  @override
  final num? minimum;
  @override
  final bool? exclusiveMinimum;
  @override
  final int? maxLength;
  @override
  final int? minLength;
  @override
  final String? pattern;
  @override
  final BuiltSet<Object?>? enumValues;
  @override
  final OpenApiDiscriminator? discriminator;
  @override
  final JsonObject? example;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool? deprecated;
  @override
  final Object? defaultValue;
  @override
  final bool? readOnly;
  @override
  final bool? writeOnly;
  @override
  final String? summary;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiSchema([void Function(OpenApiSchemaBuilder)? updates]) =>
      (new OpenApiSchemaBuilder()..update(updates))._build();

  _$OpenApiSchema._(
      {this.name,
      this.type,
      this.nullable,
      this.allOf,
      this.oneOf,
      this.anyOf,
      this.items,
      this.maxItems,
      this.minItems,
      this.uniqueItems,
      this.properties,
      this.additionalProperties,
      this.maxProperties,
      this.minProperties,
      this.required,
      this.format,
      this.multipleOf,
      this.maximum,
      this.exclusiveMaximum,
      this.minimum,
      this.exclusiveMinimum,
      this.maxLength,
      this.minLength,
      this.pattern,
      this.enumValues,
      this.discriminator,
      this.example,
      this.title,
      this.description,
      this.deprecated,
      this.defaultValue,
      this.readOnly,
      this.writeOnly,
      this.summary,
      this.ref,
      this.node,
      this.extensions})
      : super._();

  @override
  OpenApiSchema rebuild(void Function(OpenApiSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiSchemaBuilder toBuilder() => new OpenApiSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiSchema &&
        name == other.name &&
        type == other.type &&
        nullable == other.nullable &&
        allOf == other.allOf &&
        oneOf == other.oneOf &&
        anyOf == other.anyOf &&
        items == other.items &&
        maxItems == other.maxItems &&
        minItems == other.minItems &&
        uniqueItems == other.uniqueItems &&
        properties == other.properties &&
        additionalProperties == other.additionalProperties &&
        maxProperties == other.maxProperties &&
        minProperties == other.minProperties &&
        required == other.required &&
        format == other.format &&
        multipleOf == other.multipleOf &&
        maximum == other.maximum &&
        exclusiveMaximum == other.exclusiveMaximum &&
        minimum == other.minimum &&
        exclusiveMinimum == other.exclusiveMinimum &&
        maxLength == other.maxLength &&
        minLength == other.minLength &&
        pattern == other.pattern &&
        enumValues == other.enumValues &&
        discriminator == other.discriminator &&
        example == other.example &&
        title == other.title &&
        description == other.description &&
        deprecated == other.deprecated &&
        defaultValue == other.defaultValue &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        summary == other.summary &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, nullable.hashCode);
    _$hash = $jc(_$hash, allOf.hashCode);
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jc(_$hash, anyOf.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, maxItems.hashCode);
    _$hash = $jc(_$hash, minItems.hashCode);
    _$hash = $jc(_$hash, uniqueItems.hashCode);
    _$hash = $jc(_$hash, properties.hashCode);
    _$hash = $jc(_$hash, additionalProperties.hashCode);
    _$hash = $jc(_$hash, maxProperties.hashCode);
    _$hash = $jc(_$hash, minProperties.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, format.hashCode);
    _$hash = $jc(_$hash, multipleOf.hashCode);
    _$hash = $jc(_$hash, maximum.hashCode);
    _$hash = $jc(_$hash, exclusiveMaximum.hashCode);
    _$hash = $jc(_$hash, minimum.hashCode);
    _$hash = $jc(_$hash, exclusiveMinimum.hashCode);
    _$hash = $jc(_$hash, maxLength.hashCode);
    _$hash = $jc(_$hash, minLength.hashCode);
    _$hash = $jc(_$hash, pattern.hashCode);
    _$hash = $jc(_$hash, enumValues.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, example.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiSchema')
          ..add('name', name)
          ..add('type', type)
          ..add('nullable', nullable)
          ..add('allOf', allOf)
          ..add('oneOf', oneOf)
          ..add('anyOf', anyOf)
          ..add('items', items)
          ..add('maxItems', maxItems)
          ..add('minItems', minItems)
          ..add('uniqueItems', uniqueItems)
          ..add('properties', properties)
          ..add('additionalProperties', additionalProperties)
          ..add('maxProperties', maxProperties)
          ..add('minProperties', minProperties)
          ..add('required', required)
          ..add('format', format)
          ..add('multipleOf', multipleOf)
          ..add('maximum', maximum)
          ..add('exclusiveMaximum', exclusiveMaximum)
          ..add('minimum', minimum)
          ..add('exclusiveMinimum', exclusiveMinimum)
          ..add('maxLength', maxLength)
          ..add('minLength', minLength)
          ..add('pattern', pattern)
          ..add('enumValues', enumValues)
          ..add('discriminator', discriminator)
          ..add('example', example)
          ..add('title', title)
          ..add('description', description)
          ..add('deprecated', deprecated)
          ..add('defaultValue', defaultValue)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('summary', summary)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiSchemaBuilder
    implements
        Builder<OpenApiSchema, OpenApiSchemaBuilder>,
        OpenApiComponentBuilder<OpenApiSchema> {
  _$OpenApiSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  ItemOrList<JsonType>? _type;
  ItemOrList<JsonType>? get type => _$this._type;
  set type(covariant ItemOrList<JsonType>? type) => _$this._type = type;

  bool? _nullable;
  bool? get nullable => _$this._nullable;
  set nullable(covariant bool? nullable) => _$this._nullable = nullable;

  ListBuilder<OpenApiComponentOrRef<OpenApiSchema>>? _allOf;
  ListBuilder<OpenApiComponentOrRef<OpenApiSchema>> get allOf =>
      _$this._allOf ??= new ListBuilder<OpenApiComponentOrRef<OpenApiSchema>>();
  set allOf(
          covariant ListBuilder<OpenApiComponentOrRef<OpenApiSchema>>? allOf) =>
      _$this._allOf = allOf;

  ListBuilder<OpenApiComponentOrRef<OpenApiSchema>>? _oneOf;
  ListBuilder<OpenApiComponentOrRef<OpenApiSchema>> get oneOf =>
      _$this._oneOf ??= new ListBuilder<OpenApiComponentOrRef<OpenApiSchema>>();
  set oneOf(
          covariant ListBuilder<OpenApiComponentOrRef<OpenApiSchema>>? oneOf) =>
      _$this._oneOf = oneOf;

  ListBuilder<OpenApiComponentOrRef<OpenApiSchema>>? _anyOf;
  ListBuilder<OpenApiComponentOrRef<OpenApiSchema>> get anyOf =>
      _$this._anyOf ??= new ListBuilder<OpenApiComponentOrRef<OpenApiSchema>>();
  set anyOf(
          covariant ListBuilder<OpenApiComponentOrRef<OpenApiSchema>>? anyOf) =>
      _$this._anyOf = anyOf;

  OpenApiComponentOrRefBuilder<OpenApiSchema>? _items;
  OpenApiComponentOrRefBuilder<OpenApiSchema> get items =>
      _$this._items ??= new OpenApiComponentOrRefBuilder<OpenApiSchema>();
  set items(covariant OpenApiComponentOrRefBuilder<OpenApiSchema>? items) =>
      _$this._items = items;

  int? _maxItems;
  int? get maxItems => _$this._maxItems;
  set maxItems(covariant int? maxItems) => _$this._maxItems = maxItems;

  int? _minItems;
  int? get minItems => _$this._minItems;
  set minItems(covariant int? minItems) => _$this._minItems = minItems;

  bool? _uniqueItems;
  bool? get uniqueItems => _$this._uniqueItems;
  set uniqueItems(covariant bool? uniqueItems) =>
      _$this._uniqueItems = uniqueItems;

  MapBuilder<String, OpenApiComponentOrRef<OpenApiSchema>>? _properties;
  MapBuilder<String, OpenApiComponentOrRef<OpenApiSchema>> get properties =>
      _$this._properties ??=
          new MapBuilder<String, OpenApiComponentOrRef<OpenApiSchema>>();
  set properties(
          covariant MapBuilder<String, OpenApiComponentOrRef<OpenApiSchema>>?
              properties) =>
      _$this._properties = properties;

  OpenApiAdditionalPropertiesBuilder? _additionalProperties;
  OpenApiAdditionalPropertiesBuilder get additionalProperties =>
      _$this._additionalProperties ??= new OpenApiAdditionalPropertiesBuilder();
  set additionalProperties(
          covariant OpenApiAdditionalPropertiesBuilder? additionalProperties) =>
      _$this._additionalProperties = additionalProperties;

  int? _maxProperties;
  int? get maxProperties => _$this._maxProperties;
  set maxProperties(covariant int? maxProperties) =>
      _$this._maxProperties = maxProperties;

  int? _minProperties;
  int? get minProperties => _$this._minProperties;
  set minProperties(covariant int? minProperties) =>
      _$this._minProperties = minProperties;

  SetBuilder<String>? _required;
  SetBuilder<String> get required =>
      _$this._required ??= new SetBuilder<String>();
  set required(covariant SetBuilder<String>? required) =>
      _$this._required = required;

  JsonTypeFormat? _format;
  JsonTypeFormat? get format => _$this._format;
  set format(covariant JsonTypeFormat? format) => _$this._format = format;

  num? _multipleOf;
  num? get multipleOf => _$this._multipleOf;
  set multipleOf(covariant num? multipleOf) => _$this._multipleOf = multipleOf;

  num? _maximum;
  num? get maximum => _$this._maximum;
  set maximum(covariant num? maximum) => _$this._maximum = maximum;

  bool? _exclusiveMaximum;
  bool? get exclusiveMaximum => _$this._exclusiveMaximum;
  set exclusiveMaximum(covariant bool? exclusiveMaximum) =>
      _$this._exclusiveMaximum = exclusiveMaximum;

  num? _minimum;
  num? get minimum => _$this._minimum;
  set minimum(covariant num? minimum) => _$this._minimum = minimum;

  bool? _exclusiveMinimum;
  bool? get exclusiveMinimum => _$this._exclusiveMinimum;
  set exclusiveMinimum(covariant bool? exclusiveMinimum) =>
      _$this._exclusiveMinimum = exclusiveMinimum;

  int? _maxLength;
  int? get maxLength => _$this._maxLength;
  set maxLength(covariant int? maxLength) => _$this._maxLength = maxLength;

  int? _minLength;
  int? get minLength => _$this._minLength;
  set minLength(covariant int? minLength) => _$this._minLength = minLength;

  String? _pattern;
  String? get pattern => _$this._pattern;
  set pattern(covariant String? pattern) => _$this._pattern = pattern;

  SetBuilder<Object?>? _enumValues;
  SetBuilder<Object?> get enumValues =>
      _$this._enumValues ??= new SetBuilder<Object?>();
  set enumValues(covariant SetBuilder<Object?>? enumValues) =>
      _$this._enumValues = enumValues;

  OpenApiDiscriminatorBuilder? _discriminator;
  OpenApiDiscriminatorBuilder get discriminator =>
      _$this._discriminator ??= new OpenApiDiscriminatorBuilder();
  set discriminator(covariant OpenApiDiscriminatorBuilder? discriminator) =>
      _$this._discriminator = discriminator;

  JsonObject? _example;
  JsonObject? get example => _$this._example;
  set example(covariant JsonObject? example) => _$this._example = example;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  Object? _defaultValue;
  Object? get defaultValue => _$this._defaultValue;
  set defaultValue(covariant Object? defaultValue) =>
      _$this._defaultValue = defaultValue;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(covariant String? summary) => _$this._summary = summary;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(covariant YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiSchemaBuilder();

  OpenApiSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _type = $v.type;
      _nullable = $v.nullable;
      _allOf = $v.allOf?.toBuilder();
      _oneOf = $v.oneOf?.toBuilder();
      _anyOf = $v.anyOf?.toBuilder();
      _items = $v.items?.toBuilder();
      _maxItems = $v.maxItems;
      _minItems = $v.minItems;
      _uniqueItems = $v.uniqueItems;
      _properties = $v.properties?.toBuilder();
      _additionalProperties = $v.additionalProperties?.toBuilder();
      _maxProperties = $v.maxProperties;
      _minProperties = $v.minProperties;
      _required = $v.required?.toBuilder();
      _format = $v.format;
      _multipleOf = $v.multipleOf;
      _maximum = $v.maximum;
      _exclusiveMaximum = $v.exclusiveMaximum;
      _minimum = $v.minimum;
      _exclusiveMinimum = $v.exclusiveMinimum;
      _maxLength = $v.maxLength;
      _minLength = $v.minLength;
      _pattern = $v.pattern;
      _enumValues = $v.enumValues?.toBuilder();
      _discriminator = $v.discriminator?.toBuilder();
      _example = $v.example;
      _title = $v.title;
      _description = $v.description;
      _deprecated = $v.deprecated;
      _defaultValue = $v.defaultValue;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _summary = $v.summary;
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiSchema;
  }

  @override
  void update(void Function(OpenApiSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiSchema build() => _build();

  _$OpenApiSchema _build() {
    _$OpenApiSchema _$result;
    try {
      _$result = _$v ??
          new _$OpenApiSchema._(
            name: name,
            type: type,
            nullable: nullable,
            allOf: _allOf?.build(),
            oneOf: _oneOf?.build(),
            anyOf: _anyOf?.build(),
            items: _items?.build(),
            maxItems: maxItems,
            minItems: minItems,
            uniqueItems: uniqueItems,
            properties: _properties?.build(),
            additionalProperties: _additionalProperties?.build(),
            maxProperties: maxProperties,
            minProperties: minProperties,
            required: _required?.build(),
            format: format,
            multipleOf: multipleOf,
            maximum: maximum,
            exclusiveMaximum: exclusiveMaximum,
            minimum: minimum,
            exclusiveMinimum: exclusiveMinimum,
            maxLength: maxLength,
            minLength: minLength,
            pattern: pattern,
            enumValues: _enumValues?.build(),
            discriminator: _discriminator?.build(),
            example: example,
            title: title,
            description: description,
            deprecated: deprecated,
            defaultValue: defaultValue,
            readOnly: readOnly,
            writeOnly: writeOnly,
            summary: summary,
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'allOf';
        _allOf?.build();
        _$failedField = 'oneOf';
        _oneOf?.build();
        _$failedField = 'anyOf';
        _anyOf?.build();
        _$failedField = 'items';
        _items?.build();

        _$failedField = 'properties';
        _properties?.build();
        _$failedField = 'additionalProperties';
        _additionalProperties?.build();

        _$failedField = 'required';
        _required?.build();

        _$failedField = 'enumValues';
        _enumValues?.build();
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiAdditionalProperties extends OpenApiAdditionalProperties {
  @override
  final bool? allow;
  @override
  final OpenApiComponentOrRef<OpenApiSchema>? schema;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiAdditionalProperties(
          [void Function(OpenApiAdditionalPropertiesBuilder)? updates]) =>
      (new OpenApiAdditionalPropertiesBuilder()..update(updates))._build();

  _$OpenApiAdditionalProperties._(
      {this.allow, this.schema, this.ref, this.node, this.extensions})
      : super._();

  @override
  OpenApiAdditionalProperties rebuild(
          void Function(OpenApiAdditionalPropertiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiAdditionalPropertiesBuilder toBuilder() =>
      new OpenApiAdditionalPropertiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiAdditionalProperties &&
        allow == other.allow &&
        schema == other.schema &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, allow.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiAdditionalProperties')
          ..add('allow', allow)
          ..add('schema', schema)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiAdditionalPropertiesBuilder
    implements
        Builder<OpenApiAdditionalProperties,
            OpenApiAdditionalPropertiesBuilder> {
  _$OpenApiAdditionalProperties? _$v;

  bool? _allow;
  bool? get allow => _$this._allow;
  set allow(bool? allow) => _$this._allow = allow;

  OpenApiComponentOrRefBuilder<OpenApiSchema>? _schema;
  OpenApiComponentOrRefBuilder<OpenApiSchema> get schema =>
      _$this._schema ??= new OpenApiComponentOrRefBuilder<OpenApiSchema>();
  set schema(OpenApiComponentOrRefBuilder<OpenApiSchema>? schema) =>
      _$this._schema = schema;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiAdditionalPropertiesBuilder();

  OpenApiAdditionalPropertiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _allow = $v.allow;
      _schema = $v.schema?.toBuilder();
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiAdditionalProperties other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiAdditionalProperties;
  }

  @override
  void update(void Function(OpenApiAdditionalPropertiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiAdditionalProperties build() => _build();

  _$OpenApiAdditionalProperties _build() {
    _$OpenApiAdditionalProperties _$result;
    try {
      _$result = _$v ??
          new _$OpenApiAdditionalProperties._(
            allow: allow,
            schema: _schema?.build(),
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'schema';
        _schema?.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiAdditionalProperties', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiDiscriminator extends OpenApiDiscriminator {
  @override
  final String propertyName;
  @override
  final BuiltMap<String, String>? mapping;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiDiscriminator(
          [void Function(OpenApiDiscriminatorBuilder)? updates]) =>
      (new OpenApiDiscriminatorBuilder()..update(updates))._build();

  _$OpenApiDiscriminator._(
      {required this.propertyName,
      this.mapping,
      this.ref,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        propertyName, r'OpenApiDiscriminator', 'propertyName');
  }

  @override
  OpenApiDiscriminator rebuild(
          void Function(OpenApiDiscriminatorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiDiscriminatorBuilder toBuilder() =>
      new OpenApiDiscriminatorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiDiscriminator &&
        propertyName == other.propertyName &&
        mapping == other.mapping &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, propertyName.hashCode);
    _$hash = $jc(_$hash, mapping.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiDiscriminator')
          ..add('propertyName', propertyName)
          ..add('mapping', mapping)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiDiscriminatorBuilder
    implements Builder<OpenApiDiscriminator, OpenApiDiscriminatorBuilder> {
  _$OpenApiDiscriminator? _$v;

  String? _propertyName;
  String? get propertyName => _$this._propertyName;
  set propertyName(String? propertyName) => _$this._propertyName = propertyName;

  MapBuilder<String, String>? _mapping;
  MapBuilder<String, String> get mapping =>
      _$this._mapping ??= new MapBuilder<String, String>();
  set mapping(MapBuilder<String, String>? mapping) => _$this._mapping = mapping;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiDiscriminatorBuilder();

  OpenApiDiscriminatorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _propertyName = $v.propertyName;
      _mapping = $v.mapping?.toBuilder();
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiDiscriminator other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiDiscriminator;
  }

  @override
  void update(void Function(OpenApiDiscriminatorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiDiscriminator build() => _build();

  _$OpenApiDiscriminator _build() {
    _$OpenApiDiscriminator _$result;
    try {
      _$result = _$v ??
          new _$OpenApiDiscriminator._(
            propertyName: BuiltValueNullFieldError.checkNotNull(
                propertyName, r'OpenApiDiscriminator', 'propertyName'),
            mapping: _mapping?.build(),
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'mapping';
        _mapping?.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiDiscriminator', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiSecurityScheme extends OpenApiSecurityScheme {
  @override
  final OpenApiSecuritySchemeType type;
  @override
  final String? description;
  @override
  final String? name;
  @override
  final OpenApiParameterLocation? location;
  @override
  final String? scheme;
  @override
  final String? bearerFormat;
  @override
  final OpenApiOAuthFlows? flows;
  @override
  final String? openIdConnectUrl;
  @override
  final String? summary;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiSecurityScheme(
          [void Function(OpenApiSecuritySchemeBuilder)? updates]) =>
      (new OpenApiSecuritySchemeBuilder()..update(updates))._build();

  _$OpenApiSecurityScheme._(
      {required this.type,
      this.description,
      this.name,
      this.location,
      this.scheme,
      this.bearerFormat,
      this.flows,
      this.openIdConnectUrl,
      this.summary,
      this.ref,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        type, r'OpenApiSecurityScheme', 'type');
  }

  @override
  OpenApiSecurityScheme rebuild(
          void Function(OpenApiSecuritySchemeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiSecuritySchemeBuilder toBuilder() =>
      new OpenApiSecuritySchemeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiSecurityScheme &&
        type == other.type &&
        description == other.description &&
        name == other.name &&
        location == other.location &&
        scheme == other.scheme &&
        bearerFormat == other.bearerFormat &&
        flows == other.flows &&
        openIdConnectUrl == other.openIdConnectUrl &&
        summary == other.summary &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, scheme.hashCode);
    _$hash = $jc(_$hash, bearerFormat.hashCode);
    _$hash = $jc(_$hash, flows.hashCode);
    _$hash = $jc(_$hash, openIdConnectUrl.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiSecurityScheme')
          ..add('type', type)
          ..add('description', description)
          ..add('name', name)
          ..add('location', location)
          ..add('scheme', scheme)
          ..add('bearerFormat', bearerFormat)
          ..add('flows', flows)
          ..add('openIdConnectUrl', openIdConnectUrl)
          ..add('summary', summary)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiSecuritySchemeBuilder
    implements
        Builder<OpenApiSecurityScheme, OpenApiSecuritySchemeBuilder>,
        OpenApiComponentBuilder<OpenApiSecurityScheme> {
  _$OpenApiSecurityScheme? _$v;

  OpenApiSecuritySchemeType? _type;
  OpenApiSecuritySchemeType? get type => _$this._type;
  set type(covariant OpenApiSecuritySchemeType? type) => _$this._type = type;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  OpenApiParameterLocation? _location;
  OpenApiParameterLocation? get location => _$this._location;
  set location(covariant OpenApiParameterLocation? location) =>
      _$this._location = location;

  String? _scheme;
  String? get scheme => _$this._scheme;
  set scheme(covariant String? scheme) => _$this._scheme = scheme;

  String? _bearerFormat;
  String? get bearerFormat => _$this._bearerFormat;
  set bearerFormat(covariant String? bearerFormat) =>
      _$this._bearerFormat = bearerFormat;

  OpenApiOAuthFlowsBuilder? _flows;
  OpenApiOAuthFlowsBuilder get flows =>
      _$this._flows ??= new OpenApiOAuthFlowsBuilder();
  set flows(covariant OpenApiOAuthFlowsBuilder? flows) => _$this._flows = flows;

  String? _openIdConnectUrl;
  String? get openIdConnectUrl => _$this._openIdConnectUrl;
  set openIdConnectUrl(covariant String? openIdConnectUrl) =>
      _$this._openIdConnectUrl = openIdConnectUrl;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(covariant String? summary) => _$this._summary = summary;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(covariant String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(covariant YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(covariant MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiSecuritySchemeBuilder();

  OpenApiSecuritySchemeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _description = $v.description;
      _name = $v.name;
      _location = $v.location;
      _scheme = $v.scheme;
      _bearerFormat = $v.bearerFormat;
      _flows = $v.flows?.toBuilder();
      _openIdConnectUrl = $v.openIdConnectUrl;
      _summary = $v.summary;
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenApiSecurityScheme other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiSecurityScheme;
  }

  @override
  void update(void Function(OpenApiSecuritySchemeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiSecurityScheme build() => _build();

  _$OpenApiSecurityScheme _build() {
    OpenApiSecurityScheme._validate(this);
    _$OpenApiSecurityScheme _$result;
    try {
      _$result = _$v ??
          new _$OpenApiSecurityScheme._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'OpenApiSecurityScheme', 'type'),
            description: description,
            name: name,
            location: location,
            scheme: scheme,
            bearerFormat: bearerFormat,
            flows: _flows?.build(),
            openIdConnectUrl: openIdConnectUrl,
            summary: summary,
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'flows';
        _flows?.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiSecurityScheme', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiOAuthFlows extends OpenApiOAuthFlows {
  @override
  final OpenApiOAuthFlow? implicit;
  @override
  final OpenApiOAuthFlow? password;
  @override
  final OpenApiOAuthFlow? clientCredentials;
  @override
  final OpenApiOAuthFlow? authorizationCode;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiOAuthFlows(
          [void Function(OpenApiOAuthFlowsBuilder)? updates]) =>
      (new OpenApiOAuthFlowsBuilder()..update(updates))._build();

  _$OpenApiOAuthFlows._(
      {this.implicit,
      this.password,
      this.clientCredentials,
      this.authorizationCode,
      this.ref,
      this.node,
      this.extensions})
      : super._();

  @override
  OpenApiOAuthFlows rebuild(void Function(OpenApiOAuthFlowsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiOAuthFlowsBuilder toBuilder() =>
      new OpenApiOAuthFlowsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiOAuthFlows &&
        implicit == other.implicit &&
        password == other.password &&
        clientCredentials == other.clientCredentials &&
        authorizationCode == other.authorizationCode &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, implicit.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, clientCredentials.hashCode);
    _$hash = $jc(_$hash, authorizationCode.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiOAuthFlows')
          ..add('implicit', implicit)
          ..add('password', password)
          ..add('clientCredentials', clientCredentials)
          ..add('authorizationCode', authorizationCode)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiOAuthFlowsBuilder
    implements Builder<OpenApiOAuthFlows, OpenApiOAuthFlowsBuilder> {
  _$OpenApiOAuthFlows? _$v;

  OpenApiOAuthFlowBuilder? _implicit;
  OpenApiOAuthFlowBuilder get implicit =>
      _$this._implicit ??= new OpenApiOAuthFlowBuilder();
  set implicit(OpenApiOAuthFlowBuilder? implicit) =>
      _$this._implicit = implicit;

  OpenApiOAuthFlowBuilder? _password;
  OpenApiOAuthFlowBuilder get password =>
      _$this._password ??= new OpenApiOAuthFlowBuilder();
  set password(OpenApiOAuthFlowBuilder? password) =>
      _$this._password = password;

  OpenApiOAuthFlowBuilder? _clientCredentials;
  OpenApiOAuthFlowBuilder get clientCredentials =>
      _$this._clientCredentials ??= new OpenApiOAuthFlowBuilder();
  set clientCredentials(OpenApiOAuthFlowBuilder? clientCredentials) =>
      _$this._clientCredentials = clientCredentials;

  OpenApiOAuthFlowBuilder? _authorizationCode;
  OpenApiOAuthFlowBuilder get authorizationCode =>
      _$this._authorizationCode ??= new OpenApiOAuthFlowBuilder();
  set authorizationCode(OpenApiOAuthFlowBuilder? authorizationCode) =>
      _$this._authorizationCode = authorizationCode;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiOAuthFlowsBuilder();

  OpenApiOAuthFlowsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _implicit = $v.implicit?.toBuilder();
      _password = $v.password?.toBuilder();
      _clientCredentials = $v.clientCredentials?.toBuilder();
      _authorizationCode = $v.authorizationCode?.toBuilder();
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiOAuthFlows other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiOAuthFlows;
  }

  @override
  void update(void Function(OpenApiOAuthFlowsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiOAuthFlows build() => _build();

  _$OpenApiOAuthFlows _build() {
    OpenApiOAuthFlows._validate(this);
    _$OpenApiOAuthFlows _$result;
    try {
      _$result = _$v ??
          new _$OpenApiOAuthFlows._(
            implicit: _implicit?.build(),
            password: _password?.build(),
            clientCredentials: _clientCredentials?.build(),
            authorizationCode: _authorizationCode?.build(),
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'implicit';
        _implicit?.build();
        _$failedField = 'password';
        _password?.build();
        _$failedField = 'clientCredentials';
        _clientCredentials?.build();
        _$failedField = 'authorizationCode';
        _authorizationCode?.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiOAuthFlows', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiOAuthFlow extends OpenApiOAuthFlow {
  @override
  final String? authorizationUrl;
  @override
  final String? tokenUrl;
  @override
  final String? refreshUrl;
  @override
  final BuiltMap<String, String> scopes;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiOAuthFlow(
          [void Function(OpenApiOAuthFlowBuilder)? updates]) =>
      (new OpenApiOAuthFlowBuilder()..update(updates))._build();

  _$OpenApiOAuthFlow._(
      {this.authorizationUrl,
      this.tokenUrl,
      this.refreshUrl,
      required this.scopes,
      this.ref,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        scopes, r'OpenApiOAuthFlow', 'scopes');
  }

  @override
  OpenApiOAuthFlow rebuild(void Function(OpenApiOAuthFlowBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiOAuthFlowBuilder toBuilder() =>
      new OpenApiOAuthFlowBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiOAuthFlow &&
        authorizationUrl == other.authorizationUrl &&
        tokenUrl == other.tokenUrl &&
        refreshUrl == other.refreshUrl &&
        scopes == other.scopes &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, authorizationUrl.hashCode);
    _$hash = $jc(_$hash, tokenUrl.hashCode);
    _$hash = $jc(_$hash, refreshUrl.hashCode);
    _$hash = $jc(_$hash, scopes.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiOAuthFlow')
          ..add('authorizationUrl', authorizationUrl)
          ..add('tokenUrl', tokenUrl)
          ..add('refreshUrl', refreshUrl)
          ..add('scopes', scopes)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiOAuthFlowBuilder
    implements Builder<OpenApiOAuthFlow, OpenApiOAuthFlowBuilder> {
  _$OpenApiOAuthFlow? _$v;

  String? _authorizationUrl;
  String? get authorizationUrl => _$this._authorizationUrl;
  set authorizationUrl(String? authorizationUrl) =>
      _$this._authorizationUrl = authorizationUrl;

  String? _tokenUrl;
  String? get tokenUrl => _$this._tokenUrl;
  set tokenUrl(String? tokenUrl) => _$this._tokenUrl = tokenUrl;

  String? _refreshUrl;
  String? get refreshUrl => _$this._refreshUrl;
  set refreshUrl(String? refreshUrl) => _$this._refreshUrl = refreshUrl;

  MapBuilder<String, String>? _scopes;
  MapBuilder<String, String> get scopes =>
      _$this._scopes ??= new MapBuilder<String, String>();
  set scopes(MapBuilder<String, String>? scopes) => _$this._scopes = scopes;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiOAuthFlowBuilder();

  OpenApiOAuthFlowBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _authorizationUrl = $v.authorizationUrl;
      _tokenUrl = $v.tokenUrl;
      _refreshUrl = $v.refreshUrl;
      _scopes = $v.scopes.toBuilder();
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiOAuthFlow other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiOAuthFlow;
  }

  @override
  void update(void Function(OpenApiOAuthFlowBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiOAuthFlow build() => _build();

  _$OpenApiOAuthFlow _build() {
    _$OpenApiOAuthFlow _$result;
    try {
      _$result = _$v ??
          new _$OpenApiOAuthFlow._(
            authorizationUrl: authorizationUrl,
            tokenUrl: tokenUrl,
            refreshUrl: refreshUrl,
            scopes: scopes.build(),
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'scopes';
        scopes.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiOAuthFlow', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiSecurityRequirement extends OpenApiSecurityRequirement {
  @override
  final BuiltMap<String, BuiltList<String>> schemes;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiSecurityRequirement(
          [void Function(OpenApiSecurityRequirementBuilder)? updates]) =>
      (new OpenApiSecurityRequirementBuilder()..update(updates))._build();

  _$OpenApiSecurityRequirement._(
      {required this.schemes, this.ref, this.node, this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        schemes, r'OpenApiSecurityRequirement', 'schemes');
  }

  @override
  OpenApiSecurityRequirement rebuild(
          void Function(OpenApiSecurityRequirementBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiSecurityRequirementBuilder toBuilder() =>
      new OpenApiSecurityRequirementBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiSecurityRequirement &&
        schemes == other.schemes &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, schemes.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiSecurityRequirement')
          ..add('schemes', schemes)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiSecurityRequirementBuilder
    implements
        Builder<OpenApiSecurityRequirement, OpenApiSecurityRequirementBuilder> {
  _$OpenApiSecurityRequirement? _$v;

  MapBuilder<String, BuiltList<String>>? _schemes;
  MapBuilder<String, BuiltList<String>> get schemes =>
      _$this._schemes ??= new MapBuilder<String, BuiltList<String>>();
  set schemes(MapBuilder<String, BuiltList<String>>? schemes) =>
      _$this._schemes = schemes;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiSecurityRequirementBuilder();

  OpenApiSecurityRequirementBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _schemes = $v.schemes.toBuilder();
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiSecurityRequirement other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiSecurityRequirement;
  }

  @override
  void update(void Function(OpenApiSecurityRequirementBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiSecurityRequirement build() => _build();

  _$OpenApiSecurityRequirement _build() {
    _$OpenApiSecurityRequirement _$result;
    try {
      _$result = _$v ??
          new _$OpenApiSecurityRequirement._(
            schemes: schemes.build(),
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'schemes';
        schemes.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiSecurityRequirement', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiTag extends OpenApiTag {
  @override
  final String name;
  @override
  final String? description;
  @override
  final OpenApiExternalDocs? externalDocs;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiTag([void Function(OpenApiTagBuilder)? updates]) =>
      (new OpenApiTagBuilder()..update(updates))._build();

  _$OpenApiTag._(
      {required this.name,
      this.description,
      this.externalDocs,
      this.ref,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'OpenApiTag', 'name');
  }

  @override
  OpenApiTag rebuild(void Function(OpenApiTagBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiTagBuilder toBuilder() => new OpenApiTagBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiTag &&
        name == other.name &&
        description == other.description &&
        externalDocs == other.externalDocs &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, externalDocs.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiTag')
          ..add('name', name)
          ..add('description', description)
          ..add('externalDocs', externalDocs)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiTagBuilder implements Builder<OpenApiTag, OpenApiTagBuilder> {
  _$OpenApiTag? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  OpenApiExternalDocsBuilder? _externalDocs;
  OpenApiExternalDocsBuilder get externalDocs =>
      _$this._externalDocs ??= new OpenApiExternalDocsBuilder();
  set externalDocs(OpenApiExternalDocsBuilder? externalDocs) =>
      _$this._externalDocs = externalDocs;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiTagBuilder();

  OpenApiTagBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _externalDocs = $v.externalDocs?.toBuilder();
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiTag other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiTag;
  }

  @override
  void update(void Function(OpenApiTagBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiTag build() => _build();

  _$OpenApiTag _build() {
    _$OpenApiTag _$result;
    try {
      _$result = _$v ??
          new _$OpenApiTag._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'OpenApiTag', 'name'),
            description: description,
            externalDocs: _externalDocs?.build(),
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'externalDocs';
        _externalDocs?.build();

        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiTag', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiContact extends OpenApiContact {
  @override
  final String? name;
  @override
  final String? url;
  @override
  final String? email;
  @override
  final String? ref;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiContact([void Function(OpenApiContactBuilder)? updates]) =>
      (new OpenApiContactBuilder()..update(updates))._build();

  _$OpenApiContact._(
      {this.name, this.url, this.email, this.ref, this.node, this.extensions})
      : super._();

  @override
  OpenApiContact rebuild(void Function(OpenApiContactBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiContactBuilder toBuilder() =>
      new OpenApiContactBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiContact &&
        name == other.name &&
        url == other.url &&
        email == other.email &&
        ref == other.ref &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiContact')
          ..add('name', name)
          ..add('url', url)
          ..add('email', email)
          ..add('ref', ref)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiContactBuilder
    implements Builder<OpenApiContact, OpenApiContactBuilder> {
  _$OpenApiContact? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiContactBuilder();

  OpenApiContactBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _url = $v.url;
      _email = $v.email;
      _ref = $v.ref;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiContact other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiContact;
  }

  @override
  void update(void Function(OpenApiContactBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiContact build() => _build();

  _$OpenApiContact _build() {
    _$OpenApiContact _$result;
    try {
      _$result = _$v ??
          new _$OpenApiContact._(
            name: name,
            url: url,
            email: email,
            ref: ref,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiContact', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiComponentOrRef<T extends OpenApiComponent<T>>
    extends OpenApiComponentOrRef<T> {
  @override
  final String? ref;
  @override
  final T? component;
  @override
  final OpenApiReference<T>? reference;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiComponentOrRef(
          [void Function(OpenApiComponentOrRefBuilder<T>)? updates]) =>
      (new OpenApiComponentOrRefBuilder<T>()..update(updates))._build();

  _$OpenApiComponentOrRef._(
      {this.ref, this.component, this.reference, this.node, this.extensions})
      : super._() {
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(r'OpenApiComponentOrRef', 'T');
    }
  }

  @override
  OpenApiComponentOrRef<T> rebuild(
          void Function(OpenApiComponentOrRefBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiComponentOrRefBuilder<T> toBuilder() =>
      new OpenApiComponentOrRefBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiComponentOrRef &&
        ref == other.ref &&
        component == other.component &&
        reference == other.reference &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, component.hashCode);
    _$hash = $jc(_$hash, reference.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiComponentOrRef')
          ..add('ref', ref)
          ..add('component', component)
          ..add('reference', reference)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiComponentOrRefBuilder<T extends OpenApiComponent<T>>
    implements
        Builder<OpenApiComponentOrRef<T>, OpenApiComponentOrRefBuilder<T>> {
  _$OpenApiComponentOrRef<T>? _$v;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  T? _component;
  T? get component => _$this._component;
  set component(T? component) => _$this._component = component;

  OpenApiReference<T>? _reference;
  OpenApiReference<T>? get reference => _$this._reference;
  set reference(OpenApiReference<T>? reference) =>
      _$this._reference = reference;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiComponentOrRefBuilder();

  OpenApiComponentOrRefBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _ref = $v.ref;
      _component = $v.component;
      _reference = $v.reference;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiComponentOrRef<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiComponentOrRef<T>;
  }

  @override
  void update(void Function(OpenApiComponentOrRefBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiComponentOrRef<T> build() => _build();

  _$OpenApiComponentOrRef<T> _build() {
    OpenApiComponentOrRef._finalize(this);
    _$OpenApiComponentOrRef<T> _$result;
    try {
      _$result = _$v ??
          new _$OpenApiComponentOrRef<T>._(
            ref: ref,
            component: component,
            reference: reference,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiComponentOrRef', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiHeaderReference extends OpenApiHeaderReference {
  @override
  final String ref;
  @override
  final String name;
  @override
  final String? summary;
  @override
  final String? description;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiHeaderReference(
          [void Function(OpenApiHeaderReferenceBuilder)? updates]) =>
      (new OpenApiHeaderReferenceBuilder()..update(updates))._build();

  _$OpenApiHeaderReference._(
      {required this.ref,
      required this.name,
      this.summary,
      this.description,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ref, r'OpenApiHeaderReference', 'ref');
    BuiltValueNullFieldError.checkNotNull(
        name, r'OpenApiHeaderReference', 'name');
  }

  @override
  OpenApiHeaderReference rebuild(
          void Function(OpenApiHeaderReferenceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiHeaderReferenceBuilder toBuilder() =>
      new OpenApiHeaderReferenceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiHeaderReference &&
        ref == other.ref &&
        name == other.name &&
        summary == other.summary &&
        description == other.description &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiHeaderReference')
          ..add('ref', ref)
          ..add('name', name)
          ..add('summary', summary)
          ..add('description', description)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiHeaderReferenceBuilder
    implements Builder<OpenApiHeaderReference, OpenApiHeaderReferenceBuilder> {
  _$OpenApiHeaderReference? _$v;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiHeaderReferenceBuilder();

  OpenApiHeaderReferenceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ref = $v.ref;
      _name = $v.name;
      _summary = $v.summary;
      _description = $v.description;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiHeaderReference other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiHeaderReference;
  }

  @override
  void update(void Function(OpenApiHeaderReferenceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiHeaderReference build() => _build();

  _$OpenApiHeaderReference _build() {
    _$OpenApiHeaderReference _$result;
    try {
      _$result = _$v ??
          new _$OpenApiHeaderReference._(
            ref: BuiltValueNullFieldError.checkNotNull(
                ref, r'OpenApiHeaderReference', 'ref'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'OpenApiHeaderReference', 'name'),
            summary: summary,
            description: description,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiHeaderReference', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiSchemaReference extends OpenApiSchemaReference {
  @override
  final String ref;
  @override
  final String name;
  @override
  final String? summary;
  @override
  final String? description;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiSchemaReference(
          [void Function(OpenApiSchemaReferenceBuilder)? updates]) =>
      (new OpenApiSchemaReferenceBuilder()..update(updates))._build();

  _$OpenApiSchemaReference._(
      {required this.ref,
      required this.name,
      this.summary,
      this.description,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ref, r'OpenApiSchemaReference', 'ref');
    BuiltValueNullFieldError.checkNotNull(
        name, r'OpenApiSchemaReference', 'name');
  }

  @override
  OpenApiSchemaReference rebuild(
          void Function(OpenApiSchemaReferenceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiSchemaReferenceBuilder toBuilder() =>
      new OpenApiSchemaReferenceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiSchemaReference &&
        ref == other.ref &&
        name == other.name &&
        summary == other.summary &&
        description == other.description &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiSchemaReference')
          ..add('ref', ref)
          ..add('name', name)
          ..add('summary', summary)
          ..add('description', description)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiSchemaReferenceBuilder
    implements Builder<OpenApiSchemaReference, OpenApiSchemaReferenceBuilder> {
  _$OpenApiSchemaReference? _$v;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiSchemaReferenceBuilder();

  OpenApiSchemaReferenceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ref = $v.ref;
      _name = $v.name;
      _summary = $v.summary;
      _description = $v.description;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiSchemaReference other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiSchemaReference;
  }

  @override
  void update(void Function(OpenApiSchemaReferenceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiSchemaReference build() => _build();

  _$OpenApiSchemaReference _build() {
    _$OpenApiSchemaReference _$result;
    try {
      _$result = _$v ??
          new _$OpenApiSchemaReference._(
            ref: BuiltValueNullFieldError.checkNotNull(
                ref, r'OpenApiSchemaReference', 'ref'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'OpenApiSchemaReference', 'name'),
            summary: summary,
            description: description,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiSchemaReference', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiParameterReference extends OpenApiParameterReference {
  @override
  final String ref;
  @override
  final String name;
  @override
  final String? summary;
  @override
  final String? description;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiParameterReference(
          [void Function(OpenApiParameterReferenceBuilder)? updates]) =>
      (new OpenApiParameterReferenceBuilder()..update(updates))._build();

  _$OpenApiParameterReference._(
      {required this.ref,
      required this.name,
      this.summary,
      this.description,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ref, r'OpenApiParameterReference', 'ref');
    BuiltValueNullFieldError.checkNotNull(
        name, r'OpenApiParameterReference', 'name');
  }

  @override
  OpenApiParameterReference rebuild(
          void Function(OpenApiParameterReferenceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiParameterReferenceBuilder toBuilder() =>
      new OpenApiParameterReferenceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiParameterReference &&
        ref == other.ref &&
        name == other.name &&
        summary == other.summary &&
        description == other.description &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiParameterReference')
          ..add('ref', ref)
          ..add('name', name)
          ..add('summary', summary)
          ..add('description', description)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiParameterReferenceBuilder
    implements
        Builder<OpenApiParameterReference, OpenApiParameterReferenceBuilder> {
  _$OpenApiParameterReference? _$v;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiParameterReferenceBuilder();

  OpenApiParameterReferenceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ref = $v.ref;
      _name = $v.name;
      _summary = $v.summary;
      _description = $v.description;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiParameterReference other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiParameterReference;
  }

  @override
  void update(void Function(OpenApiParameterReferenceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiParameterReference build() => _build();

  _$OpenApiParameterReference _build() {
    _$OpenApiParameterReference _$result;
    try {
      _$result = _$v ??
          new _$OpenApiParameterReference._(
            ref: BuiltValueNullFieldError.checkNotNull(
                ref, r'OpenApiParameterReference', 'ref'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'OpenApiParameterReference', 'name'),
            summary: summary,
            description: description,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiParameterReference', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiRequestBodyReference extends OpenApiRequestBodyReference {
  @override
  final String ref;
  @override
  final String name;
  @override
  final String? summary;
  @override
  final String? description;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiRequestBodyReference(
          [void Function(OpenApiRequestBodyReferenceBuilder)? updates]) =>
      (new OpenApiRequestBodyReferenceBuilder()..update(updates))._build();

  _$OpenApiRequestBodyReference._(
      {required this.ref,
      required this.name,
      this.summary,
      this.description,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ref, r'OpenApiRequestBodyReference', 'ref');
    BuiltValueNullFieldError.checkNotNull(
        name, r'OpenApiRequestBodyReference', 'name');
  }

  @override
  OpenApiRequestBodyReference rebuild(
          void Function(OpenApiRequestBodyReferenceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiRequestBodyReferenceBuilder toBuilder() =>
      new OpenApiRequestBodyReferenceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiRequestBodyReference &&
        ref == other.ref &&
        name == other.name &&
        summary == other.summary &&
        description == other.description &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiRequestBodyReference')
          ..add('ref', ref)
          ..add('name', name)
          ..add('summary', summary)
          ..add('description', description)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiRequestBodyReferenceBuilder
    implements
        Builder<OpenApiRequestBodyReference,
            OpenApiRequestBodyReferenceBuilder> {
  _$OpenApiRequestBodyReference? _$v;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiRequestBodyReferenceBuilder();

  OpenApiRequestBodyReferenceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ref = $v.ref;
      _name = $v.name;
      _summary = $v.summary;
      _description = $v.description;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiRequestBodyReference other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiRequestBodyReference;
  }

  @override
  void update(void Function(OpenApiRequestBodyReferenceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiRequestBodyReference build() => _build();

  _$OpenApiRequestBodyReference _build() {
    _$OpenApiRequestBodyReference _$result;
    try {
      _$result = _$v ??
          new _$OpenApiRequestBodyReference._(
            ref: BuiltValueNullFieldError.checkNotNull(
                ref, r'OpenApiRequestBodyReference', 'ref'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'OpenApiRequestBodyReference', 'name'),
            summary: summary,
            description: description,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiRequestBodyReference', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiResponseReference extends OpenApiResponseReference {
  @override
  final String ref;
  @override
  final String name;
  @override
  final String? summary;
  @override
  final String? description;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiResponseReference(
          [void Function(OpenApiResponseReferenceBuilder)? updates]) =>
      (new OpenApiResponseReferenceBuilder()..update(updates))._build();

  _$OpenApiResponseReference._(
      {required this.ref,
      required this.name,
      this.summary,
      this.description,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ref, r'OpenApiResponseReference', 'ref');
    BuiltValueNullFieldError.checkNotNull(
        name, r'OpenApiResponseReference', 'name');
  }

  @override
  OpenApiResponseReference rebuild(
          void Function(OpenApiResponseReferenceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiResponseReferenceBuilder toBuilder() =>
      new OpenApiResponseReferenceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiResponseReference &&
        ref == other.ref &&
        name == other.name &&
        summary == other.summary &&
        description == other.description &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiResponseReference')
          ..add('ref', ref)
          ..add('name', name)
          ..add('summary', summary)
          ..add('description', description)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiResponseReferenceBuilder
    implements
        Builder<OpenApiResponseReference, OpenApiResponseReferenceBuilder> {
  _$OpenApiResponseReference? _$v;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiResponseReferenceBuilder();

  OpenApiResponseReferenceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ref = $v.ref;
      _name = $v.name;
      _summary = $v.summary;
      _description = $v.description;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiResponseReference other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiResponseReference;
  }

  @override
  void update(void Function(OpenApiResponseReferenceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiResponseReference build() => _build();

  _$OpenApiResponseReference _build() {
    _$OpenApiResponseReference _$result;
    try {
      _$result = _$v ??
          new _$OpenApiResponseReference._(
            ref: BuiltValueNullFieldError.checkNotNull(
                ref, r'OpenApiResponseReference', 'ref'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'OpenApiResponseReference', 'name'),
            summary: summary,
            description: description,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiResponseReference', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiPathItemReference extends OpenApiPathItemReference {
  @override
  final String ref;
  @override
  final String name;
  @override
  final String? summary;
  @override
  final String? description;
  @override
  final YamlNode? node;
  @override
  final BuiltMap<String, JsonObject>? extensions;

  factory _$OpenApiPathItemReference(
          [void Function(OpenApiPathItemReferenceBuilder)? updates]) =>
      (new OpenApiPathItemReferenceBuilder()..update(updates))._build();

  _$OpenApiPathItemReference._(
      {required this.ref,
      required this.name,
      this.summary,
      this.description,
      this.node,
      this.extensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ref, r'OpenApiPathItemReference', 'ref');
    BuiltValueNullFieldError.checkNotNull(
        name, r'OpenApiPathItemReference', 'name');
  }

  @override
  OpenApiPathItemReference rebuild(
          void Function(OpenApiPathItemReferenceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiPathItemReferenceBuilder toBuilder() =>
      new OpenApiPathItemReferenceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiPathItemReference &&
        ref == other.ref &&
        name == other.name &&
        summary == other.summary &&
        description == other.description &&
        node == other.node &&
        extensions == other.extensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, node.hashCode);
    _$hash = $jc(_$hash, extensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiPathItemReference')
          ..add('ref', ref)
          ..add('name', name)
          ..add('summary', summary)
          ..add('description', description)
          ..add('node', node)
          ..add('extensions', extensions))
        .toString();
  }
}

class OpenApiPathItemReferenceBuilder
    implements
        Builder<OpenApiPathItemReference, OpenApiPathItemReferenceBuilder> {
  _$OpenApiPathItemReference? _$v;

  String? _ref;
  String? get ref => _$this._ref;
  set ref(String? ref) => _$this._ref = ref;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  YamlNode? _node;
  YamlNode? get node => _$this._node;
  set node(YamlNode? node) => _$this._node = node;

  MapBuilder<String, JsonObject>? _extensions;
  MapBuilder<String, JsonObject> get extensions =>
      _$this._extensions ??= new MapBuilder<String, JsonObject>();
  set extensions(MapBuilder<String, JsonObject>? extensions) =>
      _$this._extensions = extensions;

  OpenApiPathItemReferenceBuilder();

  OpenApiPathItemReferenceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ref = $v.ref;
      _name = $v.name;
      _summary = $v.summary;
      _description = $v.description;
      _node = $v.node;
      _extensions = $v.extensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiPathItemReference other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiPathItemReference;
  }

  @override
  void update(void Function(OpenApiPathItemReferenceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiPathItemReference build() => _build();

  _$OpenApiPathItemReference _build() {
    _$OpenApiPathItemReference _$result;
    try {
      _$result = _$v ??
          new _$OpenApiPathItemReference._(
            ref: BuiltValueNullFieldError.checkNotNull(
                ref, r'OpenApiPathItemReference', 'ref'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'OpenApiPathItemReference', 'name'),
            summary: summary,
            description: description,
            node: node,
            extensions: _extensions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'extensions';
        _extensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiPathItemReference', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
