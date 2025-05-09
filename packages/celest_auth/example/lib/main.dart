import 'package:celest_auth_example/test_keys.dart';
import 'package:celest_auth_example_client/celest_auth_example_client.dart';
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

  Future<void> signIn() async {
    try {
      if (_emailController.text.isNotEmpty) {
        await celest.auth.email.authenticate(email: _emailController.text);
      } else {
        throw Exception('Email is required');
      }
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
            padding: const EdgeInsets.all(20),
            child: StreamBuilder(
              stream: celest.auth.authStateChanges,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                final state = snapshot.data!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state case Authenticated(:final user))
                      Text(
                        'Currently signed in: id=${user.id}, '
                        'email=${user.primaryEmail?.email}',
                        key: TestKeys.txtSignedIn,
                      )
                    else
                      Text('Currently signed out', key: TestKeys.txtSignedOut),
                    const SizedBox(height: 16),
                    TextButton(
                      key: TestKeys.btnMakeRequest,
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
                            key: TestKeys.wMakeRequestResponse,
                            future: request,
                            builder:
                                (context, snapshot) => switch (snapshot) {
                                  AsyncSnapshot(:final error?) => Text(
                                    'Error: $error',
                                  ),
                                  AsyncSnapshot(data: final response?) => Text(
                                    'Response: $response',
                                  ),
                                  _ => const CircularProgressIndicator(),
                                },
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    ...switch (state) {
                      OtpNeedsVerification() => [
                        TextField(
                          key: TestKeys.inOtp,
                          controller: _otpController,
                          decoration: const InputDecoration(labelText: 'OTP'),
                          autofillHints: const [AutofillHints.oneTimeCode],
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          key: TestKeys.btnVerifyOtp,
                          onPressed:
                              () => state.verify(otpCode: _otpController.text),
                          child: const Text('Verify OTP'),
                        ),
                      ],
                      Unauthenticated() => [
                        TextField(
                          key: TestKeys.inEmail,
                          controller: _emailController,
                          decoration: const InputDecoration(labelText: 'Email'),
                          autofillHints: const [AutofillHints.email],
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          key: TestKeys.btnSignIn,
                          onPressed: signIn,
                          child: const Text('Sign In'),
                        ),
                      ],
                      Authenticated() => [
                        TextButton(
                          key: TestKeys.btnSignOut,
                          onPressed: celest.auth.signOut,
                          child: const Text('Sign out'),
                        ),
                      ],
                      AuthLinkUser() => [
                        const Text('User already exists'),
                        TextButton(
                          onPressed: state.confirm,
                          child: const Text('Link account'),
                        ),
                      ],
                      AuthRegisterUser() => [
                        const Text('User does not exist'),
                        TextButton(
                          onPressed: state.confirm,
                          child: const Text('Create new account'),
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
