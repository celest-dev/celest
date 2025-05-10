typedef Otp = ({String to, String code});

extension OtpX on Otp {
  Map<String, Object?> toJson() => {'to': to, 'code': code};
}

typedef OtpSender = Future<void> Function(Otp);
