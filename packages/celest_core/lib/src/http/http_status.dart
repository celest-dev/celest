/// {@template celest.http.http_status}
/// An HTTP status code.
/// {@endtemplate}
extension type const HttpStatus._(int code) implements int {
  /// {@macro celest.http.http_status}
  const HttpStatus(this.code)
    : assert(code >= 100 && code <= 999, 'code must be in the range 100-999');

  /// `200 OK` The request succeeded.
  ///
  /// The result meaning of "success" depends on the HTTP method:
  ///
  /// - `GET`: The resource has been fetched and is transmitted in the message
  ///   body.
  /// - `HEAD`: The representation headers are included in the response without
  ///   any message body.
  /// - `PUT` or `POST`: The resource describing the result of the action is
  ///   transmitted in the message body.
  /// - `TRACE`: The message body contains the request message as received by
  ///   the server.
  static const ok = HttpStatus(200);

  /// `201 Created` The request succeeded, and a new resource was created as a
  /// result.
  ///
  /// This is typically the response sent after `POST` requests, or some `PUT`
  /// requests.
  static const created = HttpStatus(201);

  /// `202 Accepted` The request has been received but not yet acted upon.
  ///
  /// It is noncommittal, since there is no way in HTTP to later send an
  /// asynchronous response indicating the outcome of the request. It is
  /// intended for cases where another process or server handles the request,
  /// or for batch processing.
  static const accepted = HttpStatus(202);

  /// `203 Non-Authoritative Information` This response code means the returned metadata is not exactly the
  /// same as is available from the origin server, but is collected from a local
  /// or a third-party copy.
  ///
  /// This is mostly used for mirrors or backups of another resource. Except
  /// for that specific case, the `200` [ok] response is preferred to this
  /// status.
  static const nonAuthoritativeInformation = HttpStatus(203);

  /// `204 No Content` There is no content to send for this request, but the headers may be
  /// useful.
  ///
  /// The user agent may update its cached headers for this resource with the
  /// new ones.
  static const noContent = HttpStatus(204);

  /// `205 Reset Content` Tells the user agent to reset the document which sent
  /// this request.
  static const resetContent = HttpStatus(205);

  /// `206 Partial Content` This response code is used when the Range header is
  /// sent from the client to request only part of a resource.
  static const partialContent = HttpStatus(206);

  /// `400 Bad Request`
  ///
  /// The server cannot or will not process the request due to something that is
  /// perceived to be a client error (e.g., malformed request syntax, invalid
  /// request message framing, or deceptive request routing).
  static const badRequest = HttpStatus(400);

  /// `401 Unauthorized`
  ///
  /// Although the HTTP standard specifies "unauthorized", semantically this
  /// response means "unauthenticated". That is, the client must authenticate
  /// itself to get the requested response.
  static const unauthorized = HttpStatus(401);

  /// `403 Forbidden`
  ///
  /// The client does not have access rights to the content; that is, it is
  /// unauthorized, so the server is refusing to give the requested resource.
  /// Unlike `401` [unauthorized], the client's identity is known to the server.
  static const forbidden = HttpStatus(403);

  /// `404 Not Found`
  ///
  /// The server can not find the requested resource. In the browser, this means
  /// the URL is not recognized. In an API, this can also mean that the endpoint
  /// is valid but the resource itself does not exist. Servers may also send
  /// this response instead of `403` [forbidden] to hide the existence of a
  /// resource from an unauthorized client.
  static const notFound = HttpStatus(404);

  /// `405 Method Not Allowed`
  ///
  /// The request method is known by the server but is not supported by the
  /// target resource. For example, an API may not allow calling `DELETE` to
  /// remove a resource.
  static const methodNotAllowed = HttpStatus(405);

  /// `406 Not Acceptable`
  ///
  /// This response is sent when the web server, after performing server-driven
  /// content negotiation, doesn't find any content that conforms to the
  /// criteria given by the user agent.
  static const notAcceptable = HttpStatus(406);

  /// `408 Request Timeout`
  ///
  /// This response is sent on an idle connection by some servers, even without
  /// any previous request by the client. It means that the server would like
  /// to shut down this unused connection. This response is used much more since
  /// some browsers, like Chrome, Firefox 27+, or IE9, use HTTP pre-connection
  /// mechanisms to speed up surfing. Also note that some servers merely shut
  /// down the connection without sending this message.
  static const requestTimeout = HttpStatus(408);

  /// `409 Conflict`
  ///
  /// This response is sent when a request conflicts with the current state of
  /// the server.
  static const conflict = HttpStatus(409);

  /// `410 Gone`
  ///
  /// This response is sent when the requested content has been permanently
  /// deleted from the server, with no forwarding address. Clients are expected
  /// to remove their caches and links to the resource. The HTTP specification
  /// intends this status code to be used for "limited-time, promotional
  /// services". APIs should not feel compelled to indicate resources that have
  /// been deleted with this status code.
  static const gone = HttpStatus(410);

  /// `411 Length Required`
  ///
  /// Server rejected the request because the Content-Length header field is
  /// not defined and the server requires it.
  static const lengthRequired = HttpStatus(411);

  /// `412 Precondition Failed`
  ///
  /// The client has indicated preconditions in its headers which the server
  /// does not meet.
  static const preconditionFailed = HttpStatus(412);

  /// `413 Payload Too Large`
  ///
  /// Request entity is larger than limits defined by server; the server might
  /// close the connection or return a `Retry-After` header field.
  static const payloadTooLarge = HttpStatus(413);

  /// `414 URI Too Long`
  ///
  /// The URI requested by the client is longer than the server is willing to
  /// interpret.
  static const uriTooLong = HttpStatus(414);

  /// `415 Unsupported Media Type`
  ///
  /// The media format of the requested data is not supported by the server, so
  /// the server is rejecting the request.
  static const unsupportedMediaType = HttpStatus(415);

  /// `416 Range Not Satisfiable`
  ///
  /// The range specified by the `Range` header field in the request can't be
  /// fulfilled; it's possible that the range is outside the size of the target
  /// URI's data.
  static const requestedRangeNotSatisfiable = HttpStatus(416);

  /// `429 Too Many Requests`
  ///
  /// The user has sent too many requests in a given amount of time ("rate
  /// limiting").
  static const tooManyRequests = HttpStatus(429);

  /// `499 Client Closed Request`
  ///
  /// A non-standard status code for the case when a client closes the
  /// connection while the server is processing the request.
  static const clientClosedRequest = HttpStatus(499);

  /// `500 Internal Server Error`
  ///
  /// The server has encountered a situation it doesn't know how to handle.
  static const internalServerError = HttpStatus(500);

  /// `501 Not Implemented`
  ///
  /// The request method is not supported by the server and cannot be handled.
  /// The only methods that servers are required to support (and therefore that
  /// must not return this code) are `GET` and `HEAD`.
  static const notImplemented = HttpStatus(501);

  /// `502 Bad Gateway`
  ///
  /// This error response means that the server, while working as a gateway to
  /// get a response needed to handle the request, got an invalid response.
  static const badGateway = HttpStatus(502);

  /// `503 Service Unavailable`
  ///
  /// The server is not ready to handle the request. Common causes are a server
  /// that is down for maintenance or that is overloaded. Note that together
  /// with this response, a user-friendly page explaining the problem should be
  /// sent. This responses should be used for temporary conditions and the
  /// `Retry-After` HTTP header should, if possible, contain the estimated time
  /// before the recovery of the service.
  static const serviceUnavailable = HttpStatus(503);

  /// `504 Gateway Timeout`
  ///
  /// This error response is given when the server is acting as a gateway and
  /// cannot get a response in time.
  static const gatewayTimeout = HttpStatus(504);
}
