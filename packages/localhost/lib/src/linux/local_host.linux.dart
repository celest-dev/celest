import 'package:dbus/dbus.dart';
import 'package:localhost/src/local_host.dart';

final class LocalHostLinux extends LocalHost {
  LocalHostLinux({
    required super.projectName,
    required super.localPort,
  }) : super.base();

  static const _dbusInterfaceName = 'org.freedesktop.Avahi';

  static final _dbusClient = DBusClient.system();
  final _avahiClient = DBusRemoteObject(
    _dbusClient,
    name: _dbusInterfaceName,
    path: DBusObjectPath('/'),
  );

  var _started = false;
  OrgFreedesktopAvahiEntryGroup? _entryGroup;

  @override
  Future<void> start() async {
    final entryGroupRes = await _avahiClient.callMethod(
      'org.freedesktop.Avahi.Server2',
      'EntryGroupNew',
      [],
      replySignature: DBusSignature('o'),
    );
    final entryGroupPath = entryGroupRes.returnValues[0].asObjectPath();
    _entryGroup = OrgFreedesktopAvahiEntryGroup(
      _dbusClient,
      name: _dbusInterfaceName,
      path: entryGroupPath,
    );
    await _entryGroup!.addService(
      name: 'celest',
      type: '_celest._tcp',
      domain: 'local',
      host: 'celest.local',
      port: 8080,
    );
    _started = true;
  }

  @override
  Future<void> stop() async {
    if (!_started) return;
    _started = false;
    assert(_entryGroup != null, 'Should be set if started');
    try {
      await _entryGroup!.release();
    } finally {
      _entryGroup = null;
    }
  }
}

class OrgFreedesktopAvahiEntryGroup extends DBusRemoteObject {
  OrgFreedesktopAvahiEntryGroup(
    super.client, {
    required super.name,
    required super.path,
  });

  /// Invokes org.freedesktop.Avahi.EntryGroup.AddService()
  Future<void> addService({
    int interface = -1,
    int protocol = -1,
    int flags = 0,
    required String name,
    required String type,
    required String domain,
    required String host,
    required int port,
    List<List<int>> txt = const [],
  }) async {
    await callMethod(
      'org.freedesktop.Avahi.EntryGroup',
      'AddService',
      [
        DBusInt32(interface),
        DBusInt32(protocol),
        DBusUint32(flags),
        DBusString(name),
        DBusString(type),
        DBusString(domain),
        DBusString(host),
        DBusUint16(port),
        DBusArray(
          DBusSignature('ay'),
          txt.map(DBusArray.byte),
        ),
      ],
      replySignature: DBusSignature(''),
    );
  }

  Future<void> release() async {
    await callMethod(
      'org.freedesktop.Avahi.EntryGroup',
      'Free',
      [],
      replySignature: DBusSignature(''),
    );
  }
}
