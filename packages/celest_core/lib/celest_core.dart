/// Celest code shared between the client and the cloud.
library;

/// Auth
export 'src/auth/auth_client.dart';
export 'src/auth/auth_exception.dart';
export 'src/auth/auth_protocol.dart';
export 'src/auth/otp/otp_types.dart';
export 'src/auth/passkeys/passkey_exception.dart';
export 'src/auth/passkeys/passkey_types.dart';
export 'src/auth/user.dart';

/// Exceptions
export 'src/exception/celest_exception.dart';
export 'src/exception/cloud_exception.dart';
export 'src/exception/serialization_exception.dart';

/// Serialization
export 'src/serialization/json_value.dart';
export 'src/serialization/serializer.dart';
