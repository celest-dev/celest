import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_ast/src/proto/celest/ast/v1/resolved_ast.pb.dart' as pb;
import 'package:drift/drift.dart';

final class ResolvedProjectConverter
    implements TypeConverter<ast.ResolvedProject, Uint8List> {
  const ResolvedProjectConverter();

  @override
  ast.ResolvedProject fromSql(Uint8List fromDb) {
    return ast.ResolvedProject.fromProto(
      pb.ResolvedProject()..mergeFromBuffer(fromDb),
    );
  }

  @override
  Uint8List toSql(ast.ResolvedProject value) {
    return value.toProto().writeToBuffer();
  }
}

final class ResolvedApiConverter
    implements TypeConverter<ast.ResolvedApi, Uint8List> {
  const ResolvedApiConverter();

  @override
  ast.ResolvedApi fromSql(Uint8List fromDb) {
    return ast.ResolvedApi.fromProto(pb.ResolvedApi()..mergeFromBuffer(fromDb));
  }

  @override
  Uint8List toSql(ast.ResolvedApi value) {
    return value.toProto().writeToBuffer();
  }
}

final class ResolvedFunctionConverter
    implements TypeConverter<ast.ResolvedCloudFunction, Uint8List> {
  const ResolvedFunctionConverter();

  @override
  ast.ResolvedCloudFunction fromSql(Uint8List fromDb) {
    return ast.ResolvedCloudFunction.fromProto(
      pb.ResolvedFunction()..mergeFromBuffer(fromDb),
    );
  }

  @override
  Uint8List toSql(ast.ResolvedCloudFunction value) {
    return value.toProto().writeToBuffer();
  }
}
