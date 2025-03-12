// Repro of https://github.com/celest-dev/celest/issues/53
typedef Json = Map<String, dynamic>;

class Portfolio {
  factory Portfolio.fromJson(Json? json) {
    return const Portfolio._();
  }

  const Portfolio._();

  Map<String, dynamic> toJson() => {};
}
