import 'package:celest/celest.dart';

const project = Project(name: 'auth');

const auth = Auth(
  providers: [
    AuthProvider.email(),
  ],
);
