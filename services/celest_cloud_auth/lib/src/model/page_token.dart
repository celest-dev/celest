import 'dart:convert';

import 'package:celest_cloud/src/proto.dart';
import 'package:celest_cloud/src/proto/celest/cloud/v1alpha1/common.pb.dart'
    as pb;
import 'package:fixnum/fixnum.dart';

extension type const PageToken._(pb.PageToken _pb) {
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

  factory PageToken.parse(String token) {
    if (token.isEmpty) {
      return PageToken._(pb.PageToken());
    }
    final decoded = base64Decode(token);
    final pbToken = pb.PageToken.fromBuffer(decoded);
    return PageToken._(pbToken);
  }

  int get offset => _pb.offset.toInt();
  DateTime? get startTime =>
      _pb.hasStartTime() ? _pb.startTime.toDateTime() : null;
  bool get showDeleted => _pb.showDeleted;

  String encode() => base64Encode(_pb.writeToBuffer());
}
