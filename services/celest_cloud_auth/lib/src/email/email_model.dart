import 'package:celest_cloud_auth/src/email/templates/verification_code.dart';

sealed class EmailBody {
  const factory EmailBody.text(String text) = EmailBodyText;
  const factory EmailBody.html(String html) = EmailBodyHtml;

  const EmailBody._(this.content);

  final String content;

  @override
  String toString() => content;
}

class EmailBodyText extends EmailBody {
  const EmailBodyText(super.text) : super._();
}

class EmailBodyHtml extends EmailBody {
  const EmailBodyHtml(super.html) : super._();
}

abstract interface class EmailTemplate<Params extends Object?> {
  static const VerificationCodeEmail verificationCode = VerificationCodeEmail();

  String render(Params params);
}

/// {@template celest_cloud_auth.email.email_message}
/// Email message to be sent.
/// {@endtemplate}
final class EmailMessage {
  /// {@macro celest_cloud_auth.email.email_message}
  const EmailMessage({
    required this.from,
    required this.to,
    required this.subject,
    required this.body,
    this.bcc,
    this.cc,
    this.replyTo,
    this.headers,
    this.scheduledAt,
  });

  /// Sender email address.
  ///
  /// To include a friendly name, use the format `Your Name <sender@domain.com>`.
  final String from;

  /// Recipient email address.
  ///
  /// A maximum of 50 recipients can be specified.
  final List<String> to;

  /// Email subject.
  final String subject;

  /// Bcc recipient email addresses.
  final List<String>? bcc;

  /// Cc recipient email addresses.
  final List<String>? cc;

  /// Reply-to email addresses.
  final List<String>? replyTo;

  /// The body of the message.
  ///
  /// Either [EmailBodyText] or [EmailBodyHtml] can be used.
  final EmailBody body;

  /// Custom headers to add to the email.
  final Map<String, String>? headers;

  /// Schedules the email to be sent at a later time.
  final DateTime? scheduledAt;

  @override
  String toString() {
    final buf = StringBuffer('Email(');
    buf.write('from: $from, ');
    buf.write('to: $to, ');
    buf.write('subject: $subject');
    if (bcc != null) {
      buf.write(', bcc: $bcc');
    }
    if (cc != null) {
      buf.write(', cc: $cc');
    }
    if (replyTo != null) {
      buf.write(', replyTo: $replyTo');
    }
    buf.write(')');
    if (scheduledAt case final scheduledAt?) {
      buf.write(' scheduledAt: $scheduledAt');
    }
    buf.writeln();
    if (headers case final headers?) {
      for (final entry in headers.entries) {
        buf.writeln('${entry.key}: ${entry.value}');
      }
    }
    buf.writeln(body);
    return buf.toString();
  }
}
