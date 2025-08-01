// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fly_app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlyAppConfig _$FlyAppConfigFromJson(Map json) => FlyAppConfig(
  appName: json['app'] as String,
  primaryRegion: json['primary_region'] as String,
  killSignal: json['kill_signal'] as String?,
  killTimeout: json['kill_timeout'] as String?,
  swapSizeMb: (json['swap_size_mb'] as num?)?.toInt(),
  consoleCommand: json['console_command'] as String?,
  build: json['build'] == null
      ? null
      : FlyAppBuildConfig.fromJson(
          Map<String, Object?>.from(json['build'] as Map),
        ),
  deploy: json['deploy'] == null
      ? null
      : FlyAppDeployConfig.fromJson(
          Map<String, Object?>.from(json['deploy'] as Map),
        ),
  env: (json['env'] as Map?)?.map((k, e) => MapEntry(k as String, e as String)),
  mounts: (json['mounts'] as List<dynamic>?)
      ?.map(
        (e) => FlyAppMountConfig.fromJson(Map<String, Object?>.from(e as Map)),
      )
      .toList(),
  httpService: json['http_service'] == null
      ? null
      : FlyAppHttpServiceConfig.fromJson(
          Map<String, Object?>.from(json['http_service'] as Map),
        ),
  vms: (json['vm'] as List<dynamic>?)
      ?.map((e) => FlyAppVmConfig.fromJson(Map<String, Object?>.from(e as Map)))
      .toList(),
);

Map<String, dynamic> _$FlyAppConfigToJson(FlyAppConfig instance) =>
    <String, dynamic>{
      'app': instance.appName,
      'primary_region': instance.primaryRegion,
      if (instance.killSignal case final value?) 'kill_signal': value,
      if (instance.killTimeout case final value?) 'kill_timeout': value,
      if (instance.swapSizeMb case final value?) 'swap_size_mb': value,
      if (instance.consoleCommand case final value?) 'console_command': value,
      if (instance.build case final value?) 'build': value,
      if (instance.deploy case final value?) 'deploy': value,
      if (instance.env case final value?) 'env': value,
      if (instance.mounts case final value?) 'mounts': value,
      if (instance.httpService case final value?) 'http_service': value,
      if (instance.vms case final value?) 'vm': value,
    };

FlyAppBuildConfig _$FlyAppBuildConfigFromJson(Map json) => FlyAppBuildConfig(
  image: json['image'] as String?,
  dockerfile: json['dockerfile'] as String?,
);

Map<String, dynamic> _$FlyAppBuildConfigToJson(FlyAppBuildConfig instance) =>
    <String, dynamic>{
      if (instance.image case final value?) 'image': value,
      if (instance.dockerfile case final value?) 'dockerfile': value,
    };

FlyAppDeployConfig _$FlyAppDeployConfigFromJson(Map json) =>
    FlyAppDeployConfig();

Map<String, dynamic> _$FlyAppDeployConfigToJson(FlyAppDeployConfig instance) =>
    <String, dynamic>{};

FlyAppMountConfig _$FlyAppMountConfigFromJson(Map json) => FlyAppMountConfig(
  source: json['source'] as String,
  destination: json['destination'] as String,
  initialSize: json['initial_size'] as String?,
  processes:
      (json['processes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const ['app'],
);

Map<String, dynamic> _$FlyAppMountConfigToJson(FlyAppMountConfig instance) =>
    <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
      if (instance.initialSize case final value?) 'initial_size': value,
      if (instance.processes case final value?) 'processes': value,
    };

FlyAppHttpServiceConfig _$FlyAppHttpServiceConfigFromJson(Map json) =>
    FlyAppHttpServiceConfig(
      internalPort: (json['internal_port'] as num?)?.toInt() ?? 8080,
      forceHttps: json['force_https'] as bool? ?? true,
      autoStopMachines:
          $enumDecodeNullable(
            _$FlyMachineAutostopEnumMap,
            json['auto_stop_machines'],
          ) ??
          FlyMachineAutostop.stop,
      autoStartMachines: json['auto_start_machines'] as bool? ?? true,
      minMachinesRunning: (json['min_machines_running'] as num?)?.toInt() ?? 0,
      processes:
          (json['processes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['app'],
      checks: (json['checks'] as List<dynamic>?)
          ?.map(
            (e) => FlyAppHttpServiceCheckConfig.fromJson(
              Map<String, Object?>.from(e as Map),
            ),
          )
          .toList(),
    );

Map<String, dynamic> _$FlyAppHttpServiceConfigToJson(
  FlyAppHttpServiceConfig instance,
) => <String, dynamic>{
  'internal_port': instance.internalPort,
  if (instance.forceHttps case final value?) 'force_https': value,
  if (_$FlyMachineAutostopEnumMap[instance.autoStopMachines] case final value?)
    'auto_stop_machines': value,
  if (instance.autoStartMachines case final value?)
    'auto_start_machines': value,
  if (instance.minMachinesRunning case final value?)
    'min_machines_running': value,
  'processes': instance.processes,
  if (instance.checks case final value?) 'checks': value,
};

const _$FlyMachineAutostopEnumMap = {
  FlyMachineAutostop.off: 'off',
  FlyMachineAutostop.stop: 'stop',
  FlyMachineAutostop.suspend: 'suspend',
};

FlyAppHttpServiceCheckConfig _$FlyAppHttpServiceCheckConfigFromJson(Map json) =>
    FlyAppHttpServiceCheckConfig(
      method: json['method'] as String? ?? 'GET',
      path: json['path'] as String,
      interval: json['interval'] as String,
      timeout: json['timeout'] as String,
      gracePeriod: json['grace_period'] as String,
    );

Map<String, dynamic> _$FlyAppHttpServiceCheckConfigToJson(
  FlyAppHttpServiceCheckConfig instance,
) => <String, dynamic>{
  'method': instance.method,
  'path': instance.path,
  'interval': instance.interval,
  'timeout': instance.timeout,
  'grace_period': instance.gracePeriod,
};

FlyAppVmConfig _$FlyAppVmConfigFromJson(Map json) => FlyAppVmConfig(
  size: json['size'] as String?,
  memory: json['memory'] as String?,
  cpuKind: json['cpu_kind'] as String?,
  cpus: (json['cpus'] as num?)?.toInt(),
  memoryMb: (json['memory_mb'] as num?)?.toInt(),
  processes: (json['processes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$FlyAppVmConfigToJson(FlyAppVmConfig instance) =>
    <String, dynamic>{
      if (instance.size case final value?) 'size': value,
      if (instance.memory case final value?) 'memory': value,
      if (instance.cpuKind case final value?) 'cpu_kind': value,
      if (instance.cpus case final value?) 'cpus': value,
      if (instance.memoryMb case final value?) 'memory_mb': value,
      if (instance.processes case final value?) 'processes': value,
    };
