typedef Otp = ({
  String to,
  String code,
});

typedef OtpSender = Future<void> Function(Otp);
