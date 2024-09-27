import 'package:celest/celest.dart';
import 'package:celest/http.dart';
import 'package:supabase/supabase.dart' as supabase;

@cloud
@http(method: HttpMethod.get)
Future<supabase.AuthUser> currentUser() async {
  return supabase.AuthUser(
    id: '123',
    appMetadata: {
      'provider': 'email',
    },
    userMetadata: {
      'name': 'Celest',
    },
    aud: 'aud',
    email: 'email',
    phone: 'phone',
    createdAt: 'createdAt',
    role: 'role',
    updatedAt: 'updatedAt',
  );
}
