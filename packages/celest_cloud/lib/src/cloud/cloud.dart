/// @docImport 'dart:io';
library;

import 'package:celest_ast/src/proto/celest/ast/v1/resolved_ast.pb.dart'
    as astpb;
import 'package:celest_cloud/src/cloud/authentication/authentication.dart';
import 'package:celest_cloud/src/cloud/cloud_protocol.dart';
import 'package:celest_cloud/src/cloud/cloud_protocol.grpc.dart';
import 'package:celest_cloud/src/cloud/cloud_protocol.http.dart';
import 'package:celest_cloud/src/cloud/operations/operations.dart';
import 'package:celest_cloud/src/cloud/organizations/organizations.dart';
import 'package:celest_cloud/src/cloud/projects/projects.dart';
import 'package:celest_cloud/src/cloud/subscriptions/subscriptions.dart';
import 'package:celest_cloud/src/cloud/users/users.dart';
import 'package:celest_cloud/src/proto.dart';
import 'package:celest_cloud/src/proto/google/protobuf/duration.pb.dart' as pb;
import 'package:celest_cloud/src/proto/google/protobuf/empty.pb.dart' as pb;
import 'package:celest_cloud/src/proto/google/protobuf/field_mask.pb.dart'
    as pb;
import 'package:celest_cloud/src/proto/google/protobuf/struct.pb.dart' as pb;
import 'package:celest_cloud/src/proto/google/protobuf/timestamp.pb.dart' as pb;
import 'package:celest_cloud/src/proto/google/protobuf/wrappers.pb.dart' as pb;
import 'package:celest_cloud/src/proto/google/rpc/status.pb.dart' as pb;
import 'package:celest_core/_internal.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:os_detect/os_detect.dart' as os;
import 'package:protobuf/protobuf.dart';

class CelestCloud {
  factory CelestCloud({
    required Uri uri,
    Authenticator authenticator = const Authenticator.static(),
    ClientType? clientType,
    Logger? logger,
    String? userAgent,
    http.Client? httpClient,
  }) {
    return kIsWeb
        ? CelestCloud.http(
            uri,
            authenticator: authenticator,
            clientType: clientType,
            logger: logger,
            httpClient: httpClient,
          )
        : CelestCloud.grpc(
            uri,
            authenticator: authenticator,
            clientType: clientType,
            logger: logger,
            userAgent: userAgent,
            httpClient: httpClient,
          );
  }

  CelestCloud._({
    required CloudProtocol protocol,
    Uri? uri,
    Authenticator authenticator = const Authenticator.static(),
    ClientType? clientType,
    Logger? logger,
    http.Client? httpClient,
  })  : _protocol = protocol,
        _baseUri = uri,
        _httpClient = httpClient,
        _authenticator = authenticator,
        _clientType = clientType ?? _defaultClientType,
        _logger = logger ?? Logger('Celest.Cloud');

  CelestCloud.http(
    Uri uri, {
    Authenticator authenticator = const Authenticator.static(),
    ClientType? clientType,
    Logger? logger,
    http.Client? httpClient,
  }) : this._(
          uri: uri,
          authenticator: authenticator,
          protocol: CloudProtocolHttp(
            uri: uri,
            httpClient: httpClient,
            authenticator: authenticator,
            logger: logger,
          ),
          clientType: clientType,
          logger: logger,
          httpClient: httpClient,
        );

  /// Creates a gRPC interface for Celest Cloud.
  ///
  /// [address] must be either a [Uri] or [InternetAddress].
  CelestCloud.grpc(
    Object address, {
    Authenticator authenticator = const Authenticator.static(),
    ClientType? clientType,
    String? userAgent,
    Logger? logger,
    http.Client? httpClient,
  }) : this._(
          uri: address is Uri ? address : null,
          authenticator: authenticator,
          protocol: CloudProtocolGrpc(
            host: address,
            userAgent: userAgent,
            authenticator: authenticator,
            logger: logger,
          ),
          clientType: clientType,
          logger: logger,
          httpClient: httpClient,
        );

  static final _defaultClientType = kIsWeb
      ? ClientType.WEB
      : os.isAndroid
          ? ClientType.ANDROID
          : os.isIOS
              ? ClientType.IOS
              : os.isMacOS
                  ? ClientType.MACOS
                  : os.isWindows
                      ? ClientType.WINDOWS
                      : os.isLinux
                          ? ClientType.LINUX
                          : ClientType.CLIENT_TYPE_UNSPECIFIED;

  static final typeRegistry = TypeRegistry([
    // Cloud
    OperationMetadata(),
    Operation(),
    Organization(),
    Project(),
    ProjectEnvironment(),
    DeployProjectEnvironmentResponse(),

    // AST
    astpb.ResolvedProject(),

    // RPC
    pb.Status(),

    // Well-known types
    pb.BoolValue(),
    pb.StringValue(),
    pb.Int32Value(),
    pb.Int64Value(),
    pb.FloatValue(),
    pb.DoubleValue(),
    pb.Timestamp(),
    pb.BytesValue(),
    pb.Duration(),
    pb.FieldMask(),
    pb.Empty(),
    pb.Struct(),
    pb.ListValue(),
    pb.Value(),
  ]);

  final Uri? _baseUri;
  final http.Client? _httpClient;
  final Authenticator _authenticator;

  final CloudProtocol _protocol;
  final ClientType _clientType;
  final Logger _logger;

  late final CloudProtocolHttp _httpProtocol = CloudProtocolHttp(
    uri: _baseUri!,
    authenticator: _authenticator,
    httpClient: _httpClient,
    logger: _logger,
  );

  late final Authentication authentication = Authentication(
    protocol: _httpProtocol.authentication,
    clientType: _clientType,
    logger: _logger,
  );

  late final Organizations organizations = Organizations(
    protocol: _protocol.organizations,
    operations: _protocol.operations,
    logger: _logger,
  );

  late final Users users = Users(
    protocol: _httpProtocol.users,
    logger: _logger,
  );

  late final Projects projects = Projects(
    protocol: _protocol.projects,
    operations: _protocol.operations,
    logger: _logger,
  );

  late final Subscriptions subscriptions = Subscriptions(
    protocol: _protocol.subscriptions,
    logger: _logger,
  );

  late final Operations operations = Operations(
    protocol: _protocol.operations,
    logger: _logger,
  );
}
