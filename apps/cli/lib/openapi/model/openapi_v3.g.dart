// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openapi_v3.dart';

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
  final BuiltMap<String, OpenApiPathItem> paths;
  @override
  final OpenApiComponents components;

  factory _$OpenApiDocument([void Function(OpenApiDocumentBuilder)? updates]) =>
      (new OpenApiDocumentBuilder()..update(updates))._build();

  _$OpenApiDocument._(
      {required this.version,
      required this.info,
      this.jsonSchemaDialect,
      required this.servers,
      required this.paths,
      required this.components})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        version, r'OpenApiDocument', 'version');
    BuiltValueNullFieldError.checkNotNull(info, r'OpenApiDocument', 'info');
    BuiltValueNullFieldError.checkNotNull(
        servers, r'OpenApiDocument', 'servers');
    BuiltValueNullFieldError.checkNotNull(paths, r'OpenApiDocument', 'paths');
    BuiltValueNullFieldError.checkNotNull(
        components, r'OpenApiDocument', 'components');
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
        components == other.components;
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
          ..add('components', components))
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

  MapBuilder<String, OpenApiPathItem>? _paths;
  MapBuilder<String, OpenApiPathItem> get paths =>
      _$this._paths ??= new MapBuilder<String, OpenApiPathItem>();
  set paths(MapBuilder<String, OpenApiPathItem>? paths) =>
      _$this._paths = paths;

  OpenApiComponentsBuilder? _components;
  OpenApiComponentsBuilder get components =>
      _$this._components ??= new OpenApiComponentsBuilder();
  set components(OpenApiComponentsBuilder? components) =>
      _$this._components = components;

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
              components: components.build());
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

  factory _$OpenApiInfo([void Function(OpenApiInfoBuilder)? updates]) =>
      (new OpenApiInfoBuilder()..update(updates))._build();

  _$OpenApiInfo._({this.title, this.description, this.apiVersion}) : super._();

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
        apiVersion == other.apiVersion;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, apiVersion.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiInfo')
          ..add('title', title)
          ..add('description', description)
          ..add('apiVersion', apiVersion))
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

  OpenApiInfoBuilder();

  OpenApiInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _apiVersion = $v.apiVersion;
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
    final _$result = _$v ??
        new _$OpenApiInfo._(
            title: title, description: description, apiVersion: apiVersion);
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

  factory _$OpenApiServer([void Function(OpenApiServerBuilder)? updates]) =>
      (new OpenApiServerBuilder()..update(updates))._build();

  _$OpenApiServer._(
      {required this.url, this.description, required this.variables})
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
        variables == other.variables;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, variables.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiServer')
          ..add('url', url)
          ..add('description', description)
          ..add('variables', variables))
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

  OpenApiServerBuilder();

  OpenApiServerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _description = $v.description;
      _variables = $v.variables.toBuilder();
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
              variables: variables.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'variables';
        variables.build();
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

  factory _$OpenApiServerVariable(
          [void Function(OpenApiServerVariableBuilder)? updates]) =>
      (new OpenApiServerVariableBuilder()..update(updates))._build();

  _$OpenApiServerVariable._(
      {required this.name,
      this.enumValues,
      required this.defaultValue,
      this.description})
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
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, enumValues.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiServerVariable')
          ..add('name', name)
          ..add('enumValues', enumValues)
          ..add('defaultValue', defaultValue)
          ..add('description', description))
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

  OpenApiServerVariableBuilder();

  OpenApiServerVariableBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _enumValues = $v.enumValues?.toBuilder();
      _defaultValue = $v.defaultValue;
      _description = $v.description;
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
              description: description);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'enumValues';
        _enumValues?.build();
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
  final String path;
  @override
  final String? summary;
  @override
  final String? description;
  @override
  final BuiltMap<OpenApiOperationType, OpenApiOperation> operations;
  @override
  final BuiltList<OpenApiServer>? servers;
  @override
  final BuiltList<OpenApiParameter> parameters;

  factory _$OpenApiPathItem([void Function(OpenApiPathItemBuilder)? updates]) =>
      (new OpenApiPathItemBuilder()..update(updates))._build();

  _$OpenApiPathItem._(
      {required this.path,
      this.summary,
      this.description,
      required this.operations,
      this.servers,
      required this.parameters})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(path, r'OpenApiPathItem', 'path');
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
        path == other.path &&
        summary == other.summary &&
        description == other.description &&
        operations == other.operations &&
        servers == other.servers &&
        parameters == other.parameters;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, path.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, operations.hashCode);
    _$hash = $jc(_$hash, servers.hashCode);
    _$hash = $jc(_$hash, parameters.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiPathItem')
          ..add('path', path)
          ..add('summary', summary)
          ..add('description', description)
          ..add('operations', operations)
          ..add('servers', servers)
          ..add('parameters', parameters))
        .toString();
  }
}

class OpenApiPathItemBuilder
    implements Builder<OpenApiPathItem, OpenApiPathItemBuilder> {
  _$OpenApiPathItem? _$v;

  String? _path;
  String? get path => _$this._path;
  set path(String? path) => _$this._path = path;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  MapBuilder<OpenApiOperationType, OpenApiOperation>? _operations;
  MapBuilder<OpenApiOperationType, OpenApiOperation> get operations =>
      _$this._operations ??=
          new MapBuilder<OpenApiOperationType, OpenApiOperation>();
  set operations(
          MapBuilder<OpenApiOperationType, OpenApiOperation>? operations) =>
      _$this._operations = operations;

  ListBuilder<OpenApiServer>? _servers;
  ListBuilder<OpenApiServer> get servers =>
      _$this._servers ??= new ListBuilder<OpenApiServer>();
  set servers(ListBuilder<OpenApiServer>? servers) => _$this._servers = servers;

  ListBuilder<OpenApiParameter>? _parameters;
  ListBuilder<OpenApiParameter> get parameters =>
      _$this._parameters ??= new ListBuilder<OpenApiParameter>();
  set parameters(ListBuilder<OpenApiParameter>? parameters) =>
      _$this._parameters = parameters;

  OpenApiPathItemBuilder();

  OpenApiPathItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _path = $v.path;
      _summary = $v.summary;
      _description = $v.description;
      _operations = $v.operations.toBuilder();
      _servers = $v.servers?.toBuilder();
      _parameters = $v.parameters.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiPathItem other) {
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
              path: BuiltValueNullFieldError.checkNotNull(
                  path, r'OpenApiPathItem', 'path'),
              summary: summary,
              description: description,
              operations: operations.build(),
              servers: _servers?.build(),
              parameters: parameters.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'operations';
        operations.build();
        _$failedField = 'servers';
        _servers?.build();
        _$failedField = 'parameters';
        parameters.build();
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
  final String path;
  @override
  final OpenApiOperationType type;
  @override
  final String name;
  @override
  final BuiltList<String> tags;
  @override
  final String? summary;
  @override
  final String? description;
  @override
  final String? operationId;
  @override
  final BuiltList<OpenApiParameter> parameters;
  @override
  final OpenApiRequestBody? requestBody;
  @override
  final BuiltMap<int, OpenApiResponse> responses;
  @override
  final OpenApiResponse? defaultResponse;
  @override
  final bool deprecated;
  @override
  final BuiltList<OpenApiServer>? servers;

  factory _$OpenApiOperation(
          [void Function(OpenApiOperationBuilder)? updates]) =>
      (new OpenApiOperationBuilder()..update(updates))._build();

  _$OpenApiOperation._(
      {required this.path,
      required this.type,
      required this.name,
      required this.tags,
      this.summary,
      this.description,
      this.operationId,
      required this.parameters,
      this.requestBody,
      required this.responses,
      this.defaultResponse,
      required this.deprecated,
      this.servers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(path, r'OpenApiOperation', 'path');
    BuiltValueNullFieldError.checkNotNull(type, r'OpenApiOperation', 'type');
    BuiltValueNullFieldError.checkNotNull(name, r'OpenApiOperation', 'name');
    BuiltValueNullFieldError.checkNotNull(tags, r'OpenApiOperation', 'tags');
    BuiltValueNullFieldError.checkNotNull(
        parameters, r'OpenApiOperation', 'parameters');
    BuiltValueNullFieldError.checkNotNull(
        responses, r'OpenApiOperation', 'responses');
    BuiltValueNullFieldError.checkNotNull(
        deprecated, r'OpenApiOperation', 'deprecated');
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
        path == other.path &&
        type == other.type &&
        name == other.name &&
        tags == other.tags &&
        summary == other.summary &&
        description == other.description &&
        operationId == other.operationId &&
        parameters == other.parameters &&
        requestBody == other.requestBody &&
        responses == other.responses &&
        defaultResponse == other.defaultResponse &&
        deprecated == other.deprecated &&
        servers == other.servers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, path.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
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
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiOperation')
          ..add('path', path)
          ..add('type', type)
          ..add('name', name)
          ..add('tags', tags)
          ..add('summary', summary)
          ..add('description', description)
          ..add('operationId', operationId)
          ..add('parameters', parameters)
          ..add('requestBody', requestBody)
          ..add('responses', responses)
          ..add('defaultResponse', defaultResponse)
          ..add('deprecated', deprecated)
          ..add('servers', servers))
        .toString();
  }
}

class OpenApiOperationBuilder
    implements Builder<OpenApiOperation, OpenApiOperationBuilder> {
  _$OpenApiOperation? _$v;

  String? _path;
  String? get path => _$this._path;
  set path(String? path) => _$this._path = path;

  OpenApiOperationType? _type;
  OpenApiOperationType? get type => _$this._type;
  set type(OpenApiOperationType? type) => _$this._type = type;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

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

  ListBuilder<OpenApiParameter>? _parameters;
  ListBuilder<OpenApiParameter> get parameters =>
      _$this._parameters ??= new ListBuilder<OpenApiParameter>();
  set parameters(ListBuilder<OpenApiParameter>? parameters) =>
      _$this._parameters = parameters;

  OpenApiRequestBodyBuilder? _requestBody;
  OpenApiRequestBodyBuilder get requestBody =>
      _$this._requestBody ??= new OpenApiRequestBodyBuilder();
  set requestBody(OpenApiRequestBodyBuilder? requestBody) =>
      _$this._requestBody = requestBody;

  MapBuilder<int, OpenApiResponse>? _responses;
  MapBuilder<int, OpenApiResponse> get responses =>
      _$this._responses ??= new MapBuilder<int, OpenApiResponse>();
  set responses(MapBuilder<int, OpenApiResponse>? responses) =>
      _$this._responses = responses;

  OpenApiResponseBuilder? _defaultResponse;
  OpenApiResponseBuilder get defaultResponse =>
      _$this._defaultResponse ??= new OpenApiResponseBuilder();
  set defaultResponse(OpenApiResponseBuilder? defaultResponse) =>
      _$this._defaultResponse = defaultResponse;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(bool? deprecated) => _$this._deprecated = deprecated;

  ListBuilder<OpenApiServer>? _servers;
  ListBuilder<OpenApiServer> get servers =>
      _$this._servers ??= new ListBuilder<OpenApiServer>();
  set servers(ListBuilder<OpenApiServer>? servers) => _$this._servers = servers;

  OpenApiOperationBuilder();

  OpenApiOperationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _path = $v.path;
      _type = $v.type;
      _name = $v.name;
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
              path: BuiltValueNullFieldError.checkNotNull(
                  path, r'OpenApiOperation', 'path'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'OpenApiOperation', 'type'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'OpenApiOperation', 'name'),
              tags: tags.build(),
              summary: summary,
              description: description,
              operationId: operationId,
              parameters: parameters.build(),
              requestBody: _requestBody?.build(),
              responses: responses.build(),
              defaultResponse: _defaultResponse?.build(),
              deprecated: BuiltValueNullFieldError.checkNotNull(
                  deprecated, r'OpenApiOperation', 'deprecated'),
              servers: _servers?.build());
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
  final bool required;
  @override
  final bool deprecated;
  @override
  final bool allowEmptyValue;
  @override
  final OpenApiParameterStyle? style;
  @override
  final bool? explode;
  @override
  final bool? allowReserved;
  @override
  final OpenApiTypeSchema? schema;
  @override
  final (MediaType, OpenApiMediaType)? content;

  factory _$OpenApiParameter(
          [void Function(OpenApiParameterBuilder)? updates]) =>
      (new OpenApiParameterBuilder()..update(updates))._build();

  _$OpenApiParameter._(
      {required this.name,
      required this.location,
      this.description,
      required this.required,
      required this.deprecated,
      required this.allowEmptyValue,
      this.style,
      this.explode,
      this.allowReserved,
      this.schema,
      this.content})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'OpenApiParameter', 'name');
    BuiltValueNullFieldError.checkNotNull(
        location, r'OpenApiParameter', 'location');
    BuiltValueNullFieldError.checkNotNull(
        required, r'OpenApiParameter', 'required');
    BuiltValueNullFieldError.checkNotNull(
        deprecated, r'OpenApiParameter', 'deprecated');
    BuiltValueNullFieldError.checkNotNull(
        allowEmptyValue, r'OpenApiParameter', 'allowEmptyValue');
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
        content == _$dynamicOther.content;
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
          ..add('content', content))
        .toString();
  }
}

class OpenApiParameterBuilder
    implements Builder<OpenApiParameter, OpenApiParameterBuilder> {
  _$OpenApiParameter? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  OpenApiParameterLocation? _location;
  OpenApiParameterLocation? get location => _$this._location;
  set location(OpenApiParameterLocation? location) =>
      _$this._location = location;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _required;
  bool? get required => _$this._required;
  set required(bool? required) => _$this._required = required;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(bool? deprecated) => _$this._deprecated = deprecated;

  bool? _allowEmptyValue;
  bool? get allowEmptyValue => _$this._allowEmptyValue;
  set allowEmptyValue(bool? allowEmptyValue) =>
      _$this._allowEmptyValue = allowEmptyValue;

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

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(OpenApiTypeSchema? schema) => _$this._schema = schema;

  (MediaType, OpenApiMediaType)? _content;
  (MediaType, OpenApiMediaType)? get content => _$this._content;
  set content((MediaType, OpenApiMediaType)? content) =>
      _$this._content = content;

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
      _schema = $v.schema;
      _content = $v.content;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiParameter other) {
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
    final _$result = _$v ??
        new _$OpenApiParameter._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'OpenApiParameter', 'name'),
            location: BuiltValueNullFieldError.checkNotNull(
                location, r'OpenApiParameter', 'location'),
            description: description,
            required: BuiltValueNullFieldError.checkNotNull(
                required, r'OpenApiParameter', 'required'),
            deprecated: BuiltValueNullFieldError.checkNotNull(
                deprecated, r'OpenApiParameter', 'deprecated'),
            allowEmptyValue: BuiltValueNullFieldError.checkNotNull(
                allowEmptyValue, r'OpenApiParameter', 'allowEmptyValue'),
            style: style,
            explode: explode,
            allowReserved: allowReserved,
            schema: schema,
            content: content);
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiMediaType extends OpenApiMediaType {
  @override
  final MediaType contentType;
  @override
  final OpenApiTypeSchema schema;
  @override
  final BuiltMap<String, OpenApiEncoding> encoding;

  factory _$OpenApiMediaType(
          [void Function(OpenApiMediaTypeBuilder)? updates]) =>
      (new OpenApiMediaTypeBuilder()..update(updates))._build();

  _$OpenApiMediaType._(
      {required this.contentType, required this.schema, required this.encoding})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        contentType, r'OpenApiMediaType', 'contentType');
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
        contentType == other.contentType &&
        schema == other.schema &&
        encoding == other.encoding;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, contentType.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, encoding.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiMediaType')
          ..add('contentType', contentType)
          ..add('schema', schema)
          ..add('encoding', encoding))
        .toString();
  }
}

class OpenApiMediaTypeBuilder
    implements Builder<OpenApiMediaType, OpenApiMediaTypeBuilder> {
  _$OpenApiMediaType? _$v;

  MediaType? _contentType;
  MediaType? get contentType => _$this._contentType;
  set contentType(MediaType? contentType) => _$this._contentType = contentType;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(OpenApiTypeSchema? schema) => _$this._schema = schema;

  MapBuilder<String, OpenApiEncoding>? _encoding;
  MapBuilder<String, OpenApiEncoding> get encoding =>
      _$this._encoding ??= new MapBuilder<String, OpenApiEncoding>();
  set encoding(MapBuilder<String, OpenApiEncoding>? encoding) =>
      _$this._encoding = encoding;

  OpenApiMediaTypeBuilder();

  OpenApiMediaTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contentType = $v.contentType;
      _schema = $v.schema;
      _encoding = $v.encoding.toBuilder();
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
              contentType: BuiltValueNullFieldError.checkNotNull(
                  contentType, r'OpenApiMediaType', 'contentType'),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'OpenApiMediaType', 'schema'),
              encoding: encoding.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'encoding';
        encoding.build();
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
  final bool required;

  factory _$OpenApiRequestBody(
          [void Function(OpenApiRequestBodyBuilder)? updates]) =>
      (new OpenApiRequestBodyBuilder()..update(updates))._build();

  _$OpenApiRequestBody._(
      {required this.content, this.description, required this.required})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        content, r'OpenApiRequestBody', 'content');
    BuiltValueNullFieldError.checkNotNull(
        required, r'OpenApiRequestBody', 'required');
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
        required == other.required;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiRequestBody')
          ..add('content', content)
          ..add('description', description)
          ..add('required', required))
        .toString();
  }
}

class OpenApiRequestBodyBuilder
    implements Builder<OpenApiRequestBody, OpenApiRequestBodyBuilder> {
  _$OpenApiRequestBody? _$v;

  MapBuilder<MediaType, OpenApiMediaType>? _content;
  MapBuilder<MediaType, OpenApiMediaType> get content =>
      _$this._content ??= new MapBuilder<MediaType, OpenApiMediaType>();
  set content(MapBuilder<MediaType, OpenApiMediaType>? content) =>
      _$this._content = content;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _required;
  bool? get required => _$this._required;
  set required(bool? required) => _$this._required = required;

  OpenApiRequestBodyBuilder();

  OpenApiRequestBodyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _content = $v.content.toBuilder();
      _description = $v.description;
      _required = $v.required;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiRequestBody other) {
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
              required: BuiltValueNullFieldError.checkNotNull(
                  required, r'OpenApiRequestBody', 'required'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'content';
        content.build();
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
  final BuiltMap<String, OpenApiHeader> headers;
  @override
  final OpenApiParameterStyle? style;
  @override
  final bool explode;
  @override
  final bool allowReserved;

  factory _$OpenApiEncoding([void Function(OpenApiEncodingBuilder)? updates]) =>
      (new OpenApiEncodingBuilder()..update(updates))._build();

  _$OpenApiEncoding._(
      {required this.contentType,
      required this.headers,
      this.style,
      required this.explode,
      required this.allowReserved})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        contentType, r'OpenApiEncoding', 'contentType');
    BuiltValueNullFieldError.checkNotNull(
        headers, r'OpenApiEncoding', 'headers');
    BuiltValueNullFieldError.checkNotNull(
        explode, r'OpenApiEncoding', 'explode');
    BuiltValueNullFieldError.checkNotNull(
        allowReserved, r'OpenApiEncoding', 'allowReserved');
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
        allowReserved == other.allowReserved;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, contentType.hashCode);
    _$hash = $jc(_$hash, headers.hashCode);
    _$hash = $jc(_$hash, style.hashCode);
    _$hash = $jc(_$hash, explode.hashCode);
    _$hash = $jc(_$hash, allowReserved.hashCode);
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
          ..add('allowReserved', allowReserved))
        .toString();
  }
}

class OpenApiEncodingBuilder
    implements Builder<OpenApiEncoding, OpenApiEncodingBuilder> {
  _$OpenApiEncoding? _$v;

  MediaType? _contentType;
  MediaType? get contentType => _$this._contentType;
  set contentType(MediaType? contentType) => _$this._contentType = contentType;

  MapBuilder<String, OpenApiHeader>? _headers;
  MapBuilder<String, OpenApiHeader> get headers =>
      _$this._headers ??= new MapBuilder<String, OpenApiHeader>();
  set headers(MapBuilder<String, OpenApiHeader>? headers) =>
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

  OpenApiEncodingBuilder();

  OpenApiEncodingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contentType = $v.contentType;
      _headers = $v.headers.toBuilder();
      _style = $v.style;
      _explode = $v.explode;
      _allowReserved = $v.allowReserved;
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
    OpenApiEncoding._validate(this);
    _$OpenApiEncoding _$result;
    try {
      _$result = _$v ??
          new _$OpenApiEncoding._(
              contentType: BuiltValueNullFieldError.checkNotNull(
                  contentType, r'OpenApiEncoding', 'contentType'),
              headers: headers.build(),
              style: style,
              explode: BuiltValueNullFieldError.checkNotNull(
                  explode, r'OpenApiEncoding', 'explode'),
              allowReserved: BuiltValueNullFieldError.checkNotNull(
                  allowReserved, r'OpenApiEncoding', 'allowReserved'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'headers';
        headers.build();
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
  final String description;
  @override
  final BuiltMap<String, OpenApiHeader> headers;
  @override
  final BuiltMap<MediaType, OpenApiMediaType> content;

  factory _$OpenApiResponse([void Function(OpenApiResponseBuilder)? updates]) =>
      (new OpenApiResponseBuilder()..update(updates))._build();

  _$OpenApiResponse._(
      {required this.description, required this.headers, required this.content})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        description, r'OpenApiResponse', 'description');
    BuiltValueNullFieldError.checkNotNull(
        headers, r'OpenApiResponse', 'headers');
    BuiltValueNullFieldError.checkNotNull(
        content, r'OpenApiResponse', 'content');
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
        description == other.description &&
        headers == other.headers &&
        content == other.content;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, headers.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiResponse')
          ..add('description', description)
          ..add('headers', headers)
          ..add('content', content))
        .toString();
  }
}

class OpenApiResponseBuilder
    implements Builder<OpenApiResponse, OpenApiResponseBuilder> {
  _$OpenApiResponse? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  MapBuilder<String, OpenApiHeader>? _headers;
  MapBuilder<String, OpenApiHeader> get headers =>
      _$this._headers ??= new MapBuilder<String, OpenApiHeader>();
  set headers(MapBuilder<String, OpenApiHeader>? headers) =>
      _$this._headers = headers;

  MapBuilder<MediaType, OpenApiMediaType>? _content;
  MapBuilder<MediaType, OpenApiMediaType> get content =>
      _$this._content ??= new MapBuilder<MediaType, OpenApiMediaType>();
  set content(MapBuilder<MediaType, OpenApiMediaType>? content) =>
      _$this._content = content;

  OpenApiResponseBuilder();

  OpenApiResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _headers = $v.headers.toBuilder();
      _content = $v.content.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiResponse other) {
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
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'OpenApiResponse', 'description'),
              headers: headers.build(),
              content: content.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'headers';
        headers.build();
        _$failedField = 'content';
        content.build();
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
  final OpenApiTypeSchema schema;
  @override
  final String? description;
  @override
  final bool required;
  @override
  final bool deprecated;
  @override
  final bool allowEmptyValue;
  @override
  final OpenApiParameterStyle? style;
  @override
  final bool? explode;
  @override
  final bool? allowReserved;

  factory _$OpenApiHeader([void Function(OpenApiHeaderBuilder)? updates]) =>
      (new OpenApiHeaderBuilder()..update(updates))._build();

  _$OpenApiHeader._(
      {required this.schema,
      this.description,
      required this.required,
      required this.deprecated,
      required this.allowEmptyValue,
      this.style,
      this.explode,
      this.allowReserved})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(schema, r'OpenApiHeader', 'schema');
    BuiltValueNullFieldError.checkNotNull(
        required, r'OpenApiHeader', 'required');
    BuiltValueNullFieldError.checkNotNull(
        deprecated, r'OpenApiHeader', 'deprecated');
    BuiltValueNullFieldError.checkNotNull(
        allowEmptyValue, r'OpenApiHeader', 'allowEmptyValue');
  }

  @override
  OpenApiHeader rebuild(void Function(OpenApiHeaderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiHeaderBuilder toBuilder() => new OpenApiHeaderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiHeader &&
        schema == other.schema &&
        description == other.description &&
        required == other.required &&
        deprecated == other.deprecated &&
        allowEmptyValue == other.allowEmptyValue &&
        style == other.style &&
        explode == other.explode &&
        allowReserved == other.allowReserved;
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
          ..add('allowReserved', allowReserved))
        .toString();
  }
}

class OpenApiHeaderBuilder
    implements Builder<OpenApiHeader, OpenApiHeaderBuilder> {
  _$OpenApiHeader? _$v;

  OpenApiTypeSchema? _schema;
  OpenApiTypeSchema? get schema => _$this._schema;
  set schema(OpenApiTypeSchema? schema) => _$this._schema = schema;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _required;
  bool? get required => _$this._required;
  set required(bool? required) => _$this._required = required;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(bool? deprecated) => _$this._deprecated = deprecated;

  bool? _allowEmptyValue;
  bool? get allowEmptyValue => _$this._allowEmptyValue;
  set allowEmptyValue(bool? allowEmptyValue) =>
      _$this._allowEmptyValue = allowEmptyValue;

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

  OpenApiHeaderBuilder();

  OpenApiHeaderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _schema = $v.schema;
      _description = $v.description;
      _required = $v.required;
      _deprecated = $v.deprecated;
      _allowEmptyValue = $v.allowEmptyValue;
      _style = $v.style;
      _explode = $v.explode;
      _allowReserved = $v.allowReserved;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiHeader other) {
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
    OpenApiHeader._validate(this);
    final _$result = _$v ??
        new _$OpenApiHeader._(
            schema: BuiltValueNullFieldError.checkNotNull(
                schema, r'OpenApiHeader', 'schema'),
            description: description,
            required: BuiltValueNullFieldError.checkNotNull(
                required, r'OpenApiHeader', 'required'),
            deprecated: BuiltValueNullFieldError.checkNotNull(
                deprecated, r'OpenApiHeader', 'deprecated'),
            allowEmptyValue: BuiltValueNullFieldError.checkNotNull(
                allowEmptyValue, r'OpenApiHeader', 'allowEmptyValue'),
            style: style,
            explode: explode,
            allowReserved: allowReserved);
    replace(_$result);
    return _$result;
  }
}

class _$OpenApiComponents extends OpenApiComponents {
  @override
  final BuiltMap<String, OpenApiTypeSchema> schemas;
  @override
  final BuiltMap<String, OpenApiResponse> responses;
  @override
  final BuiltMap<String, OpenApiParameter> parameters;
  @override
  final BuiltMap<String, OpenApiRequestBody> requestBodies;
  @override
  final BuiltMap<String, OpenApiHeader> headers;
  @override
  final BuiltMap<String, OpenApiPathItem> paths;

  factory _$OpenApiComponents(
          [void Function(OpenApiComponentsBuilder)? updates]) =>
      (new OpenApiComponentsBuilder()..update(updates))._build();

  _$OpenApiComponents._(
      {required this.schemas,
      required this.responses,
      required this.parameters,
      required this.requestBodies,
      required this.headers,
      required this.paths})
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
        paths == other.paths;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, schemas.hashCode);
    _$hash = $jc(_$hash, responses.hashCode);
    _$hash = $jc(_$hash, parameters.hashCode);
    _$hash = $jc(_$hash, requestBodies.hashCode);
    _$hash = $jc(_$hash, headers.hashCode);
    _$hash = $jc(_$hash, paths.hashCode);
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
          ..add('paths', paths))
        .toString();
  }
}

class OpenApiComponentsBuilder
    implements Builder<OpenApiComponents, OpenApiComponentsBuilder> {
  _$OpenApiComponents? _$v;

  MapBuilder<String, OpenApiTypeSchema>? _schemas;
  MapBuilder<String, OpenApiTypeSchema> get schemas =>
      _$this._schemas ??= new MapBuilder<String, OpenApiTypeSchema>();
  set schemas(MapBuilder<String, OpenApiTypeSchema>? schemas) =>
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

  MapBuilder<String, OpenApiPathItem>? _paths;
  MapBuilder<String, OpenApiPathItem> get paths =>
      _$this._paths ??= new MapBuilder<String, OpenApiPathItem>();
  set paths(MapBuilder<String, OpenApiPathItem>? paths) =>
      _$this._paths = paths;

  OpenApiComponentsBuilder();

  OpenApiComponentsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _schemas = $v.schemas.toBuilder();
      _responses = $v.responses.toBuilder();
      _parameters = $v.parameters.toBuilder();
      _requestBodies = $v.requestBodies.toBuilder();
      _headers = $v.headers.toBuilder();
      _paths = $v.paths.toBuilder();
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
              paths: paths.build());
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
        _$failedField = 'paths';
        paths.build();
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

class _$OpenApiDiscriminator extends OpenApiDiscriminator {
  @override
  final String propertyName;
  @override
  final BuiltMap<String, String>? mapping;

  factory _$OpenApiDiscriminator(
          [void Function(OpenApiDiscriminatorBuilder)? updates]) =>
      (new OpenApiDiscriminatorBuilder()..update(updates))._build();

  _$OpenApiDiscriminator._({required this.propertyName, this.mapping})
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
        mapping == other.mapping;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, propertyName.hashCode);
    _$hash = $jc(_$hash, mapping.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiDiscriminator')
          ..add('propertyName', propertyName)
          ..add('mapping', mapping))
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

  OpenApiDiscriminatorBuilder();

  OpenApiDiscriminatorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _propertyName = $v.propertyName;
      _mapping = $v.mapping?.toBuilder();
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
              mapping: _mapping?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'mapping';
        _mapping?.build();
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
