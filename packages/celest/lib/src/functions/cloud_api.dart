import 'package:celest/src/functions/cloud_function.dart';

/// {@template celest.functions.cloud_api}
/// A grouping of [CloudFunction]s under a common [name].
///
/// Cloud APIs serve as a namespace for multiple Cloud Functions. They can be
/// used to group related functionality and provide separation from other
/// functions in your backend.
/// {@endtemplate}
final class CloudApi {
  /// {@macro celest.function.cloud_api}
  const CloudApi({required this.name});

  /// The name of the API.
  ///
  /// This is the file name which contains the [CloudFunction]s of this API.
  /// The name is used as part of the functions' URLs when deployed and in the
  /// generated client library.
  final String name;
}
