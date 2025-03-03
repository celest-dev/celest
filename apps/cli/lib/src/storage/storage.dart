import 'package:native_storage/native_storage.dart' as core;
import 'package:uuid/uuid.dart';

extension type Storage._(core.NativeStorage _impl)
    implements core.NativeStorage {
  factory Storage() {
    return Storage._(core.NativeStorage(namespace: cliNamespace));
  }

  Storage.memory() : this._(core.NativeMemoryStorage(namespace: cliNamespace));

  /// This will not be included in the generated binary, so we must provide it.
  static const String cliNamespace = 'dev.celest.cli';
}

extension CelestStorage on core.NativeStorage {
  Future<({String distinctId, String deviceId})> init() async {
    final storage = isolated;
    var (distinctId, deviceId) = await (
      storage.read('distinctId'),
      storage.read('deviceId'),
    ).wait;
    if (deviceId == null) {
      deviceId = const Uuid().v7();
      await storage.write('deviceId', deviceId);
    }
    if (distinctId == null) {
      distinctId = deviceId;
      await storage.write('distinctId', deviceId);
    }
    return (distinctId: distinctId, deviceId: deviceId);
  }

  Future<String> readDeviceId() async => (await init()).deviceId;
  Future<String> readDistinctId() async => (await init()).distinctId;
  Future<void> writeDistinctId(String distinctId) async {
    await isolated.write('distinctId', distinctId);
  }
}
