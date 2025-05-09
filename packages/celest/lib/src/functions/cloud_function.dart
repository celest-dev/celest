import 'package:celest/src/functions/cloud_api.dart';

/// {@template celest.functions.cloud_function}
/// A serverless Dart function which is deployed to the cloud.
///
/// Cloud Functions are defined as top-level Dart functions in the `functions/`
/// directory of your Celest project.
/// {@endtemplate}
final class CloudFunction {
  /// {@macro celest.functions.cloud_function}
  const CloudFunction({required this.api, required this.function});

  /// The name of the [CloudApi] to which this function belongs.
  final String api;

  /// The name of the function.
  ///
  /// This is the name of the Dart function to which this [CloudFunction]
  /// points. The name is used as part of the functions' URLs when deployed and
  /// in the generated client library.
  final String function;
}
