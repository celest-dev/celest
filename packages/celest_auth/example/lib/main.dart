import 'package:celest_auth/src/flows/email_flow.dart';
import 'package:celest_backend/client.dart';
import 'package:celest_core/celest_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:http/http.dart' as http;

void main() {
  celest.init();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

enum _Step { idle, signingIn, needsVerification, signedIn }

final class _State {
  _State(
    this.step, {
    this.verification,
    this.user,
  });

  final _Step step;
  final EmailSignUpNeedsVerification? verification;
  final User? user;
}

class _MainAppState extends State<MainApp> {
  final _state = ValueNotifier(_State(_Step.idle));
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();
  Future<http.Response>? _request;

  Future<void> signUp() async {
    try {
      _state.value = _State(_Step.signingIn);
      final verify =
          await celest.auth.email.signUp(email: _emailController.text);
      print('Needs verification');
      _emailController.clear();
      _state.value = _State(_Step.needsVerification, verification: verify);
    } on Exception catch (e, st) {
      print('Error: $e');
      print('Stacktrace: $st');
      _state.value = _State(_Step.idle);
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
                    ...switch (state.step) {
                      _Step.needsVerification => [
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
                            onPressed: () async {
                              final user = await state.verification!.verifyOtp(
                                _otpController.text,
                              );
                              _state.value = _State(_Step.signedIn, user: user);
                            },
                            child: const Text('Verify OTP'),
                          ),
                          const SizedBox(height: 16),
                          StateNotifierBuilder(
                            stateNotifier: state.verification!.canResend,
                            builder: (context, canResend, child) {
                              final (resend, resendIn) = canResend;
                              return TextButton(
                                onPressed: resend
                                    ? () async {
                                        await state.verification!.resend();
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Resent OTP to ${state.verification!.email}',
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    : null,
                                child: resend || resendIn == Duration.zero
                                    ? const Text('Resend OTP')
                                    : Text(
                                        'Resend OTP (${resendIn.inSeconds})',
                                      ),
                              );
                            },
                          ),
                        ],
                      _Step.idle || _Step.signingIn => [
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
                            onPressed:
                                state.step != _Step.signingIn ? signUp : null,
                            child: const Text('Sign Up'),
                          ),
                        ],
                      _Step.signedIn => [
                          TextButton(
                            onPressed: () {
                              _state.value = _State(_Step.idle);
                            },
                            child: const Text('Sign out'),
                          ),
                        ],
                    }
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
