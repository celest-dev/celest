/// Supported HTTP methods in Celest.
extension type const HttpMethod._(String method) implements String {
  /// `GET`
  static const get = HttpMethod._('GET');

  /// `POST`
  static const post = HttpMethod._('POST');

  /// `PUT`
  static const put = HttpMethod._('PUT');

  /// `DELETE`
  static const delete = HttpMethod._('DELETE');

  /// `PATCH`
  static const patch = HttpMethod._('PATCH');
}
