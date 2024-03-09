import 'package:celest_backend/client.dart';
import 'package:flutter/material.dart';

void main() {
  celest.init();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();
  Future<Object>? _request;

  Future<void> signUp() async {
    try {
      await celest.auth.email.authenticate(email: _emailController.text);
      _emailController.clear();
    } on Exception catch (e, st) {
      debugPrint('Error: $e');
      debugPrint('Stacktrace: $st');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: StreamBuilder(
              stream: celest.auth.authStateChanges,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                final state = snapshot.data!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state case Authenticated(:final user))
                      Text('Currently signed in: ${user.email}')
                    else
                      const Text('Currently signed out'),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _request = celest.functions.greeting.sayHello();
                        });
                      },
                      child: const Text('Make authenticated request'),
                    ),
                    if (_request case final request?) ...[
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 50,
                        child: Center(
                          child: FutureBuilder(
                            future: request,
                            builder: (context, snapshot) => switch (snapshot) {
                              AsyncSnapshot(:final error?) =>
                                Text('Error: $error'),
                              AsyncSnapshot(data: final response?) =>
                                Text('Response: $response'),
                              _ => const CircularProgressIndicator(),
                            },
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    ...switch (state) {
                      EmailNeedsVerification() => [
                          TextField(
                            key: const ValueKey('otp'),
                            controller: _otpController,
                            decoration: const InputDecoration(
                              labelText: 'OTP',
                            ),
                            autofillHints: const [
                              AutofillHints.oneTimeCode,
                            ],
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: () => state.verify(
                              _otpController.text,
                            ),
                            child: const Text('Verify OTP'),
                          ),
                        ],
                      Unauthenticated() => [
                          TextField(
                            key: const ValueKey('email'),
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                            autofillHints: const [
                              AutofillHints.email,
                            ],
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: signUp,
                            child: const Text('Sign In with Email'),
                          ),
                        ],
                      Authenticated() => [
                          TextButton(
                            onPressed: celest.auth.signOut,
                            child: const Text('Sign out'),
                          ),
                        ],
                    },
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
