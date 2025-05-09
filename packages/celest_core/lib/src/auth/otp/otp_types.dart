final class OtpSendRequest {
  const OtpSendRequest({required this.email});

  factory OtpSendRequest.fromJson(Map<String, Object?> json) {
    return OtpSendRequest(email: json['email'] as String);
  }

  final String email;

  Map<String, Object?> toJson() => {'email': email};

  @override
  String toString() {
    return 'OtpSendRequest(email: $email)';
  }
}

final class OtpVerifyRequest {
  const OtpVerifyRequest({required this.email, required this.otp});

  factory OtpVerifyRequest.fromJson(Map<String, Object?> json) {
    return OtpVerifyRequest(
      email: json['email'] as String,
      otp: json['otp'] as String,
    );
  }

  final String email;
  final String otp;

  Map<String, Object?> toJson() => {'email': email, 'otp': otp};

  @override
  String toString() {
    return 'OtpVerifyRequest(email: $email, otp: $otp)';
  }
}

final class OtpParameters {
  const OtpParameters({required this.nextResend, required this.nextVerify});

  factory OtpParameters.fromJson(Map<String, Object?> json) {
    return OtpParameters(
      nextResend: DateTime.fromMillisecondsSinceEpoch(json['nextRetry'] as int),
      nextVerify: DateTime.fromMillisecondsSinceEpoch(
        json['nextVerify'] as int,
      ),
    );
  }

  final DateTime nextResend;
  final DateTime nextVerify;

  Map<String, Object?> toJson() => {
    'nextRetry': nextResend.millisecondsSinceEpoch,
    'nextVerify': nextVerify.millisecondsSinceEpoch,
  };

  @override
  String toString() {
    return 'OtpParameters(nextRetry: $nextResend, nextVerify: $nextVerify)';
  }
}
