import 'package:http/http.dart' as http;

import 'services.dart';
import 'turso_client.dart';

class Turso {
  Turso({
    required String apiToken,
    String baseUrl = 'https://api.turso.tech',
    http.Client? client,
  }) : _client = TursoClient(
         apiToken: apiToken,
         baseUrl: baseUrl,
         client: client,
       );

  final TursoClient _client;
  late final OrganizationService organizations = OrganizationService(_client);
  late final DatabaseService databases = DatabaseService(_client);
  late final GroupService groups = GroupService(_client);
  late final MemberService members = MemberService(_client);

  void dispose() {
    _client.dispose();
  }
}
