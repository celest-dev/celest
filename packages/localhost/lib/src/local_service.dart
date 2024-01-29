final class LocalServiceId {
  const LocalServiceId({
    required this.name,
    required this.type,
    required this.domain,
  });

  /// The name of the service.
  final String name;

  /// The type of the service.
  final String type;

  /// The domain on which the service is registered.
  final String domain;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalServiceId &&
          name == other.name &&
          type == other.type &&
          domain == other.domain;

  @override
  int get hashCode => Object.hash(name, type, domain);

  @override
  String toString() => '$name.$type.$domain';
}

final class LocalService {
  const LocalService({
    required this.name,
    required this.type,
    required this.domain,
    required this.host,
    required this.port,
  });

  /// The unique identifier of this service on the network.
  LocalServiceId get id => LocalServiceId(
        name: name,
        type: type,
        domain: domain,
      );

  /// The name of the service.
  final String name;

  /// The type of the service.
  final String type;

  /// The domain on which the service is registered.
  final String domain;

  /// The fully qualified domain name of the host on which the service is
  /// running.
  final String host;

  /// The port on which the service is running on [host].
  final int port;

  @override
  String toString() {
    final buffer = StringBuffer()
      ..writeln('LocalService(')
      ..writeln('  name=$name,')
      ..writeln('  type=$type,')
      ..writeln('  domain=$domain,')
      ..writeln('  host=$host,')
      ..writeln('  port=$port,')
      ..write(')');
    return buffer.toString();
  }
}
