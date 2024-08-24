/// GRPC interfaces for Celest API.
library;

/// Celest
export 'proto/celest/cloud/auth/v1alpha1/authentication.pbgrpc.dart';
export 'proto/celest/cloud/auth/v1alpha1/users.pbgrpc.dart';
export 'proto/celest/cloud/v1alpha1/deployments.pbgrpc.dart';
export 'proto/celest/cloud/v1alpha1/environments.pbgrpc.dart';
export 'proto/celest/cloud/v1alpha1/functions.pbgrpc.dart';
export 'proto/celest/cloud/v1alpha1/organizations.pbgrpc.dart';
export 'proto/celest/cloud/v1alpha1/projects.pbgrpc.dart';

/// GCP
export 'proto/google/logging/v2/logging.pbgrpc.dart';
export 'proto/google/longrunning/operations.pbgrpc.dart';

/// Helpers
export 'proto/operations.dart';
