import 'package:celest_auth/celest_auth.dart';
import 'package:celest_core/celest_core.dart';
import 'package:corks/corks.dart';
import 'package:flutter/material.dart';

final authClient = AuthClient(
  baseUri: Uri.http('localhost:8080'),
);
final passkeys = PasskeyPlatform(protocol: authClient.passkeys);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

typedef User = ({
  String userId,
  String email,
});

final class _State {
  _State(
    this.signingIn, {
    this.user,
  });

  final bool signingIn;
  final User? user;
}

class _MainAppState extends State<MainApp> {
  final _state = ValueNotifier(_State(false));

  Future<void> signInWithPasskey() async {
    try {
      _state.value = _State(true);
      final response = await passkeys.register(
        const PasskeyRegistrationRequest(
          username: 'dillon@celest.dev',
        ),
      );
      await authClient.passkeys.verifyRegistration(
        registration: response,
      );
      final token = authClient.passkeys.token!;
      print('Got token: $token');
      final cork = Cork.parse(token);
      final bearer = (cork.bearer!.block as EntityBearer).entity;
      final userId = bearer.uid.id;
      final email = bearer.attributes['email']!.string;
      print('User ID: $userId');
      print('Email: $email');
      _state.value = _State(false, user: (
        userId: userId,
        email: email,
      ));
    } on Exception catch (e, st) {
      print('Error: $e');
      print('Stacktrace: $st');
      _state.value = _State(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ValueListenableBuilder(
            valueListenable: _state,
            builder: (context, state, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Currently signed in: ${state.user?.email}'),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: !state.signingIn && state.user == null
                        ? signInWithPasskey
                        : null,
                    child: const Text('Sign in with Passkey'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
