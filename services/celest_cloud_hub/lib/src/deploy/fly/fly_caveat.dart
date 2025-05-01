sealed class FlyCaveat {
  const FlyCaveat();

  static List<FlyCaveat> readApp(int appId) {
    return [
      FlyAppsCaveat({appId: FlyPermission.read}),
    ];
  }

  String get type;
  Map<String, Object?> get body;

  Map<String, Object?> toJson() {
    return {'type': type, 'body': body};
  }
}

extension type const FlyPermission(String perm) implements String {
  static const FlyPermission read = FlyPermission('r');
  static const FlyPermission write = FlyPermission('w');
  static const FlyPermission create = FlyPermission('c');
  static const FlyPermission delete = FlyPermission('d');
  static const FlyPermission control = FlyPermission('C');

  static final FlyPermission all = read | write | create | delete | control;

  FlyPermission operator |(FlyPermission other) {
    return FlyPermission('$this$other');
  }
}

final class FlyAppsCaveat extends FlyCaveat {
  const FlyAppsCaveat(this.apps);

  final Map<int, FlyPermission> apps;

  @override
  String get type => 'Apps';

  @override
  Map<String, Object?> get body => {
    'apps': apps.map((appId, body) => MapEntry(appId.toString(), body)),
  };
}

final class FlyIfPresentCaveat extends FlyCaveat {
  const FlyIfPresentCaveat({required this.ifs, required this.else_});

  final List<FlyCaveat> ifs;
  final FlyPermission else_;

  @override
  String get type => 'IfPresent';

  @override
  Map<String, Object?> get body => {
    'ifs': ifs.map((c) => c.toJson()).toList(),
    'else': else_,
  };
}
