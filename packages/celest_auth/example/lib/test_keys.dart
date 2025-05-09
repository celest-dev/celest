import 'package:flutter/widgets.dart';

extension type TestKeys._(Key _) implements Key {
  TestKeys(String key) : _ = Key(key);

  static final TestKeys btnMakeRequest = TestKeys('btn_make_request');
  static final TestKeys wMakeRequestResponse = TestKeys(
    'w_make_request_response',
  );
  static final TestKeys inOtp = TestKeys('in_otp');
  static final TestKeys btnVerifyOtp = TestKeys('btn_verify_otp');
  static final TestKeys inEmail = TestKeys('in_email');
  static final TestKeys btnSignIn = TestKeys('btn_sign_in');
  static final TestKeys btnSignOut = TestKeys('btn_sign_out');
  static final TestKeys txtSignedIn = TestKeys('txt_signed_in');
  static final TestKeys txtSignedOut = TestKeys('txt_signed_out');
}
