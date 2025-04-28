import 'dart:convert';

import 'package:celest_cloud/src/proto.dart';
import 'package:celest_cloud/src/proto/celest/cloud/v1alpha1/common.pb.dart'
    as pb;
import 'package:fixnum/fixnum.dart';

/// {@template celest_cloud_core.page_token}
/// A token used for pagination in Celest Cloud.
///
/// This token is used to keep track of the current position in a paginated
/// result set.
/// {@endtemplate}
extension type const PageToken._(pb.PageToken _pb) {
  /// {@macro celest_cloud_core.page_token}
  factory PageToken({
    int offset = 0,
    DateTime? startTime,
    bool? showDeleted,
  }) {
    return PageToken._(
      pb.PageToken(
        offset: Int64(offset),
        startTime: startTime?.toProto(),
        showDeleted: showDeleted,
      ),
    );
  }

  /// Parses a [PageToken] from a string input.
  factory PageToken.parse(String token) {
    if (token.isEmpty) {
      return PageToken();
    }
    final decoded = base64Decode(token);
    final pbToken = pb.PageToken.fromBuffer(decoded);
    return PageToken._(pbToken);
  }

  /// The offset for the pagination.
  int get offset => _pb.offset.toInt();

  /// The start time for the pagination.
  ///
  /// This represents when the query was first started and is used to ensure
  /// consistent results across multiple queries.
  DateTime? get startTime =>
      _pb.hasStartTime() ? _pb.startTime.toDateTime() : null;

  /// Whether to show deleted resources in the results.
  bool get showDeleted => _pb.showDeleted;

  /// Encodes the [PageToken] to an output string.
  String encode() => base64Encode(_pb.writeToBuffer());
}
