import 'package:json_annotation/json_annotation.dart';

part 'fly_app_config.g.dart';

const _serializable = JsonSerializable(
  anyMap: true,
  fieldRename: FieldRename.snake,
  includeIfNull: false,
);

@_serializable
final class FlyAppConfig {
  const FlyAppConfig({
    required this.appName,
    required this.primaryRegion,
    this.killSignal,
    this.killTimeout,
    this.swapSizeMb,
    this.consoleCommand,
    this.build,
    this.deploy,
    this.env,
    this.mounts,
    this.httpService,
    this.vms,
  });

  factory FlyAppConfig.fromJson(Map<String, Object?> json) =>
      _$FlyAppConfigFromJson(json);

  @JsonKey(name: 'app')
  final String appName;
  final String primaryRegion;
  final String? killSignal;
  final String? killTimeout;
  final int? swapSizeMb;
  final String? consoleCommand;

  final FlyAppBuildConfig? build;
  final FlyAppDeployConfig? deploy;
  final Map<String, String>? env;

  final List<FlyAppMountConfig>? mounts;
  final FlyAppHttpServiceConfig? httpService;

  @JsonKey(name: 'vm')
  final List<FlyAppVmConfig>? vms;

  Map<String, Object?> toJson() => _$FlyAppConfigToJson(this);
}

@_serializable
final class FlyAppBuildConfig {
  const FlyAppBuildConfig({this.image, this.dockerfile});

  factory FlyAppBuildConfig.fromJson(Map<String, Object?> json) =>
      _$FlyAppBuildConfigFromJson(json);

  final String? image;
  final String? dockerfile;

  Map<String, Object?> toJson() => _$FlyAppBuildConfigToJson(this);
}

@_serializable
final class FlyAppDeployConfig {
  const FlyAppDeployConfig();

  factory FlyAppDeployConfig.fromJson(Map<String, Object?> json) =>
      _$FlyAppDeployConfigFromJson(json);

  Map<String, Object?> toJson() => _$FlyAppDeployConfigToJson(this);
}

@_serializable
final class FlyAppMountConfig {
  const FlyAppMountConfig({
    required this.source,
    required this.destination,
    this.initialSize,
    this.processes = const ['app'],
  });

  factory FlyAppMountConfig.fromJson(Map<String, Object?> json) =>
      _$FlyAppMountConfigFromJson(json);

  final String source;
  final String destination;
  final String? initialSize;
  final List<String>? processes;

  Map<String, Object?> toJson() => _$FlyAppMountConfigToJson(this);
}

@_serializable
final class FlyAppHttpServiceConfig {
  const FlyAppHttpServiceConfig({
    this.internalPort = 8080,
    this.forceHttps = true,
    this.autoStopMachines = FlyMachineAutostop.stop,
    this.autoStartMachines = true,
    this.minMachinesRunning = 0,
    this.processes = const ['app'],
  });

  factory FlyAppHttpServiceConfig.fromJson(Map<String, Object?> json) =>
      _$FlyAppHttpServiceConfigFromJson(json);

  final int internalPort;
  final bool? forceHttps;
  final FlyMachineAutostop? autoStopMachines;
  final bool? autoStartMachines;
  final int? minMachinesRunning;
  final List<String> processes;

  Map<String, Object?> toJson() => _$FlyAppHttpServiceConfigToJson(this);
}

enum FlyMachineAutostop { off, stop, suspend }

@_serializable
final class FlyAppVmConfig {
  const FlyAppVmConfig({
    this.size,
    this.memory,
    this.cpuKind,
    this.cpus,
    this.memoryMb,
    this.processes,
  });

  factory FlyAppVmConfig.fromJson(Map<String, Object?> json) =>
      _$FlyAppVmConfigFromJson(json);

  final String? size;
  final String? memory;
  final String? cpuKind;
  final int? cpus;
  final int? memoryMb;
  final List<String>? processes;

  Map<String, Object?> toJson() => _$FlyAppVmConfigToJson(this);
}
