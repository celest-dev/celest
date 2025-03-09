import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/email/email_model.dart';
import 'package:celest_cloud_auth/src/email/email_provider.dart';
import 'package:celest_cloud_auth/src/email/templates/verification_code.dart';
import 'package:celest_cloud_auth/src/otp/otp_provider.dart';
import 'package:celest_core/_internal.dart';
import 'package:celest_core/celest_core.dart';
import 'package:http/http.dart' as http;

/// {@template celest_cloud_auth.email.resend_api}
/// An API client for the [Resend](https://resend.com/) email service.
/// {@endtemplate}
extension type ResendEmailProvider._(OtpSender _send)
    implements EmailOtpProvider {
  /// Creates a new [ResendEmailProvider] client.
  ///
  /// {@macro celest_cloud_auth.email.resend_api}
  ResendEmailProvider({
    required String apiKey,
    required http.Client client,
    Uri? baseUri,
  }) : this._(
          (Otp otp) async {
            final (:to, :code) = otp;
            baseUri ??= Uri.parse('https://api.resend.com');
            final uri = baseUri!.resolve('./emails');
            final message = EmailMessage(
              from: 'no-reply@auth.celest.dev',
              to: [to],
              subject: 'Verify your account',
              body: EmailBody.html(
                EmailTemplate.verificationCode.render(
                  VerificationCodeEmailParams(
                    email: to,
                    code: code,
                    organizationName: 'Celest',
                    type: VerificationCodeEmailType.generic,
                  ),
                ),
              ),
            );
            final res = await client.post(
              uri,
              body: JsonUtf8.encode(SendEmailRequest(message).toJson()),
              headers: {
                'content-type': 'application/json',
                'authorization': 'Bearer $apiKey',
              },
            );
            if (res.statusCode != HttpStatus.ok) {
              throw CloudException.fromHttpResponse(res);
            }
            final response = SendEmailResponse(
              JsonUtf8.decodeMap(res.bodyBytes),
            );
            context.logger.info('Email sent to $to: ${response.id}');
          },
        );
}

/// A request to send an email via the Resend API.s
extension type SendEmailRequest(EmailMessage email) {
  /// Converts the email message to a JSON object.
  ///
  /// https://raw.githubusercontent.com/resend/resend-openapi/main/resend.yaml
  Map<String, Object?> toJson() => {
        'from': email.from,
        'to': email.to,
        'subject': email.subject,
        if (email.bcc != null)
          'bcc': switch (email.bcc) {
            [final single] => single,
            final multiple => multiple,
          },
        if (email.cc != null)
          'cc': switch (email.cc) {
            [final single] => single,
            final multiple => multiple,
          },
        ...switch (email.body) {
          final EmailBodyText text => {'text': text.content},
          final EmailBodyHtml html => {'html': html.content},
        },
        if (email.replyTo != null)
          'reply_to': switch (email.replyTo) {
            [final single] => single,
            final multiple => multiple,
          },
        if (email.headers case final headers?) 'headers': headers,
        if (email.scheduledAt case final scheduledAt?)
          'scheduled_at': scheduledAt.toIso8601String(),
      };
}

/// A response from the Resend API after sending an email.
extension type SendEmailResponse(Map<String, Object?> _json) {
  /// The ID of the sent email.
  String get id => _json['id'] as String? ?? '<unknown>';
}
