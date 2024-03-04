import 'package:celest_auth/celest_auth.dart';
import 'package:celest_core/celest_core.dart';
import 'package:corks/corks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final authClient = AuthClient(
  baseUri: Uri.https('a102-136-24-157-119.ngrok-free.app'),
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
  final _controller = TextEditingController();
  Future<http.Response>? _request;

  Future<void> signInWithPasskey() async {
    try {
      _state.value = _State(true);
      final response = await passkeys.register(
        PasskeyRegistrationRequest(
          username: _controller.text,
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ValueListenableBuilder(
              valueListenable: _state,
              builder: (context, state, child) {
                final isSignedIn = state.user != null;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state.user case final user?)
                      Text('Currently signed in: ${user.email}')
                    else
                      const Text('Currently signed out'),
                    if (_request case final request?) ...[
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 50,
                        child: Center(
                          child: FutureBuilder(
                            future: request,
                            builder: (context, snapshot) => switch (snapshot) {
                              AsyncSnapshot(:final Object error) ||
                              AsyncSnapshot(
                                data: http.Response(
                                  statusCode: != 200,
                                  body: final Object error
                                )
                              ) =>
                                Text('Error: $error'),
                              AsyncSnapshot(data: final response?) =>
                                Text('Response: ${response.body}'),
                              _ => const CircularProgressIndicator(),
                            },
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    if (!isSignedIn) ...[
                      TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        autofillHints: const [
                          AutofillHints.username,
                          AutofillHints.email,
                        ],
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: !state.signingIn ? signInWithPasskey : null,
                        child: const Text('Sign in with Passkey'),
                      ),
                    ] else ...[
                      TextButton(
                        onPressed: () {
                          _state.value = _State(false);
                        },
                        child: const Text('Sign out'),
                      ),
                    ],
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _request = http.get(
                            Uri.parse(
                              'https://a102-136-24-157-119.ngrok-free.app/authenticated',
                            ),
                          );
                        });
                      },
                      child: const Text('Make HTTP request'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
