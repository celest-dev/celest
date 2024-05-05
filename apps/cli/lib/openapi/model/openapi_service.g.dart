// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openapi_service.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OpenApiService extends OpenApiService {
  @override
  final String typePrefix;
  @override
  final String clientClassName;
  @override
  final String? description;
  @override
  final ServiceInfo info;
  @override
  final BuiltMap<String, ServiceModel> models;
  @override
  final ServicePath rootPath;

  factory _$OpenApiService([void Function(OpenApiServiceBuilder)? updates]) =>
      (new OpenApiServiceBuilder()..update(updates))._build();

  _$OpenApiService._(
      {required this.typePrefix,
      required this.clientClassName,
      this.description,
      required this.info,
      required this.models,
      required this.rootPath})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        typePrefix, r'OpenApiService', 'typePrefix');
    BuiltValueNullFieldError.checkNotNull(
        clientClassName, r'OpenApiService', 'clientClassName');
    BuiltValueNullFieldError.checkNotNull(info, r'OpenApiService', 'info');
    BuiltValueNullFieldError.checkNotNull(models, r'OpenApiService', 'models');
    BuiltValueNullFieldError.checkNotNull(
        rootPath, r'OpenApiService', 'rootPath');
  }

  @override
  OpenApiService rebuild(void Function(OpenApiServiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenApiServiceBuilder toBuilder() =>
      new OpenApiServiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenApiService &&
        typePrefix == other.typePrefix &&
        clientClassName == other.clientClassName &&
        description == other.description &&
        info == other.info &&
        models == other.models &&
        rootPath == other.rootPath;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, typePrefix.hashCode);
    _$hash = $jc(_$hash, clientClassName.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, info.hashCode);
    _$hash = $jc(_$hash, models.hashCode);
    _$hash = $jc(_$hash, rootPath.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenApiService')
          ..add('typePrefix', typePrefix)
          ..add('clientClassName', clientClassName)
          ..add('description', description)
          ..add('info', info)
          ..add('models', models)
          ..add('rootPath', rootPath))
        .toString();
  }
}

class OpenApiServiceBuilder
    implements Builder<OpenApiService, OpenApiServiceBuilder> {
  _$OpenApiService? _$v;

  String? _typePrefix;
  String? get typePrefix => _$this._typePrefix;
  set typePrefix(String? typePrefix) => _$this._typePrefix = typePrefix;

  String? _clientClassName;
  String? get clientClassName => _$this._clientClassName;
  set clientClassName(String? clientClassName) =>
      _$this._clientClassName = clientClassName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ServiceInfoBuilder? _info;
  ServiceInfoBuilder get info => _$this._info ??= new ServiceInfoBuilder();
  set info(ServiceInfoBuilder? info) => _$this._info = info;

  MapBuilder<String, ServiceModel>? _models;
  MapBuilder<String, ServiceModel> get models =>
      _$this._models ??= new MapBuilder<String, ServiceModel>();
  set models(MapBuilder<String, ServiceModel>? models) =>
      _$this._models = models;

  ServicePathBuilder? _rootPath;
  ServicePathBuilder get rootPath =>
      _$this._rootPath ??= new ServicePathBuilder();
  set rootPath(ServicePathBuilder? rootPath) => _$this._rootPath = rootPath;

  OpenApiServiceBuilder();

  OpenApiServiceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _typePrefix = $v.typePrefix;
      _clientClassName = $v.clientClassName;
      _description = $v.description;
      _info = $v.info.toBuilder();
      _models = $v.models.toBuilder();
      _rootPath = $v.rootPath.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenApiService other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenApiService;
  }

  @override
  void update(void Function(OpenApiServiceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenApiService build() => _build();

  _$OpenApiService _build() {
    _$OpenApiService _$result;
    try {
      _$result = _$v ??
          new _$OpenApiService._(
              typePrefix: BuiltValueNullFieldError.checkNotNull(
                  typePrefix, r'OpenApiService', 'typePrefix'),
              clientClassName: BuiltValueNullFieldError.checkNotNull(
                  clientClassName, r'OpenApiService', 'clientClassName'),
              description: description,
              info: info.build(),
              models: models.build(),
              rootPath: rootPath.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'info';
        info.build();
        _$failedField = 'models';
        models.build();
        _$failedField = 'rootPath';
        rootPath.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpenApiService', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ServiceModel extends ServiceModel {
  @override
  final Spec spec;
  @override
  final OpenApiType type;

  factory _$ServiceModel([void Function(ServiceModelBuilder)? updates]) =>
      (new ServiceModelBuilder()..update(updates))._build();

  _$ServiceModel._({required this.spec, required this.type}) : super._() {
    BuiltValueNullFieldError.checkNotNull(spec, r'ServiceModel', 'spec');
    BuiltValueNullFieldError.checkNotNull(type, r'ServiceModel', 'type');
  }

  @override
  ServiceModel rebuild(void Function(ServiceModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceModelBuilder toBuilder() => new ServiceModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceModel && spec == other.spec && type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, spec.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceModel')
          ..add('spec', spec)
          ..add('type', type))
        .toString();
  }
}

class ServiceModelBuilder
    implements Builder<ServiceModel, ServiceModelBuilder> {
  _$ServiceModel? _$v;

  Spec? _spec;
  Spec? get spec => _$this._spec;
  set spec(Spec? spec) => _$this._spec = spec;

  OpenApiType? _type;
  OpenApiType? get type => _$this._type;
  set type(OpenApiType? type) => _$this._type = type;

  ServiceModelBuilder();

  ServiceModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _spec = $v.spec;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceModel;
  }

  @override
  void update(void Function(ServiceModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceModel build() => _build();

  _$ServiceModel _build() {
    final _$result = _$v ??
        new _$ServiceModel._(
            spec: BuiltValueNullFieldError.checkNotNull(
                spec, r'ServiceModel', 'spec'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'ServiceModel', 'type'));
    replace(_$result);
    return _$result;
  }
}

class _$ServiceModelElement extends ServiceModelElement {
  @override
  final TypeReference reference;
  @override
  final OpenApiType type;
  @override
  final OpenApiTypeSchema debugSchema;

  factory _$ServiceModelElement(
          [void Function(ServiceModelElementBuilder)? updates]) =>
      (new ServiceModelElementBuilder()..update(updates))._build();

  _$ServiceModelElement._(
      {required this.reference, required this.type, required this.debugSchema})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        reference, r'ServiceModelElement', 'reference');
    BuiltValueNullFieldError.checkNotNull(type, r'ServiceModelElement', 'type');
    BuiltValueNullFieldError.checkNotNull(
        debugSchema, r'ServiceModelElement', 'debugSchema');
  }

  @override
  ServiceModelElement rebuild(
          void Function(ServiceModelElementBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceModelElementBuilder toBuilder() =>
      new ServiceModelElementBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceModelElement &&
        reference == other.reference &&
        type == other.type &&
        debugSchema == other.debugSchema;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, reference.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, debugSchema.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceModelElement')
          ..add('reference', reference)
          ..add('type', type)
          ..add('debugSchema', debugSchema))
        .toString();
  }
}

class ServiceModelElementBuilder
    implements Builder<ServiceModelElement, ServiceModelElementBuilder> {
  _$ServiceModelElement? _$v;

  TypeReferenceBuilder? _reference;
  TypeReferenceBuilder get reference =>
      _$this._reference ??= new TypeReferenceBuilder();
  set reference(TypeReferenceBuilder? reference) =>
      _$this._reference = reference;

  OpenApiType? _type;
  OpenApiType? get type => _$this._type;
  set type(OpenApiType? type) => _$this._type = type;

  OpenApiTypeSchema? _debugSchema;
  OpenApiTypeSchema? get debugSchema => _$this._debugSchema;
  set debugSchema(OpenApiTypeSchema? debugSchema) =>
      _$this._debugSchema = debugSchema;

  ServiceModelElementBuilder();

  ServiceModelElementBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reference = $v.reference.toBuilder();
      _type = $v.type;
      _debugSchema = $v.debugSchema;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceModelElement other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceModelElement;
  }

  @override
  void update(void Function(ServiceModelElementBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceModelElement build() => _build();

  _$ServiceModelElement _build() {
    _$ServiceModelElement _$result;
    try {
      _$result = _$v ??
          new _$ServiceModelElement._(
              reference: reference.build(),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'ServiceModelElement', 'type'),
              debugSchema: BuiltValueNullFieldError.checkNotNull(
                  debugSchema, r'ServiceModelElement', 'debugSchema'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'reference';
        reference.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServiceModelElement', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ServiceInfo extends ServiceInfo {
  @override
  final String extensionTypeName;
  @override
  final String defaultHost;
  @override
  final BuiltMap<String, ServiceHost> hosts;

  factory _$ServiceInfo([void Function(ServiceInfoBuilder)? updates]) =>
      (new ServiceInfoBuilder()..update(updates))._build();

  _$ServiceInfo._(
      {required this.extensionTypeName,
      required this.defaultHost,
      required this.hosts})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        extensionTypeName, r'ServiceInfo', 'extensionTypeName');
    BuiltValueNullFieldError.checkNotNull(
        defaultHost, r'ServiceInfo', 'defaultHost');
    BuiltValueNullFieldError.checkNotNull(hosts, r'ServiceInfo', 'hosts');
  }

  @override
  ServiceInfo rebuild(void Function(ServiceInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceInfoBuilder toBuilder() => new ServiceInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceInfo &&
        extensionTypeName == other.extensionTypeName &&
        defaultHost == other.defaultHost &&
        hosts == other.hosts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, extensionTypeName.hashCode);
    _$hash = $jc(_$hash, defaultHost.hashCode);
    _$hash = $jc(_$hash, hosts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceInfo')
          ..add('extensionTypeName', extensionTypeName)
          ..add('defaultHost', defaultHost)
          ..add('hosts', hosts))
        .toString();
  }
}

class ServiceInfoBuilder implements Builder<ServiceInfo, ServiceInfoBuilder> {
  _$ServiceInfo? _$v;

  String? _extensionTypeName;
  String? get extensionTypeName => _$this._extensionTypeName;
  set extensionTypeName(String? extensionTypeName) =>
      _$this._extensionTypeName = extensionTypeName;

  String? _defaultHost;
  String? get defaultHost => _$this._defaultHost;
  set defaultHost(String? defaultHost) => _$this._defaultHost = defaultHost;

  MapBuilder<String, ServiceHost>? _hosts;
  MapBuilder<String, ServiceHost> get hosts =>
      _$this._hosts ??= new MapBuilder<String, ServiceHost>();
  set hosts(MapBuilder<String, ServiceHost>? hosts) => _$this._hosts = hosts;

  ServiceInfoBuilder();

  ServiceInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _extensionTypeName = $v.extensionTypeName;
      _defaultHost = $v.defaultHost;
      _hosts = $v.hosts.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceInfo;
  }

  @override
  void update(void Function(ServiceInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceInfo build() => _build();

  _$ServiceInfo _build() {
    _$ServiceInfo _$result;
    try {
      _$result = _$v ??
          new _$ServiceInfo._(
              extensionTypeName: BuiltValueNullFieldError.checkNotNull(
                  extensionTypeName, r'ServiceInfo', 'extensionTypeName'),
              defaultHost: BuiltValueNullFieldError.checkNotNull(
                  defaultHost, r'ServiceInfo', 'defaultHost'),
              hosts: hosts.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hosts';
        hosts.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServiceInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ServiceHost extends ServiceHost {
  @override
  final String name;
  @override
  final String? description;
  @override
  final String mappedUrl;
  @override
  final ServiceHostVariables? variables;

  factory _$ServiceHost([void Function(ServiceHostBuilder)? updates]) =>
      (new ServiceHostBuilder()..update(updates))._build();

  _$ServiceHost._(
      {required this.name,
      this.description,
      required this.mappedUrl,
      this.variables})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ServiceHost', 'name');
    BuiltValueNullFieldError.checkNotNull(
        mappedUrl, r'ServiceHost', 'mappedUrl');
  }

  @override
  ServiceHost rebuild(void Function(ServiceHostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceHostBuilder toBuilder() => new ServiceHostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceHost &&
        name == other.name &&
        description == other.description &&
        mappedUrl == other.mappedUrl &&
        variables == other.variables;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, mappedUrl.hashCode);
    _$hash = $jc(_$hash, variables.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceHost')
          ..add('name', name)
          ..add('description', description)
          ..add('mappedUrl', mappedUrl)
          ..add('variables', variables))
        .toString();
  }
}

class ServiceHostBuilder implements Builder<ServiceHost, ServiceHostBuilder> {
  _$ServiceHost? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _mappedUrl;
  String? get mappedUrl => _$this._mappedUrl;
  set mappedUrl(String? mappedUrl) => _$this._mappedUrl = mappedUrl;

  ServiceHostVariablesBuilder? _variables;
  ServiceHostVariablesBuilder get variables =>
      _$this._variables ??= new ServiceHostVariablesBuilder();
  set variables(ServiceHostVariablesBuilder? variables) =>
      _$this._variables = variables;

  ServiceHostBuilder();

  ServiceHostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _mappedUrl = $v.mappedUrl;
      _variables = $v.variables?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceHost other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceHost;
  }

  @override
  void update(void Function(ServiceHostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceHost build() => _build();

  _$ServiceHost _build() {
    _$ServiceHost _$result;
    try {
      _$result = _$v ??
          new _$ServiceHost._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ServiceHost', 'name'),
              description: description,
              mappedUrl: BuiltValueNullFieldError.checkNotNull(
                  mappedUrl, r'ServiceHost', 'mappedUrl'),
              variables: _variables?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'variables';
        _variables?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServiceHost', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ServiceHostVariables extends ServiceHostVariables {
  @override
  final String className;
  @override
  final BuiltMap<String, ServiceHostVariable> variables;

  factory _$ServiceHostVariables(
          [void Function(ServiceHostVariablesBuilder)? updates]) =>
      (new ServiceHostVariablesBuilder()..update(updates))._build();

  _$ServiceHostVariables._({required this.className, required this.variables})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        className, r'ServiceHostVariables', 'className');
    BuiltValueNullFieldError.checkNotNull(
        variables, r'ServiceHostVariables', 'variables');
  }

  @override
  ServiceHostVariables rebuild(
          void Function(ServiceHostVariablesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceHostVariablesBuilder toBuilder() =>
      new ServiceHostVariablesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceHostVariables &&
        className == other.className &&
        variables == other.variables;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, className.hashCode);
    _$hash = $jc(_$hash, variables.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceHostVariables')
          ..add('className', className)
          ..add('variables', variables))
        .toString();
  }
}

class ServiceHostVariablesBuilder
    implements Builder<ServiceHostVariables, ServiceHostVariablesBuilder> {
  _$ServiceHostVariables? _$v;

  String? _className;
  String? get className => _$this._className;
  set className(String? className) => _$this._className = className;

  MapBuilder<String, ServiceHostVariable>? _variables;
  MapBuilder<String, ServiceHostVariable> get variables =>
      _$this._variables ??= new MapBuilder<String, ServiceHostVariable>();
  set variables(MapBuilder<String, ServiceHostVariable>? variables) =>
      _$this._variables = variables;

  ServiceHostVariablesBuilder();

  ServiceHostVariablesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _className = $v.className;
      _variables = $v.variables.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceHostVariables other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceHostVariables;
  }

  @override
  void update(void Function(ServiceHostVariablesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceHostVariables build() => _build();

  _$ServiceHostVariables _build() {
    _$ServiceHostVariables _$result;
    try {
      _$result = _$v ??
          new _$ServiceHostVariables._(
              className: BuiltValueNullFieldError.checkNotNull(
                  className, r'ServiceHostVariables', 'className'),
              variables: variables.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'variables';
        variables.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServiceHostVariables', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ServiceHostVariable extends ServiceHostVariable {
  @override
  final String? extensionTypeName;
  @override
  final BuiltMap<String, String>? enumValues;
  @override
  final String? description;
  @override
  final String defaultValue;

  factory _$ServiceHostVariable(
          [void Function(ServiceHostVariableBuilder)? updates]) =>
      (new ServiceHostVariableBuilder()..update(updates))._build();

  _$ServiceHostVariable._(
      {this.extensionTypeName,
      this.enumValues,
      this.description,
      required this.defaultValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        defaultValue, r'ServiceHostVariable', 'defaultValue');
  }

  @override
  ServiceHostVariable rebuild(
          void Function(ServiceHostVariableBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceHostVariableBuilder toBuilder() =>
      new ServiceHostVariableBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceHostVariable &&
        extensionTypeName == other.extensionTypeName &&
        enumValues == other.enumValues &&
        description == other.description &&
        defaultValue == other.defaultValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, extensionTypeName.hashCode);
    _$hash = $jc(_$hash, enumValues.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceHostVariable')
          ..add('extensionTypeName', extensionTypeName)
          ..add('enumValues', enumValues)
          ..add('description', description)
          ..add('defaultValue', defaultValue))
        .toString();
  }
}

class ServiceHostVariableBuilder
    implements Builder<ServiceHostVariable, ServiceHostVariableBuilder> {
  _$ServiceHostVariable? _$v;

  String? _extensionTypeName;
  String? get extensionTypeName => _$this._extensionTypeName;
  set extensionTypeName(String? extensionTypeName) =>
      _$this._extensionTypeName = extensionTypeName;

  MapBuilder<String, String>? _enumValues;
  MapBuilder<String, String> get enumValues =>
      _$this._enumValues ??= new MapBuilder<String, String>();
  set enumValues(MapBuilder<String, String>? enumValues) =>
      _$this._enumValues = enumValues;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _defaultValue;
  String? get defaultValue => _$this._defaultValue;
  set defaultValue(String? defaultValue) => _$this._defaultValue = defaultValue;

  ServiceHostVariableBuilder();

  ServiceHostVariableBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _extensionTypeName = $v.extensionTypeName;
      _enumValues = $v.enumValues?.toBuilder();
      _description = $v.description;
      _defaultValue = $v.defaultValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceHostVariable other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceHostVariable;
  }

  @override
  void update(void Function(ServiceHostVariableBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceHostVariable build() => _build();

  _$ServiceHostVariable _build() {
    _$ServiceHostVariable _$result;
    try {
      _$result = _$v ??
          new _$ServiceHostVariable._(
              extensionTypeName: extensionTypeName,
              enumValues: _enumValues?.build(),
              description: description,
              defaultValue: BuiltValueNullFieldError.checkNotNull(
                  defaultValue, r'ServiceHostVariable', 'defaultValue'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'enumValues';
        _enumValues?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServiceHostVariable', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ServicePath extends ServicePath {
  @override
  final String? className;
  @override
  final String? libraryPath;
  @override
  final String? variableName;
  @override
  final BuiltMap<String, ServicePathParameter> pathParameters;
  @override
  final BuiltMap<String, ServiceMethod> methods;
  @override
  final BuiltMap<String, ServicePath> subpaths;

  factory _$ServicePath([void Function(ServicePathBuilder)? updates]) =>
      (new ServicePathBuilder()..update(updates))._build();

  _$ServicePath._(
      {this.className,
      this.libraryPath,
      this.variableName,
      required this.pathParameters,
      required this.methods,
      required this.subpaths})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        pathParameters, r'ServicePath', 'pathParameters');
    BuiltValueNullFieldError.checkNotNull(methods, r'ServicePath', 'methods');
    BuiltValueNullFieldError.checkNotNull(subpaths, r'ServicePath', 'subpaths');
  }

  @override
  ServicePath rebuild(void Function(ServicePathBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServicePathBuilder toBuilder() => new ServicePathBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServicePath &&
        className == other.className &&
        libraryPath == other.libraryPath &&
        variableName == other.variableName &&
        pathParameters == other.pathParameters &&
        methods == other.methods &&
        subpaths == other.subpaths;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, className.hashCode);
    _$hash = $jc(_$hash, libraryPath.hashCode);
    _$hash = $jc(_$hash, variableName.hashCode);
    _$hash = $jc(_$hash, pathParameters.hashCode);
    _$hash = $jc(_$hash, methods.hashCode);
    _$hash = $jc(_$hash, subpaths.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServicePath')
          ..add('className', className)
          ..add('libraryPath', libraryPath)
          ..add('variableName', variableName)
          ..add('pathParameters', pathParameters)
          ..add('methods', methods)
          ..add('subpaths', subpaths))
        .toString();
  }
}

class ServicePathBuilder implements Builder<ServicePath, ServicePathBuilder> {
  _$ServicePath? _$v;

  String? _className;
  String? get className => _$this._className;
  set className(String? className) => _$this._className = className;

  String? _libraryPath;
  String? get libraryPath => _$this._libraryPath;
  set libraryPath(String? libraryPath) => _$this._libraryPath = libraryPath;

  String? _variableName;
  String? get variableName => _$this._variableName;
  set variableName(String? variableName) => _$this._variableName = variableName;

  MapBuilder<String, ServicePathParameter>? _pathParameters;
  MapBuilder<String, ServicePathParameter> get pathParameters =>
      _$this._pathParameters ??= new MapBuilder<String, ServicePathParameter>();
  set pathParameters(
          MapBuilder<String, ServicePathParameter>? pathParameters) =>
      _$this._pathParameters = pathParameters;

  MapBuilder<String, ServiceMethod>? _methods;
  MapBuilder<String, ServiceMethod> get methods =>
      _$this._methods ??= new MapBuilder<String, ServiceMethod>();
  set methods(MapBuilder<String, ServiceMethod>? methods) =>
      _$this._methods = methods;

  MapBuilder<String, ServicePath>? _subpaths;
  MapBuilder<String, ServicePath> get subpaths =>
      _$this._subpaths ??= new MapBuilder<String, ServicePath>();
  set subpaths(MapBuilder<String, ServicePath>? subpaths) =>
      _$this._subpaths = subpaths;

  ServicePathBuilder();

  ServicePathBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _className = $v.className;
      _libraryPath = $v.libraryPath;
      _variableName = $v.variableName;
      _pathParameters = $v.pathParameters.toBuilder();
      _methods = $v.methods.toBuilder();
      _subpaths = $v.subpaths.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServicePath other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServicePath;
  }

  @override
  void update(void Function(ServicePathBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServicePath build() => _build();

  _$ServicePath _build() {
    _$ServicePath _$result;
    try {
      _$result = _$v ??
          new _$ServicePath._(
              className: className,
              libraryPath: libraryPath,
              variableName: variableName,
              pathParameters: pathParameters.build(),
              methods: methods.build(),
              subpaths: subpaths.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pathParameters';
        pathParameters.build();
        _$failedField = 'methods';
        methods.build();
        _$failedField = 'subpaths';
        subpaths.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServicePath', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ServicePathParameter extends ServicePathParameter {
  @override
  final String variableName;
  @override
  final OpenApiType type;
  @override
  final bool inherited;

  factory _$ServicePathParameter(
          [void Function(ServicePathParameterBuilder)? updates]) =>
      (new ServicePathParameterBuilder()..update(updates))._build();

  _$ServicePathParameter._(
      {required this.variableName, required this.type, required this.inherited})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        variableName, r'ServicePathParameter', 'variableName');
    BuiltValueNullFieldError.checkNotNull(
        type, r'ServicePathParameter', 'type');
    BuiltValueNullFieldError.checkNotNull(
        inherited, r'ServicePathParameter', 'inherited');
  }

  @override
  ServicePathParameter rebuild(
          void Function(ServicePathParameterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServicePathParameterBuilder toBuilder() =>
      new ServicePathParameterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServicePathParameter &&
        variableName == other.variableName &&
        type == other.type &&
        inherited == other.inherited;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, variableName.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, inherited.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServicePathParameter')
          ..add('variableName', variableName)
          ..add('type', type)
          ..add('inherited', inherited))
        .toString();
  }
}

class ServicePathParameterBuilder
    implements Builder<ServicePathParameter, ServicePathParameterBuilder> {
  _$ServicePathParameter? _$v;

  String? _variableName;
  String? get variableName => _$this._variableName;
  set variableName(String? variableName) => _$this._variableName = variableName;

  OpenApiType? _type;
  OpenApiType? get type => _$this._type;
  set type(OpenApiType? type) => _$this._type = type;

  bool? _inherited;
  bool? get inherited => _$this._inherited;
  set inherited(bool? inherited) => _$this._inherited = inherited;

  ServicePathParameterBuilder();

  ServicePathParameterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _variableName = $v.variableName;
      _type = $v.type;
      _inherited = $v.inherited;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServicePathParameter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServicePathParameter;
  }

  @override
  void update(void Function(ServicePathParameterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServicePathParameter build() => _build();

  _$ServicePathParameter _build() {
    final _$result = _$v ??
        new _$ServicePathParameter._(
            variableName: BuiltValueNullFieldError.checkNotNull(
                variableName, r'ServicePathParameter', 'variableName'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'ServicePathParameter', 'type'),
            inherited: BuiltValueNullFieldError.checkNotNull(
                inherited, r'ServicePathParameter', 'inherited'));
    replace(_$result);
    return _$result;
  }
}

class _$ServiceMethod extends ServiceMethod {
  @override
  final bool deprecated;
  @override
  final String? summary;
  @override
  final String? description;
  @override
  final String methodName;
  @override
  final OpenApiOperationType methodType;
  @override
  final String mappedPath;
  @override
  final BuiltList<ServicePathParameter> pathParameters;
  @override
  final BuiltList<HeaderOrQueryParameter> queryParameters;
  @override
  final BuiltList<HeaderOrQueryParameter> headers;
  @override
  final BuiltMap<String, ServiceMethodRequest> requestBody;
  @override
  final OpenApiType responseType;
  @override
  final ServiceMethodResponse? defaultResponse;
  @override
  final BuiltMap<int, ServiceMethodResponse> responseCases;

  factory _$ServiceMethod([void Function(ServiceMethodBuilder)? updates]) =>
      (new ServiceMethodBuilder()..update(updates))._build();

  _$ServiceMethod._(
      {required this.deprecated,
      this.summary,
      this.description,
      required this.methodName,
      required this.methodType,
      required this.mappedPath,
      required this.pathParameters,
      required this.queryParameters,
      required this.headers,
      required this.requestBody,
      required this.responseType,
      this.defaultResponse,
      required this.responseCases})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        deprecated, r'ServiceMethod', 'deprecated');
    BuiltValueNullFieldError.checkNotNull(
        methodName, r'ServiceMethod', 'methodName');
    BuiltValueNullFieldError.checkNotNull(
        methodType, r'ServiceMethod', 'methodType');
    BuiltValueNullFieldError.checkNotNull(
        mappedPath, r'ServiceMethod', 'mappedPath');
    BuiltValueNullFieldError.checkNotNull(
        pathParameters, r'ServiceMethod', 'pathParameters');
    BuiltValueNullFieldError.checkNotNull(
        queryParameters, r'ServiceMethod', 'queryParameters');
    BuiltValueNullFieldError.checkNotNull(headers, r'ServiceMethod', 'headers');
    BuiltValueNullFieldError.checkNotNull(
        requestBody, r'ServiceMethod', 'requestBody');
    BuiltValueNullFieldError.checkNotNull(
        responseType, r'ServiceMethod', 'responseType');
    BuiltValueNullFieldError.checkNotNull(
        responseCases, r'ServiceMethod', 'responseCases');
  }

  @override
  ServiceMethod rebuild(void Function(ServiceMethodBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceMethodBuilder toBuilder() => new ServiceMethodBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceMethod &&
        deprecated == other.deprecated &&
        summary == other.summary &&
        description == other.description &&
        methodName == other.methodName &&
        methodType == other.methodType &&
        mappedPath == other.mappedPath &&
        pathParameters == other.pathParameters &&
        queryParameters == other.queryParameters &&
        headers == other.headers &&
        requestBody == other.requestBody &&
        responseType == other.responseType &&
        defaultResponse == other.defaultResponse &&
        responseCases == other.responseCases;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, methodName.hashCode);
    _$hash = $jc(_$hash, methodType.hashCode);
    _$hash = $jc(_$hash, mappedPath.hashCode);
    _$hash = $jc(_$hash, pathParameters.hashCode);
    _$hash = $jc(_$hash, queryParameters.hashCode);
    _$hash = $jc(_$hash, headers.hashCode);
    _$hash = $jc(_$hash, requestBody.hashCode);
    _$hash = $jc(_$hash, responseType.hashCode);
    _$hash = $jc(_$hash, defaultResponse.hashCode);
    _$hash = $jc(_$hash, responseCases.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceMethod')
          ..add('deprecated', deprecated)
          ..add('summary', summary)
          ..add('description', description)
          ..add('methodName', methodName)
          ..add('methodType', methodType)
          ..add('mappedPath', mappedPath)
          ..add('pathParameters', pathParameters)
          ..add('queryParameters', queryParameters)
          ..add('headers', headers)
          ..add('requestBody', requestBody)
          ..add('responseType', responseType)
          ..add('defaultResponse', defaultResponse)
          ..add('responseCases', responseCases))
        .toString();
  }
}

class ServiceMethodBuilder
    implements Builder<ServiceMethod, ServiceMethodBuilder> {
  _$ServiceMethod? _$v;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(bool? deprecated) => _$this._deprecated = deprecated;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _methodName;
  String? get methodName => _$this._methodName;
  set methodName(String? methodName) => _$this._methodName = methodName;

  OpenApiOperationType? _methodType;
  OpenApiOperationType? get methodType => _$this._methodType;
  set methodType(OpenApiOperationType? methodType) =>
      _$this._methodType = methodType;

  String? _mappedPath;
  String? get mappedPath => _$this._mappedPath;
  set mappedPath(String? mappedPath) => _$this._mappedPath = mappedPath;

  ListBuilder<ServicePathParameter>? _pathParameters;
  ListBuilder<ServicePathParameter> get pathParameters =>
      _$this._pathParameters ??= new ListBuilder<ServicePathParameter>();
  set pathParameters(ListBuilder<ServicePathParameter>? pathParameters) =>
      _$this._pathParameters = pathParameters;

  ListBuilder<HeaderOrQueryParameter>? _queryParameters;
  ListBuilder<HeaderOrQueryParameter> get queryParameters =>
      _$this._queryParameters ??= new ListBuilder<HeaderOrQueryParameter>();
  set queryParameters(ListBuilder<HeaderOrQueryParameter>? queryParameters) =>
      _$this._queryParameters = queryParameters;

  ListBuilder<HeaderOrQueryParameter>? _headers;
  ListBuilder<HeaderOrQueryParameter> get headers =>
      _$this._headers ??= new ListBuilder<HeaderOrQueryParameter>();
  set headers(ListBuilder<HeaderOrQueryParameter>? headers) =>
      _$this._headers = headers;

  MapBuilder<String, ServiceMethodRequest>? _requestBody;
  MapBuilder<String, ServiceMethodRequest> get requestBody =>
      _$this._requestBody ??= new MapBuilder<String, ServiceMethodRequest>();
  set requestBody(MapBuilder<String, ServiceMethodRequest>? requestBody) =>
      _$this._requestBody = requestBody;

  OpenApiType? _responseType;
  OpenApiType? get responseType => _$this._responseType;
  set responseType(OpenApiType? responseType) =>
      _$this._responseType = responseType;

  ServiceMethodResponseBuilder? _defaultResponse;
  ServiceMethodResponseBuilder get defaultResponse =>
      _$this._defaultResponse ??= new ServiceMethodResponseBuilder();
  set defaultResponse(ServiceMethodResponseBuilder? defaultResponse) =>
      _$this._defaultResponse = defaultResponse;

  MapBuilder<int, ServiceMethodResponse>? _responseCases;
  MapBuilder<int, ServiceMethodResponse> get responseCases =>
      _$this._responseCases ??= new MapBuilder<int, ServiceMethodResponse>();
  set responseCases(MapBuilder<int, ServiceMethodResponse>? responseCases) =>
      _$this._responseCases = responseCases;

  ServiceMethodBuilder();

  ServiceMethodBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _deprecated = $v.deprecated;
      _summary = $v.summary;
      _description = $v.description;
      _methodName = $v.methodName;
      _methodType = $v.methodType;
      _mappedPath = $v.mappedPath;
      _pathParameters = $v.pathParameters.toBuilder();
      _queryParameters = $v.queryParameters.toBuilder();
      _headers = $v.headers.toBuilder();
      _requestBody = $v.requestBody.toBuilder();
      _responseType = $v.responseType;
      _defaultResponse = $v.defaultResponse?.toBuilder();
      _responseCases = $v.responseCases.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceMethod other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceMethod;
  }

  @override
  void update(void Function(ServiceMethodBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceMethod build() => _build();

  _$ServiceMethod _build() {
    _$ServiceMethod _$result;
    try {
      _$result = _$v ??
          new _$ServiceMethod._(
              deprecated: BuiltValueNullFieldError.checkNotNull(
                  deprecated, r'ServiceMethod', 'deprecated'),
              summary: summary,
              description: description,
              methodName: BuiltValueNullFieldError.checkNotNull(
                  methodName, r'ServiceMethod', 'methodName'),
              methodType: BuiltValueNullFieldError.checkNotNull(
                  methodType, r'ServiceMethod', 'methodType'),
              mappedPath: BuiltValueNullFieldError.checkNotNull(
                  mappedPath, r'ServiceMethod', 'mappedPath'),
              pathParameters: pathParameters.build(),
              queryParameters: queryParameters.build(),
              headers: headers.build(),
              requestBody: requestBody.build(),
              responseType: BuiltValueNullFieldError.checkNotNull(
                  responseType, r'ServiceMethod', 'responseType'),
              defaultResponse: _defaultResponse?.build(),
              responseCases: responseCases.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pathParameters';
        pathParameters.build();
        _$failedField = 'queryParameters';
        queryParameters.build();
        _$failedField = 'headers';
        headers.build();
        _$failedField = 'requestBody';
        requestBody.build();

        _$failedField = 'defaultResponse';
        _defaultResponse?.build();
        _$failedField = 'responseCases';
        responseCases.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServiceMethod', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ServiceMethodRequest extends ServiceMethodRequest {
  @override
  final MediaType contentType;
  @override
  final OpenApiType? type;
  @override
  final BuiltMap<String, OpenApiEncoding> encoding;

  factory _$ServiceMethodRequest(
          [void Function(ServiceMethodRequestBuilder)? updates]) =>
      (new ServiceMethodRequestBuilder()..update(updates))._build();

  _$ServiceMethodRequest._(
      {required this.contentType, this.type, required this.encoding})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        contentType, r'ServiceMethodRequest', 'contentType');
    BuiltValueNullFieldError.checkNotNull(
        encoding, r'ServiceMethodRequest', 'encoding');
  }

  @override
  ServiceMethodRequest rebuild(
          void Function(ServiceMethodRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceMethodRequestBuilder toBuilder() =>
      new ServiceMethodRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceMethodRequest &&
        contentType == other.contentType &&
        type == other.type &&
        encoding == other.encoding;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, contentType.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, encoding.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceMethodRequest')
          ..add('contentType', contentType)
          ..add('type', type)
          ..add('encoding', encoding))
        .toString();
  }
}

class ServiceMethodRequestBuilder
    implements Builder<ServiceMethodRequest, ServiceMethodRequestBuilder> {
  _$ServiceMethodRequest? _$v;

  MediaType? _contentType;
  MediaType? get contentType => _$this._contentType;
  set contentType(MediaType? contentType) => _$this._contentType = contentType;

  OpenApiType? _type;
  OpenApiType? get type => _$this._type;
  set type(OpenApiType? type) => _$this._type = type;

  MapBuilder<String, OpenApiEncoding>? _encoding;
  MapBuilder<String, OpenApiEncoding> get encoding =>
      _$this._encoding ??= new MapBuilder<String, OpenApiEncoding>();
  set encoding(MapBuilder<String, OpenApiEncoding>? encoding) =>
      _$this._encoding = encoding;

  ServiceMethodRequestBuilder();

  ServiceMethodRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contentType = $v.contentType;
      _type = $v.type;
      _encoding = $v.encoding.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceMethodRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceMethodRequest;
  }

  @override
  void update(void Function(ServiceMethodRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceMethodRequest build() => _build();

  _$ServiceMethodRequest _build() {
    _$ServiceMethodRequest _$result;
    try {
      _$result = _$v ??
          new _$ServiceMethodRequest._(
              contentType: BuiltValueNullFieldError.checkNotNull(
                  contentType, r'ServiceMethodRequest', 'contentType'),
              type: type,
              encoding: encoding.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'encoding';
        encoding.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServiceMethodRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ServiceMethodResponse extends ServiceMethodResponse {
  @override
  final String description;
  @override
  final bool isError;
  @override
  final OpenApiType type;

  factory _$ServiceMethodResponse(
          [void Function(ServiceMethodResponseBuilder)? updates]) =>
      (new ServiceMethodResponseBuilder()..update(updates))._build();

  _$ServiceMethodResponse._(
      {required this.description, required this.isError, required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        description, r'ServiceMethodResponse', 'description');
    BuiltValueNullFieldError.checkNotNull(
        isError, r'ServiceMethodResponse', 'isError');
    BuiltValueNullFieldError.checkNotNull(
        type, r'ServiceMethodResponse', 'type');
  }

  @override
  ServiceMethodResponse rebuild(
          void Function(ServiceMethodResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceMethodResponseBuilder toBuilder() =>
      new ServiceMethodResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceMethodResponse &&
        description == other.description &&
        isError == other.isError &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isError.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceMethodResponse')
          ..add('description', description)
          ..add('isError', isError)
          ..add('type', type))
        .toString();
  }
}

class ServiceMethodResponseBuilder
    implements Builder<ServiceMethodResponse, ServiceMethodResponseBuilder> {
  _$ServiceMethodResponse? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _isError;
  bool? get isError => _$this._isError;
  set isError(bool? isError) => _$this._isError = isError;

  OpenApiType? _type;
  OpenApiType? get type => _$this._type;
  set type(OpenApiType? type) => _$this._type = type;

  ServiceMethodResponseBuilder();

  ServiceMethodResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _isError = $v.isError;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceMethodResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceMethodResponse;
  }

  @override
  void update(void Function(ServiceMethodResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceMethodResponse build() => _build();

  _$ServiceMethodResponse _build() {
    final _$result = _$v ??
        new _$ServiceMethodResponse._(
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'ServiceMethodResponse', 'description'),
            isError: BuiltValueNullFieldError.checkNotNull(
                isError, r'ServiceMethodResponse', 'isError'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'ServiceMethodResponse', 'type'));
    replace(_$result);
    return _$result;
  }
}

class _$HeaderOrQueryParameter extends HeaderOrQueryParameter {
  @override
  final String rawName;
  @override
  final String variableName;
  @override
  final OpenApiType type;

  factory _$HeaderOrQueryParameter(
          [void Function(HeaderOrQueryParameterBuilder)? updates]) =>
      (new HeaderOrQueryParameterBuilder()..update(updates))._build();

  _$HeaderOrQueryParameter._(
      {required this.rawName, required this.variableName, required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        rawName, r'HeaderOrQueryParameter', 'rawName');
    BuiltValueNullFieldError.checkNotNull(
        variableName, r'HeaderOrQueryParameter', 'variableName');
    BuiltValueNullFieldError.checkNotNull(
        type, r'HeaderOrQueryParameter', 'type');
  }

  @override
  HeaderOrQueryParameter rebuild(
          void Function(HeaderOrQueryParameterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HeaderOrQueryParameterBuilder toBuilder() =>
      new HeaderOrQueryParameterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HeaderOrQueryParameter &&
        rawName == other.rawName &&
        variableName == other.variableName &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, rawName.hashCode);
    _$hash = $jc(_$hash, variableName.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HeaderOrQueryParameter')
          ..add('rawName', rawName)
          ..add('variableName', variableName)
          ..add('type', type))
        .toString();
  }
}

class HeaderOrQueryParameterBuilder
    implements Builder<HeaderOrQueryParameter, HeaderOrQueryParameterBuilder> {
  _$HeaderOrQueryParameter? _$v;

  String? _rawName;
  String? get rawName => _$this._rawName;
  set rawName(String? rawName) => _$this._rawName = rawName;

  String? _variableName;
  String? get variableName => _$this._variableName;
  set variableName(String? variableName) => _$this._variableName = variableName;

  OpenApiType? _type;
  OpenApiType? get type => _$this._type;
  set type(OpenApiType? type) => _$this._type = type;

  HeaderOrQueryParameterBuilder();

  HeaderOrQueryParameterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rawName = $v.rawName;
      _variableName = $v.variableName;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HeaderOrQueryParameter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HeaderOrQueryParameter;
  }

  @override
  void update(void Function(HeaderOrQueryParameterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HeaderOrQueryParameter build() => _build();

  _$HeaderOrQueryParameter _build() {
    final _$result = _$v ??
        new _$HeaderOrQueryParameter._(
            rawName: BuiltValueNullFieldError.checkNotNull(
                rawName, r'HeaderOrQueryParameter', 'rawName'),
            variableName: BuiltValueNullFieldError.checkNotNull(
                variableName, r'HeaderOrQueryParameter', 'variableName'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'HeaderOrQueryParameter', 'type'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
