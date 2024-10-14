@internal
library;

import 'package:celest/src/core/context.dart';
import 'package:celest_core/_internal.dart';
import 'package:google_cloud/google_cloud.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

/// The context key for the active GCP project ID.
const ContextKey<String> googleCloudProjectKey = ContextKey();

/// Returns the GCP project ID for the active environment or
/// `null` if running locally.
Future<String?> googleCloudProject() async {
  try {
    return await computeProjectId();
  } on Object catch (e, st) {
    if (kReleaseMode) {
      Logger.root.warning('Failed to get GCP project ID', e, st);
    }
    return null;
  }
}
