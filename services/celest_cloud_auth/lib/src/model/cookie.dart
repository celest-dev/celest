import 'package:celest_cloud_auth/src/context.dart';
import 'package:petitparser/petitparser.dart';

/// Parses a cookie header into a map of name/value pairs.
Map<String, String> parseCookies(Map<String, List<String>> headers) {
  final cookieHeader = headers['cookie'];
  if (cookieHeader == null || cookieHeader.isEmpty) {
    return const {};
  }

  final cookies = <String, String>{};
  for (final line in cookieHeader) {
    if (line.isEmpty) {
      continue;
    }

    // Parse each cookie individually so that we can handle parser errors more
    // gracefully.
    final cookiePairs = line.trim().split(';');
    for (var cookiePair in cookiePairs) {
      cookiePair = cookiePair.trim();
      if (cookiePair.isEmpty) {
        continue;
      }
      switch (_cookieParser.parse(cookiePair)) {
        case Success(value: (final name, final value)):
          cookies[name] = value;
        case final Failure failure:
          context.logger.warning(
            'Failed to parse cookie: ${failure.message}',
            FormatException(failure.message, cookiePair, failure.position),
          );
      }
    }
  }

  return Map.unmodifiable(cookies);
}

// Follows the cookie grammar as defined in RFC 6265
// https://datatracker.ietf.org/doc/html/rfc6265#section-4.1.1
final Parser<(String, String)> _cookieParser = () {
  // token             = <token, defined in [RFC2616], Section 2.2>
  // https://datatracker.ietf.org/doc/html/rfc2616#section-2.2
  final asciiNoSeparators = pattern('^()<>@,;:\\"/[]?={} \t');
  final token = asciiNoSeparators.plus().flatten();

  // cookie-name       = token
  final cookieName = token;

  // cookie-octet      = %x21 / %x23-2B / %x2D-3A / %x3C-5B / %x5D-7E
  final cookieOctet = pattern('\x21\x23-\x2B\x2D-\x3A\x3C-\x5B\x5D-\x7E');

  // cookie-value      = *cookie-octet / ( DQUOTE *cookie-octet DQUOTE )
  final dquote = char('"').optional();
  final cookieValue =
      cookieOctet.star().flatten().skip(before: dquote, after: dquote);

  // cookie-pair       = cookie-name "=" cookie-value
  final cookiePair = seq2(cookieName, cookieValue.skip(before: char('=')));

  // cookie-header = "Cookie:" OWS cookie-string OWS
  return cookiePair.trim().end();
}();
