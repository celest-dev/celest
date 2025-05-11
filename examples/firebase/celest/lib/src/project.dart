import 'package:celest/celest.dart';

const project = Project(name: 'firebase_test');

const auth = Auth(providers: [ExternalAuthProvider.firebase()]);
