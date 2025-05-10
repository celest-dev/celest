abstract base class Analytics {
  const Analytics();

  void capture(String eventName, {Map<String, Object?> properties = const {}});

  void identifyUser({
    String? distinctId,
    Map<String, Object?>? set,
    Map<String, Object?>? setOnce,
  });
}
