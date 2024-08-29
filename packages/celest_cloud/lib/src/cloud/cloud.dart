import 'package:celest_cloud/src/cloud/authentication/authentication.dart';
import 'package:celest_cloud/src/cloud/cloud_protocol.dart';
import 'package:celest_cloud/src/cloud/cloud_protocol.grpc.dart';
import 'package:celest_cloud/src/cloud/cloud_protocol.http.dart';
import 'package:celest_cloud/src/cloud/organizations/organizations.dart';
import 'package:celest_cloud/src/cloud/projects/projects.dart';
import 'package:celest_cloud/src/cloud/users/users.dart';
import 'package:celest_cloud/src/proto.dart';
import 'package:celest_core/_internal.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:os_detect/os_detect.dart' as os;
import 'package:protobuf/protobuf.dart';

class CelestCloud {
  CelestCloud({
    required Uri uri,
    Authenticator authenticator = const Authenticator.static(),
    ClientType? clientType,
    Logger? logger,
    String? userAgent,
    http.Client? httpClient,
  })  : _protocol = kIsWeb
            ? CloudProtocolHttp(
                uri: uri,
                httpClient: httpClient,
                authenticator: authenticator,
                logger: logger,
              )
            : CloudProtocolGrpc(
                uri: uri,
                userAgent: userAgent,
                authenticator: authenticator,
                logger: logger,
              ),
        _clientType = clientType ?? _defaultClientType,
        _logger = logger ?? Logger('Celest.Cloud');

  @pragma('vm:platform-const')
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
    Empty(),
    OperationMetadata(),
    Organization(),
    CreateOrganizationMetadata(),
    Project(),
  ]);

  final CloudProtocol _protocol;
  final ClientType _clientType;
  final Logger _logger;

  late final Authentication authentication = Authentication(
    protocol: _protocol.authentication,
    clientType: _clientType,
    logger: _logger,
  );

  late final Organizations organizations = Organizations(
    protocol: _protocol.organizations,
    operations: _protocol.operations,
    logger: _logger,
  );

  late final Users users = Users(
    protocol: _protocol.users,
    logger: _logger,
  );

  late final Projects projects = Projects(
    protocol: _protocol.projects,
    operations: _protocol.operations,
    logger: _logger,
  );
}
