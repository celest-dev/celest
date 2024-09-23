@internal
library;

import 'package:celest/celest.dart';
import 'package:google_cloud/google_cloud.dart';
import 'package:meta/meta.dart';

/// The context key for the active GCP project ID.
const ContextKey<String> googleCloudProjectKey = ContextKey();

/// Returns the GCP project ID for the active environment or
/// `null` if running locally.
Future<String?> googleCloudProject() async {
  try {
    return await computeProjectId();
  } on Exception {
    return null;
  }
}
