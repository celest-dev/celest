// ignore_for_file: overridden_fields

import 'dart:io';

import 'package:args/args.dart';
import 'package:celest_cli/src/commands/auth/authenticate.dart';
import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/exceptions.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cloud/celest_cloud.dart';
import 'package:celest_cloud/src/proto/google/protobuf/timestamp.pb.dart' as pb;
import 'package:celest_core/celest_core.dart';
import 'package:dart_console/dart_console.dart';
import 'package:logging/logging.dart';
import 'package:mason_logger/mason_logger.dart' show Progress;
import 'package:protobuf/protobuf.dart';
import 'package:stream_transform/stream_transform.dart';

enum CloudCommandType { create, get, list, update, delete }

typedef CloudVerbs = ({String run, String running, String completed});

abstract base class BaseCloudCommand<R extends GeneratedMessage>
    extends CelestCommand with Authenticate {
  /// The resource type of the service, e.g. `Project`.
  String get resourceType;

  /// Creates an empty [Resource] protobuf message.
  R createEmptyResource();

  /// The parsed arguments of the command.
  CloudCommandOptions get options => CloudCommandOptions(argResults!);
}

base mixin CloudOperationCommand<R extends GeneratedMessage>
    on BaseCloudCommand<R> {
  /// Starts the operation in Celest Cloud.
  CloudOperation<R> callService();

  CloudVerbs get verbs;

  /// The parsed arguments of the command.
  @override
  CloudOperationCommandOptions get options =>
      CloudOperationCommandOptions(argResults!);

  @override
  late final ArgParser argParser = super.argParser
    ..addFlag(
      'validate-only',
      // TODO(dnys1): Needs to be implemented on the backend
      hide: true,
      negatable: false,
      defaultsTo: false,
      help: 'If set, the command will only validate the request, '
          'without creating the ${resourceType.toLowerCase()}',
    )
    ..addOption(
      'request-id',
      // TODO(dnys1): Needs to be implemented on the backend
      hide: true,
    )
    ..addFlag(
      'wait',
      negatable: true,
      defaultsTo: false,
      help: 'If set, the command will wait for the operation to complete',
    );

  @override
  Future<int> run() async {
    await super.run();

    await assertAuthenticated();

    final verbs = options.validateOnly
        ? const (
            run: 'validate',
            running: 'Validating',
            completed: 'validated',
          )
        : this.verbs;

    final progress = cliLogger.progress('${verbs.running} $resourceType...');
    try {
      final operation = callService();
      if (!options.wait) {
        final state = await operation.first;
        progress.complete('$resourceType has been ${verbs.completed}!');
        if (!state.done) {
          cliLogger.info(
            'Some resources are still being reconciled in the cloud',
          );
        }
        if (state.metadata.hasResource()) {
          final resource = state.metadata.resource.unpackInto(
            createEmptyResource(),
          );
          stdout
            ..writeln()
            ..writeln(resource);
        }
        return 0;
      }

      // TODO(dnys1): Expose stream.cancel so we can async cancel the operation, eg.
      // when the user presses Ctrl-C

      final resource = await _waitOperation(
        operation: operation,
        progress: progress,
      );

      stdout
        ..writeln()
        ..writeln(resource);
      return 0;
    } on CloudException catch (e) {
      progress.fail('Failed to ${verbs.run} $resourceType');
      throw CliException(e.message);
    } on Object {
      progress.fail('Failed to ${verbs.run} $resourceType');
      rethrow;
    }
  }

  Future<R> _waitOperation({
    required CloudOperation<R> operation,
    required Progress progress,
    // TODO(dnys1): Allow setting timeout
    // Duration? timeout,
  }) async {
    await for (final update in operation) {
      switch (update) {
        case OperationInProgress(:final metadata):
          final resource = createEmptyResource();
          if (metadata.hasResource()) {
            metadata.resource.unpackInto(resource);
            metadata.clearResource();
          }
          logger.finest('Operation metadata:\n$metadata');
          logger.finest('$resourceType state:\n$resource');
        case OperationSuccess(response: final result):
          return result;
        case OperationCancelled(:final metadata):
          // TODO(dnys1): Intercept Ctrl-C to cancel
          progress.cancel();
          throw CloudException.cancelled(
            message: 'Operation was canceled remotely',
            details: JsonValue(metadata.toProto3Json()!),
          );
        case OperationFailure(:final error):
          throw CloudException.fromGrpcError(error);
      }
    }
    unreachable('Operation stopped abruptly');
  }
}

final class CloudCliOperation<R extends GeneratedMessage> {
  CloudCliOperation(
    this._operation, {
    required this.resourceType,
    required this.logger,
  });

  final String resourceType;
  final CloudOperation<R> _operation;
  final Logger logger;

  Future<R> run({
    required CloudVerbs verbs,
    required Future<void> cancelTrigger,
    required R resource,
  }) async {
    try {
      return await _waitOperation(
        cancelTrigger: cancelTrigger,
        resource: resource,
      );
    } on CloudException catch (e) {
      throw CliException(e.message);
    } on Object {
      rethrow;
    }
  }

  Future<R> _waitOperation({
    required Future<void> cancelTrigger,
    required R resource,
    // TODO(dnys1): Allow setting timeout
    // Duration? timeout,
  }) async {
    await for (final update in _operation.takeUntil(cancelTrigger)) {
      switch (update) {
        case OperationInProgress(:final metadata):
          final resourceState = resource.createEmptyInstance();
          if (metadata.hasResource()) {
            metadata.resource.unpackInto(resourceState);
            metadata.clearResource();
          }
          logger.finest('Operation metadata:\n$metadata');
          logger.finest('$resourceType state:\n$resource');
        case OperationSuccess(response: final result):
          return result;
        case OperationCancelled(:final metadata):
          throw CloudException.cancelled(
            message: 'Operation was canceled remotely',
            details: JsonValue(metadata.toProto3Json()!),
          );
        case OperationFailure(:final error):
          throw CloudException.fromGrpcError(error);
      }
    }
    throw const CancellationException('Operation was canceled');
  }
}

abstract base class CloudCreateCommand<R extends GeneratedMessage>
    extends BaseCloudCommand<R> with CloudOperationCommand<R> {
  @override
  CloudVerbs get verbs => const (
        run: 'create',
        running: 'Creating',
        completed: 'created',
      );

  /// The parent resource type of the service, e.g. `Organization`.
  String? get parentResourceType;

  @override
  late final ArgParser argParser = () {
    final argParser = super.argParser;
    final parent = parentResourceType?.toLowerCase();
    final resource = resourceType.toLowerCase();
    if (parent case final parent?) {
      argParser.addOption(
        'parent',
        mandatory: true,
        help: 'The parent $parent of the $resource',
        valueHelp: parent.toUpperCase(),
      );
    }
    return argParser
      ..addOption(
        'display-name',
        mandatory: true,
        help: 'The display name of the $resource',
      )
      ..addMultiOption(
        'annotation',
        help: 'A list of key-value pairs to associate with the $resource',
        valueHelp: 'KEY=VALUE',
        splitCommas: true,
      );
  }();

  @override
  CreateCommandArgResults get options => CreateCommandArgResults(argResults!);
}

abstract base class CloudGetCommand<R extends GeneratedMessage>
    extends BaseCloudCommand<R> {
  Future<R?> callService();

  @override
  Future<int> run() async {
    await super.run();

    await assertAuthenticated();

    try {
      final resource = await callService();
      if (resource == null) {
        stderr.writeln('$resourceType not found');
        return 1;
      }
      stdout.writeln(resource);
      return 0;
    } on CloudException catch (e) {
      throw CliException(e.message);
    }
  }
}

typedef CloudListResult<R extends GeneratedMessage> = ({
  List<R> items,
  String? nextPageToken
});

enum CloudListMode {
  raw,
  table,
}

abstract base class CloudListCommand<R extends GeneratedMessage>
    extends BaseCloudCommand<R> {
  Future<CloudListResult<R>> callService();

  /// The parent type of the resource, e.g. `Organization`.
  String? get parentResourceType;

  @override
  late final ArgParser argParser = () {
    final argParser = super.argParser;
    final parent = parentResourceType?.toLowerCase();
    final resource = resourceType.toLowerCase();
    if (parent case final parent?) {
      argParser.addOption(
        'parent',
        mandatory: false,
        help: 'The parent $parent of the ${resource}s to list',
        valueHelp: parent.toUpperCase(),
      );
    }
    return argParser
      ..addOption(
        'page-size',
        // TODO(dnys1): Get pagination working in CLI
        hide: true,
        abbr: 'n',
        help: 'The number of ${resource}s to return',
        defaultsTo: '10',
      )
      ..addOption('filter', hide: true, help: 'The filter to apply to the list')
      ..addOption(
        'order-by',
        hide: true,
        help: 'The order to apply to the list',
      )
      ..addFlag(
        'show-deleted',
        negatable: false,
        help: 'If set, the command will show deleted ${resource}s',
      )
      ..addOption(
        'display',
        abbr: 'd',
        allowed: CloudListMode.values.map((it) => it.name),
        defaultsTo: CloudListMode.table.name,
        help: 'The display mode for results',
      );
  }();

  @override
  ListCommandArgResults get options => ListCommandArgResults(argResults!);

  @override
  Future<int> run() async {
    await super.run();

    await assertAuthenticated();

    try {
      final result = await callService();
      if (result.items.isEmpty) {
        cliLogger.info('No ${resourceType.toLowerCase()}s found');
      } else {
        switch (options.mode) {
          case CloudListMode.raw:
            _showRawResult(result);
          case CloudListMode.table:
            _showTableResult(result);
        }
      }
      return 0;
    } on CloudException catch (e) {
      throw CliException(e.message);
    }
  }

  void _showRawResult(CloudListResult<R> result) {
    for (final item in result.items) {
      stdout.writeln(item);
    }
  }

  void _showTableResult(CloudListResult<R> result) {
    final table = Table();
    final columns = createEmptyResource().info_.byName.keys;
    for (final column in columns) {
      table.insertColumn(header: column);
    }
    for (final item in result.items) {
      final row = <Object>[];
      for (final column in columns) {
        final tag = item.getTagNumber(column)!;
        if (!item.hasField(tag)) {
          row.add('<not set>');
        } else {
          final value = item.getField(tag) as Object;
          row.add(switch (value) {
            final pb.Timestamp ts => ts.toDateTime().toLocal(),
            final ProtobufEnum enum_ when enum_.value == 0 => '<not set>',
            final value => value,
          });
        }
      }
      table.insertRow(row);
    }
    stdout.writeln(table);
  }
}

abstract base class CloudUpdateCommand<R extends GeneratedMessage>
    extends BaseCloudCommand<R> with CloudOperationCommand<R> {
  @override
  CloudVerbs get verbs => const (
        run: 'update',
        running: 'Updating',
        completed: 'updated',
      );

  @override
  late final ArgParser argParser = () {
    final argParser = super.argParser;
    final resource = resourceType.toLowerCase();
    return argParser
      ..addOption('display-name', help: 'The display name of the $resource')
      ..addMultiOption(
        'annotation',
        help: 'A list of key-value pairs to associate with the $resource',
        valueHelp: 'KEY=VALUE',
        splitCommas: true,
      )
      ..addOption(
        'etag',
        // TODO(dnys1): Needs to be implemented on the backend
        hide: true,
      );
  }();

  @override
  UpdateCommandArgResults get options => UpdateCommandArgResults(argResults!);
}

abstract base class CloudDeleteCommand<R extends GeneratedMessage>
    extends BaseCloudCommand<R> with CloudOperationCommand<R> {
  @override
  R createEmptyResource();

  @override
  CloudVerbs get verbs => const (
        run: 'delete',
        running: 'Deleting',
        completed: 'deleted',
      );

  @override
  late final ArgParser argParser = () {
    final argParser = super.argParser;
    final resource = resourceType.toLowerCase();
    return argParser
      ..addFlag(
        'allow-missing',
        abbr: 'u',
        // TODO(dnys1): Needs to be implemented on the backend
        hide: true,
        negatable: false,
        defaultsTo: false,
        help: 'If set, and the $resource is not found, the command will still '
            'succeed',
      )
      ..addFlag(
        'force',
        abbr: 'f',
        negatable: false,
        defaultsTo: false,
        help: 'If set, any child resourcess of the $resource will '
            'also be marked for deletion. Otherwise, the request will only '
            'work if the $resource has no children',
      )
      ..addOption(
        'etag',
        // TODO(dnys1): Needs to be implemented on the backend
        hide: true,
      );
  }();

  @override
  DeleteCommandArgResults get options => DeleteCommandArgResults(argResults!);
}

extension type CloudCommandOptions(ArgResults argResults)
    implements ArgResults {
  String get resourceId {
    final id = rest.elementAtOrNull(0);
    if (id == null) {
      // celest <resource> <verb>
      final command = arguments.take(3).join(' ');
      throw CliException('Usage: $command <ID>');
    }
    return id;
  }
}

extension type CloudOperationCommandOptions(ArgResults argResults)
    implements CloudCommandOptions {
  bool get validateOnly => flag('validate-only');

  String? get requestId => option('request-id');

  bool get wait => flag('wait');
}

extension type CreateCommandArgResults(ArgResults argResults)
    implements CloudOperationCommandOptions {
  String get parent => option('parent')!;

  String get displayName => option('display-name') ?? '';

  bool get allowMissing => flag('allow-missing');

  Map<String, String> get annotations {
    final annotations = <String, String>{};
    for (final annotation in multiOption('annotation')) {
      final parts = annotation.split('=');
      if (parts.length != 2) {
        throw CliException(
          'Invalid annotation: $annotation. Must be in the form KEY=VALUE',
        );
      }
      annotations[parts[0]] = parts[1];
    }
    return annotations;
  }
}

extension type UpdateCommandArgResults(ArgResults argResults)
    implements CloudOperationCommandOptions {
  String? get displayName => option('display-name') ?? '';

  bool get allowMissing => flag('allow-missing');

  String? get etag => option('etag');

  Map<String, String>? get annotations {
    if (!wasParsed('annotation')) {
      return null;
    }
    final annotations = <String, String>{};
    for (final annotation in multiOption('annotation')) {
      final parts = annotation.split('=');
      if (parts.length != 2) {
        throw CliException(
          'Invalid annotation: $annotation. Must be in the form KEY=VALUE',
        );
      }
      annotations[parts[0]] = parts[1];
    }
    return annotations;
  }
}

extension type DeleteCommandArgResults(ArgResults argResults)
    implements CloudOperationCommandOptions {
  bool get force => flag('force');

  bool get allowMissing => flag('allow-missing');

  String? get etag => option('etag');
}

extension type ListCommandArgResults(ArgResults argResults)
    implements CloudOperationCommandOptions {
  int get pageSize => int.parse(option('page-size')!);

  String? get filter => option('filter');

  String? get parentResourceId => option('parent');

  String? get orderBy => option('order-by');

  bool get showDeleted => flag('show-deleted');

  CloudListMode get mode => CloudListMode.values.byName(option('display')!);
}
