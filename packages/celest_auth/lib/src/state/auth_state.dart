import 'package:celest_auth/src/flows/auth_flow.dart';
import 'package:celest_auth/src/flows/email_flow.dart';
import 'package:celest_core/celest_core.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthInitializing extends AuthState {
  const AuthInitializing();
}

final class Unauthenticated extends AuthState {
  const Unauthenticated();
}

final class NeedsReauthentication extends AuthState {
  const NeedsReauthentication({
    required this.userId,
  });

  final String userId;
}

sealed class AuthFlowState<Flow extends AuthFlow> extends AuthState {
  const AuthFlowState({
    required this.flow,
  });

  final Flow flow;

  void cancel() => flow.cancel();
}

class EmailFlowState extends AuthFlowState<EmailFlow> {
  const EmailFlowState({required super.flow});
}

final class EmailAuthenticated extends EmailFlowState implements Authenticated {
  const EmailAuthenticated({
    required super.flow,
    required this.user,
  });

  @override
  final User user;
}

final class Authenticated extends AuthState {
  const Authenticated(this.user);

  final User user;
}
