import 'package:celest/celest.dart';

const project = Project(name: 'supabase');

const supabaseJwtSecret = secret('SUPABASE_JWT_SECRET');

const auth = Auth(
  providers: [
    ExternalAuthProvider.supabase(
      jwtSecret: supabaseJwtSecret,
    ),
  ],
);
