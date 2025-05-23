/// {@template celest.http.http_status}
/// An HTTP status code.
/// {@endtemplate}
extension type const HttpStatus._(int code) implements int {
  /// {@macro celest.http.http_status}
  const HttpStatus(this.code)
    : assert(code >= 100 && code <= 999, 'code must be in the range 100-999');

  /// `200 OK`
  ///
  /// The request succeeded.
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
  static const HttpStatus ok = HttpStatus(200);

  /// `201 Created`
  ///
  /// The request succeeded, and a new resource was created as a
  /// result.
  ///
  /// This is typically the response sent after `POST` requests, or some `PUT`
  /// requests.
  static const HttpStatus created = HttpStatus(201);

  /// `202 Accepted`
  ///
  /// The request has been received but not yet acted upon.
  ///
  /// It is noncommittal, since there is no way in HTTP to later send an
  /// asynchronous response indicating the outcome of the request. It is
  /// intended for cases where another process or server handles the request,
  /// or for batch processing.
  static const HttpStatus accepted = HttpStatus(202);

  /// `203 Non-Authoritative Information`
  ///
  /// This response code means the returned metadata is not exactly the same as
  /// is available from the origin server, but is collected from a local or a
  /// third-party copy.
  ///
  /// This is mostly used for mirrors or backups of another resource. Except
  /// for that specific case, the `200` [ok] response is preferred to this
  /// status.
  static const HttpStatus nonAuthoritativeInformation = HttpStatus(203);

  /// `204 No Content`
  ///
  /// There is no content to send for this request, but the headers may be
  /// useful.
  ///
  /// The user agent may update its cached headers for this resource with the
  /// new ones.
  static const HttpStatus noContent = HttpStatus(204);

  /// `205 Reset Content`
  ///
  /// Tells the user agent to reset the document which sent this request.
  static const HttpStatus resetContent = HttpStatus(205);

  /// `206 Partial Content`
  ///
  /// This response code is used when the `Range` header is sent from the client
  /// to request only part of a resource.
  static const HttpStatus partialContent = HttpStatus(206);

  /// `300 Multiple Choices`
  ///
  /// The request has more than one possible response. The user-agent or user
  /// should choose one of them. There is no standardized way to choose one of
  /// the responses.
  static const HttpStatus multipleChoices = HttpStatus(300);

  /// `301 Moved Permanently`
  ///
  /// This response code means that the URI of the requested resource has been
  /// changed permanently. The new URL is given in the response.
  static const HttpStatus movedPermanently = HttpStatus(301);

  /// `302 Found`
  ///
  /// This response code means that the URI of requested resource has been
  /// changed _temporarily_. Further changes in the URI might be made in the
  /// future. Therefore, this same URI should be used by the client in future
  /// requests.
  static const HttpStatus found = HttpStatus(302);

  /// `303 See Other`
  ///
  /// The server sent this response to direct the client to get the requested
  /// resource at another URI with a `GET` request.
  static const HttpStatus seeOther = HttpStatus(303);

  /// `304 Not Modified`
  ///
  /// This is used for caching purposes. It tells the client that the response
  /// has not been modified, so the client can continue to use the same cached
  /// version of the response.
  static const HttpStatus notModified = HttpStatus(304);

  /// `307 Temporary Redirect`
  ///
  /// The server sends this response to direct the client to get the requested
  /// resource at another URI with the same method that was used in the prior
  /// request.
  ///
  /// This has the same semantics as the `302` [found] HTTP response code, with
  /// the exception that the user agent must not change the HTTP method used:
  /// If a `POST` was used in the first request, a `POST` must be used in the
  /// second request.
  static const HttpStatus temporaryRedirect = HttpStatus(307);

  /// `308 Permanent Redirect`
  ///
  /// This means that the resource is now permanently located at another URI,
  /// specified by the `Location` headers.
  ///
  /// This has the same semantics as the `301` [movedPermanently] HTTP response
  /// code, with the exception that the user agent must not change the HTTP
  /// method used: If a `POST` was used in the first request, a `POST` must be
  /// used in the second request.
  static const HttpStatus permanentRedirect = HttpStatus(308);

  /// `400 Bad Request`
  ///
  /// The server cannot or will not process the request due to something that is
  /// perceived to be a client error (e.g., malformed request syntax, invalid
  /// request message framing, or deceptive request routing).
  static const HttpStatus badRequest = HttpStatus(400);

  /// `401 Unauthorized`
  ///
  /// Although the HTTP standard specifies "unauthorized", semantically this
  /// response means "unauthenticated". That is, the client must authenticate
  /// itself to get the requested response.
  static const HttpStatus unauthorized = HttpStatus(401);

  /// `403 Forbidden`
  ///
  /// The client does not have access rights to the content; that is, it is
  /// unauthorized, so the server is refusing to give the requested resource.
  /// Unlike `401` [unauthorized], the client's identity is known to the server.
  static const HttpStatus forbidden = HttpStatus(403);

  /// `404 Not Found`
  ///
  /// The server can not find the requested resource. In the browser, this means
  /// the URL is not recognized. In an API, this can also mean that the endpoint
  /// is valid but the resource itself does not exist. Servers may also send
  /// this response instead of `403` [forbidden] to hide the existence of a
  /// resource from an unauthorized client.
  static const HttpStatus notFound = HttpStatus(404);

  /// `405 Method Not Allowed`
  ///
  /// The request method is known by the server but is not supported by the
  /// target resource. For example, an API may not allow calling `DELETE` to
  /// remove a resource.
  static const HttpStatus methodNotAllowed = HttpStatus(405);

  /// `406 Not Acceptable`
  ///
  /// This response is sent when the web server, after performing server-driven
  /// content negotiation, doesn't find any content that conforms to the
  /// criteria given by the user agent.
  static const HttpStatus notAcceptable = HttpStatus(406);

  /// `408 Request Timeout`
  ///
  /// This response is sent on an idle connection by some servers, even without
  /// any previous request by the client. It means that the server would like
  /// to shut down this unused connection. This response is used much more since
  /// some browsers, like Chrome, Firefox 27+, or IE9, use HTTP pre-connection
  /// mechanisms to speed up surfing. Also note that some servers merely shut
  /// down the connection without sending this message.
  static const HttpStatus requestTimeout = HttpStatus(408);

  /// `409 Conflict`
  ///
  /// This response is sent when a request conflicts with the current state of
  /// the server.
  static const HttpStatus conflict = HttpStatus(409);

  /// `410 Gone`
  ///
  /// This response is sent when the requested content has been permanently
  /// deleted from the server, with no forwarding address. Clients are expected
  /// to remove their caches and links to the resource. The HTTP specification
  /// intends this status code to be used for "limited-time, promotional
  /// services". APIs should not feel compelled to indicate resources that have
  /// been deleted with this status code.
  static const HttpStatus gone = HttpStatus(410);

  /// `411 Length Required`
  ///
  /// Server rejected the request because the Content-Length header field is
  /// not defined and the server requires it.
  static const HttpStatus lengthRequired = HttpStatus(411);

  /// `412 Precondition Failed`
  ///
  /// The client has indicated preconditions in its headers which the server
  /// does not meet.
  static const HttpStatus preconditionFailed = HttpStatus(412);

  /// `413 Payload Too Large`
  ///
  /// Request entity is larger than limits defined by server; the server might
  /// close the connection or return a `Retry-After` header field.
  static const HttpStatus payloadTooLarge = HttpStatus(413);

  /// `414 URI Too Long`
  ///
  /// The URI requested by the client is longer than the server is willing to
  /// interpret.
  static const HttpStatus uriTooLong = HttpStatus(414);

  /// `415 Unsupported Media Type`
  ///
  /// The media format of the requested data is not supported by the server, so
  /// the server is rejecting the request.
  static const HttpStatus unsupportedMediaType = HttpStatus(415);

  /// `416 Range Not Satisfiable`
  ///
  /// The range specified by the `Range` header field in the request can't be
  /// fulfilled; it's possible that the range is outside the size of the target
  /// URI's data.
  static const HttpStatus rangeNotSatisfiable = HttpStatus(416);

  /// `429 Too Many Requests`
  ///
  /// The user has sent too many requests in a given amount of time ("rate
  /// limiting").
  static const HttpStatus tooManyRequests = HttpStatus(429);

  /// `500 Internal Server Error`
  ///
  /// The server has encountered a situation it doesn't know how to handle.
  static const HttpStatus internalServerError = HttpStatus(500);

  /// `501 Not Implemented`
  ///
  /// The request method is not supported by the server and cannot be handled.
  /// The only methods that servers are required to support (and therefore that
  /// must not return this code) are `GET` and `HEAD`.
  static const HttpStatus notImplemented = HttpStatus(501);

  /// `502 Bad Gateway`
  ///
  /// This error response means that the server, while working as a gateway to
  /// get a response needed to handle the request, got an invalid response.
  static const HttpStatus badGateway = HttpStatus(502);

  /// `503 Service Unavailable`
  ///
  /// The server is not ready to handle the request. Common causes are a server
  /// that is down for maintenance or that is overloaded. Note that together
  /// with this response, a user-friendly page explaining the problem should be
  /// sent. This responses should be used for temporary conditions and the
  /// `Retry-After` HTTP header should, if possible, contain the estimated time
  /// before the recovery of the service.
  static const HttpStatus serviceUnavailable = HttpStatus(503);

  /// `504 Gateway Timeout`
  ///
  /// This error response is given when the server is acting as a gateway and
  /// cannot get a response in time.
  static const HttpStatus gatewayTimeout = HttpStatus(504);
}
