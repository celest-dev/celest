// By convention, any custom exception types thrown by an API must be defined
// in this file or exported from this file.
class ServerException implements Exception {
  const ServerException(this.message);

  final String message;
}