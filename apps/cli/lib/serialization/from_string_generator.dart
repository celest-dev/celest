import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:code_builder/code_builder.dart';

Expression _fromString(
  Reference type,
  Expression ref,
) {
  final dartType = typeHelper.fromReference(type);
  if (dartType.isDartCoreBool) {
    return DartTypes.core.bool.property('parse').call([ref]);
  }
  if (dartType.isDartCoreDouble) {
    return DartTypes.core.double.property('parse').call([ref]);
  }
  if (dartType.isDartCoreInt) {
    return DartTypes.core.int.property('parse').call([ref]);
  }
  if (dartType.isDartCoreNum) {
    return DartTypes.core.num.property('parse').call([ref]);
  }
  if (dartType.isDartCoreString) {
    return ref;
  }
  if (dartType.isDartCoreObject) {
    return ref;
  }
  if (type.symbol == 'Uri') {
    return DartTypes.core.uri.property('parse').call([ref]);
  }
  if (type.symbol == 'DateTime') {
    return DartTypes.core.dateTime.property('parse').call([ref]);
  }
  unreachable('Unsupported type: $type');
}

Expression fromString(
  Reference type,
  Expression ref, {
  Expression? defaultValue,
}) {
  var fromString = _fromString(type, ref);
  if (defaultValue != null) {
    fromString = fromString.parenthesized.ifNullThen(defaultValue);
  }
  return fromString;
}
