/// The type of an external auth provider.
enum AuthProviderType {
  /// Firebase Auth
  firebase,

  /// Supabase Auth
  supabase;

  /// A human-readable display name for the provider.
  String get displayName => switch (this) {
    firebase => 'Firebase',
    supabase => 'Supabase',
  };
}
