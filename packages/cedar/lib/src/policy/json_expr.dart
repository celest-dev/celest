/// Dart representation of the JSON expression language used in Cedar
/// policies.
///
/// See: https://docs.cedarpolicy.com/policies/json-format.html#JsonExpr-objects
library;

import 'dart:convert';

import 'package:cedar/src/ast/cedar_entity_id.dart';
import 'package:cedar/src/policy/cedar_policy.dart';
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

sealed class JsonExprOp {
  factory JsonExprOp.fromJson(String json) => switch (json) {
        'Value' => JsonExprOpCode.value,
        'Var' => JsonExprOpCode.variable,
        'Slot' => JsonExprOpCode.slot,
        'Unknown' => JsonExprOpCode.unknown,
        '!' => JsonExprOpCode.not,
        'neg' => JsonExprOpCode.neg,
        '==' => JsonExprOpCode.equals,
        '!=' => JsonExprOpCode.notEquals,
        'in' => JsonExprOpCode.in$,
        '<' => JsonExprOpCode.lessThan,
        '<=' => JsonExprOpCode.lessThanOrEquals,
        '>' => JsonExprOpCode.greaterThan,
        '>=' => JsonExprOpCode.greaterThanOrEquals,
        '&&' => JsonExprOpCode.and,
        '||' => JsonExprOpCode.or,
        '+' => JsonExprOpCode.plus,
        '-' => JsonExprOpCode.minus,
        '*' => JsonExprOpCode.times,
        'contains' => JsonExprOpCode.contains,
        'containsAll' => JsonExprOpCode.containsAll,
        'containsAny' => JsonExprOpCode.containsAny,
        '.' => JsonExprOpCode.getAttribute,
        'has' => JsonExprOpCode.hasAttribute,
        'like' => JsonExprOpCode.like,
        'is' => JsonExprOpCode.is$,
        'if-then-else' => JsonExprOpCode.ifThenElse,
        'Set' => JsonExprOpCode.set,
        'Record' => JsonExprOpCode.record,
        _ => JsonExprOpFunc(json),
      };

  String toJson();
}

final class JsonExprOpFunc implements JsonExprOp {
  const JsonExprOpFunc(this.name);

  final String name;

  @override
  String toJson() => name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is JsonExprOpFunc && name == other.name;

  @override
  int get hashCode => name.hashCode;
}

enum JsonExprOpCode implements JsonExprOp {
  value,
  variable,
  slot,
  unknown,
  not,
  neg,
  equals,
  notEquals,
  in$,
  lessThan,
  lessThanOrEquals,
  greaterThan,
  greaterThanOrEquals,
  and,
  or,
  plus,
  minus,
  times,
  contains,
  containsAll,
  containsAny,
  getAttribute,
  hasAttribute,
  like,
  is$,
  ifThenElse,
  set,
  record;

  @override
  String toJson() => switch (this) {
        value => 'Value',
        variable => 'Var',
        slot => 'Slot',
        unknown => 'Unknown',
        not => '!',
        neg => 'neg',
        equals => '==',
        notEquals => '!=',
        in$ => 'in',
        lessThan => '<',
        lessThanOrEquals => '<=',
        greaterThan => '>',
        greaterThanOrEquals => '>=',
        and => '&&',
        or => '||',
        plus => '+',
        minus => '-',
        times => '*',
        contains => 'contains',
        containsAll => 'containsAll',
        containsAny => 'containsAny',
        getAttribute => '.',
        hasAttribute => 'has',
        like => 'like',
        is$ => 'is',
        ifThenElse => 'if-then-else',
        set => 'Set',
        record => 'Record',
      };
}

sealed class JsonExpr {
  const JsonExpr();

  factory JsonExpr.fromJson(Map<String, Object?> json) {
    if (json.keys.length != 1) {
      throw FormatException('Expected exactly one key in JSON expression');
    }
    final MapEntry(:key, :value) = json.entries.first;
    final op = JsonExprOp.fromJson(key);
    return switch (op) {
      JsonExprOpCode.value => JsonExprValue.fromJson(value),
      JsonExprOpCode.variable => JsonExprVariable.fromJson(value as String),
      JsonExprOpCode.slot => JsonExprSlot.fromJson(value as String),
      JsonExprOpCode.unknown =>
        JsonExprUnknown.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.not => JsonExprNot.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.neg => JsonExprNeg.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.equals =>
        JsonExprEquals.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.notEquals =>
        JsonExprNotEquals.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.in$ => JsonExprIn.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.lessThan =>
        JsonExprLessThan.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.lessThanOrEquals =>
        JsonExprLessThanOrEquals.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.greaterThan =>
        JsonExprGreaterThan.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.greaterThanOrEquals =>
        JsonExprGreaterThanOrEquals.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.and => JsonExprAnd.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.or => JsonExprOr.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.plus =>
        JsonExprPlus.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.minus =>
        JsonExprMinus.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.times =>
        JsonExprTimes.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.contains =>
        JsonExprContains.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.containsAll =>
        JsonExprContainsAll.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.containsAny =>
        JsonExprContainsAny.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.getAttribute =>
        JsonExprGetAttribute.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.hasAttribute =>
        JsonExprHasAttribute.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.like =>
        JsonExprLike.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.is$ => JsonExprIs.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.ifThenElse =>
        JsonExprIfThenElse.fromJson(value as Map<String, Object?>),
      JsonExprOpCode.set => JsonExprSet.fromJson(value as List<Object?>),
      JsonExprOpCode.record =>
        JsonExprRecord.fromJson(value as Map<String, Object?>),
      final JsonExprOpFunc op => JsonExprFuncCall(
          op,
          (value as List<Object?>)
              .map((el) => JsonExpr.fromJson(el as Map<String, Object?>))
              .toList(),
        ),
    };
  }

  const factory JsonExpr.value(CedarValueJson value) = JsonExprValue;

  const factory JsonExpr.variable(CedarVariable variable) = JsonExprVariable;

  const factory JsonExpr.slot(CedarSlotId slotId) = JsonExprSlot;

  const factory JsonExpr.unknown(String name) = JsonExprUnknown;

  const factory JsonExpr.not(JsonExpr arg) = JsonExprNot;

  const factory JsonExpr.neg(JsonExpr arg) = JsonExprNeg;

  const factory JsonExpr.equals(JsonExpr left, JsonExpr right) = JsonExprEquals;

  const factory JsonExpr.notEquals(JsonExpr left, JsonExpr right) =
      JsonExprNotEquals;

  const factory JsonExpr.in$(JsonExpr left, JsonExpr right) = JsonExprIn;

  const factory JsonExpr.lessThan(JsonExpr left, JsonExpr right) =
      JsonExprLessThan;

  const factory JsonExpr.lessThanOrEquals(JsonExpr left, JsonExpr right) =
      JsonExprLessThanOrEquals;

  const factory JsonExpr.greaterThan(JsonExpr left, JsonExpr right) =
      JsonExprGreaterThan;

  const factory JsonExpr.greaterThanOrEquals(JsonExpr left, JsonExpr right) =
      JsonExprGreaterThanOrEquals;

  const factory JsonExpr.and(JsonExpr left, JsonExpr right) = JsonExprAnd;

  const factory JsonExpr.or(JsonExpr left, JsonExpr right) = JsonExprOr;

  const factory JsonExpr.plus(JsonExpr left, JsonExpr right) = JsonExprPlus;

  const factory JsonExpr.minus(JsonExpr left, JsonExpr right) = JsonExprMinus;

  const factory JsonExpr.times(JsonExpr left, JsonExpr right) = JsonExprTimes;

  const factory JsonExpr.contains(JsonExpr left, JsonExpr right) =
      JsonExprContains;

  const factory JsonExpr.containsAll(JsonExpr left, JsonExpr right) =
      JsonExprContainsAll;

  const factory JsonExpr.containsAny(JsonExpr left, JsonExpr right) =
      JsonExprContainsAny;

  const factory JsonExpr.getAttribute(JsonExpr left, String attr) =
      JsonExprGetAttribute;

  const factory JsonExpr.hasAttribute(JsonExpr left, String attr) =
      JsonExprHasAttribute;

  const factory JsonExpr.like(JsonExpr left, String pattern) = JsonExprLike;

  const factory JsonExpr.is$(JsonExpr left, String entityType,
      [JsonExpr? inExpr]) = JsonExprIs;

  const factory JsonExpr.ifThenElse({
    required JsonExpr cond,
    required JsonExpr then,
    required JsonExpr else$,
  }) = JsonExprIfThenElse;

  const factory JsonExpr.set(List<JsonExpr> expressions) = JsonExprSet;

  const factory JsonExpr.record(Map<String, JsonExpr> attributes) =
      JsonExprRecord;

  const factory JsonExpr.funcCall(JsonExprOpFunc fn, List<JsonExpr> args) =
      JsonExprFuncCall;

  JsonExprOp get op;

  Object? valueToJson();

  @nonVirtual
  Map<String, Object?> toJson() => {
        op.toJson(): valueToJson(),
      };

  @override
  String toString() => _prettyJson(toJson());
}

final class JsonExprFuncCall extends JsonExpr {
  const JsonExprFuncCall(this.fn, this.args);

  final JsonExprOpFunc fn;
  final List<JsonExpr> args;

  @override
  JsonExprOpFunc get op => fn;

  @override
  List<Map<String, Object?>> valueToJson() =>
      args.map((arg) => arg.toJson()).toList();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JsonExprFuncCall &&
          op == other.op &&
          const ListEquality().equals(args, other.args);

  @override
  int get hashCode => Object.hash(op, op, args);
}

sealed class CedarValueJson {
  const CedarValueJson();

  factory CedarValueJson.fromJson(Object? json) {
    return switch (json) {
      <String, Object?>{'__entity': _} => CedarValueEntity.fromJson(json),
      <String, Object?>{'__extn': _} => CedarValueExtension.fromJson(json),
      final bool json => CedarValueBool.fromJson(json),
      final num json => CedarValueLong.fromJson(json.toInt()),
      final String json => CedarValueString.fromJson(json),
      final List json => CedarValueSet.fromJson(json),
      final Map json => CedarValueRecord.fromJson(json.cast()),
      _ => throw FormatException('Invalid Cedar JSON value: $json'),
    };
  }

  const factory CedarValueJson.entity(CedarEntityId entityId) =
      CedarValueEntity;

  const factory CedarValueJson.extension(CedarExtensionInvocation extension) =
      CedarValueExtension;

  const factory CedarValueJson.bool(bool value) = CedarValueBool;

  const factory CedarValueJson.long(int value) = CedarValueLong;

  const factory CedarValueJson.string(String value) = CedarValueString;

  const factory CedarValueJson.set(List<CedarValueJson> elements) =
      CedarValueSet;

  const factory CedarValueJson.record(Map<String, CedarValueJson> attributes) =
      CedarValueRecord;

  Object? toJson();

  @override
  String toString() => _prettyJson(toJson());
}

final class CedarValueEntity extends CedarValueJson {
  const CedarValueEntity(this.entityId);

  factory CedarValueEntity.fromJson(Map<String, Object?> json) {
    return CedarValueEntity(
      CedarEntityId.fromJson(json['__entity'] as Map<String, Object?>),
    );
  }

  final CedarEntityId entityId;

  @override
  Map<String, Object?> toJson() => {
        '__entity': entityId.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CedarValueEntity && entityId == other.entityId;

  @override
  int get hashCode => entityId.hashCode;
}

final class CedarValueExtension extends CedarValueJson {
  const CedarValueExtension(this.extension);

  factory CedarValueExtension.fromJson(Map<String, Object?> json) {
    return CedarValueExtension(
      CedarExtensionInvocation.fromJson(json['__extn'] as Map<String, Object?>),
    );
  }

  final CedarExtensionInvocation extension;

  @override
  Map<String, Object?> toJson() => {
        '__extn': extension.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CedarValueExtension && extension == other.extension;

  @override
  int get hashCode => extension.hashCode;
}

final class CedarExtensionInvocation {
  const CedarExtensionInvocation({
    required this.fn,
    required this.arg,
  });

  factory CedarExtensionInvocation.fromJson(Map<String, Object?> json) {
    return CedarExtensionInvocation(
      fn: json['fn'] as String,
      arg: CedarValueJson.fromJson(json['arg']),
    );
  }

  final String fn;
  final CedarValueJson arg;

  Map<String, Object?> toJson() => {
        'fn': fn,
        'arg': arg.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CedarExtensionInvocation && fn == other.fn && arg == other.arg;

  @override
  int get hashCode => Object.hash(fn, arg);
}

final class CedarValueBool extends CedarValueJson {
  const CedarValueBool(this.value);

  factory CedarValueBool.fromJson(bool json) {
    return CedarValueBool(json);
  }

  final bool value;

  @override
  bool toJson() => value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CedarValueBool && value == other.value;

  @override
  int get hashCode => value.hashCode;
}

final class CedarValueLong extends CedarValueJson {
  const CedarValueLong(this.value);

  factory CedarValueLong.fromJson(int json) {
    return CedarValueLong(json);
  }

  final int value;

  @override
  int toJson() => value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CedarValueLong && value == other.value;

  @override
  int get hashCode => value.hashCode;
}

final class CedarValueString extends CedarValueJson {
  const CedarValueString(this.value);

  factory CedarValueString.fromJson(String json) {
    return CedarValueString(json);
  }

  final String value;

  @override
  String toJson() => value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CedarValueString && value == other.value;

  @override
  int get hashCode => value.hashCode;
}

final class CedarValueSet extends CedarValueJson {
  const CedarValueSet(this.elements);

  factory CedarValueSet.fromJson(List<Object?> json) {
    return CedarValueSet([
      for (final element in json) CedarValueJson.fromJson(element),
    ]);
  }

  final List<CedarValueJson> elements;

  @override
  List<Object?> toJson() => [
        for (final element in elements) element.toJson(),
      ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CedarValueSet &&
          const UnorderedIterableEquality().equals(elements, other.elements);

  @override
  int get hashCode => Object.hashAllUnordered(elements);
}

final class CedarValueRecord extends CedarValueJson {
  const CedarValueRecord(this.attributes);

  factory CedarValueRecord.fromJson(Map<String, Object?> json) {
    return CedarValueRecord({
      for (final entry in json.entries)
        entry.key: CedarValueJson.fromJson(entry.value)
    });
  }

  final Map<String, CedarValueJson> attributes;

  @override
  Map<String, Object?> toJson() => {
        for (final entry in attributes.entries) entry.key: entry.value.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CedarValueRecord &&
          const MapEquality().equals(attributes, other.attributes);

  @override
  int get hashCode => const MapEquality().hash(attributes);
}

final class JsonExprValue extends JsonExpr {
  const JsonExprValue(this.value);

  factory JsonExprValue.fromJson(Object? json) {
    return JsonExprValue(CedarValueJson.fromJson(json));
  }

  final CedarValueJson value;

  @override
  JsonExprOpCode get op => JsonExprOpCode.value;

  @override
  Object? valueToJson() => value.toJson();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is JsonExprValue && value == other.value;

  @override
  int get hashCode => Object.hash(op, value);
}

enum CedarVariable { principal, action, resource, context }

final class JsonExprVariable extends JsonExpr {
  const JsonExprVariable(this.variable);

  factory JsonExprVariable.fromJson(String json) {
    return JsonExprVariable(CedarVariable.values.byName(json));
  }

  final CedarVariable variable;

  @override
  JsonExprOpCode get op => JsonExprOpCode.variable;

  @override
  String valueToJson() => variable.name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JsonExprVariable && variable == other.variable;

  @override
  int get hashCode => Object.hash(op, variable);
}

final class JsonExprSlot extends JsonExpr {
  const JsonExprSlot(this.slotId);

  factory JsonExprSlot.fromJson(String json) {
    return JsonExprSlot(CedarSlotId.fromJson(json));
  }

  final CedarSlotId slotId;

  @override
  JsonExprOpCode get op => JsonExprOpCode.slot;

  @override
  String valueToJson() => slotId.toJson();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is JsonExprSlot && slotId == other.slotId;

  @override
  int get hashCode => Object.hash(op, slotId);
}

final class JsonExprUnknown extends JsonExpr {
  const JsonExprUnknown(this.name);

  factory JsonExprUnknown.fromJson(Map<String, Object?> json) {
    return JsonExprUnknown(json['name'] as String);
  }

  final String name;

  @override
  JsonExprOpCode get op => JsonExprOpCode.unknown;

  @override
  Map<String, Object?> valueToJson() => {
        'name': name,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is JsonExprUnknown && name == other.name;

  @override
  int get hashCode => Object.hash(op, name);
}

final class JsonExprNot extends JsonExpr {
  const JsonExprNot(this.arg);

  factory JsonExprNot.fromJson(Map<String, Object?> json) {
    return JsonExprNot(
      JsonExpr.fromJson(json['arg'] as Map<String, Object?>),
    );
  }

  final JsonExpr arg;

  @override
  JsonExprOpCode get op => JsonExprOpCode.not;

  @override
  Map<String, Object?> valueToJson() => {
        'arg': arg.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is JsonExprNot && arg == other.arg;

  @override
  int get hashCode => Object.hash(op, arg);
}

final class JsonExprNeg extends JsonExpr {
  const JsonExprNeg(this.arg);

  factory JsonExprNeg.fromJson(Map<String, Object?> json) {
    return JsonExprNeg(
      JsonExpr.fromJson(json['arg'] as Map<String, Object?>),
    );
  }

  final JsonExpr arg;

  @override
  JsonExprOpCode get op => JsonExprOpCode.neg;

  @override
  Map<String, Object?> valueToJson() => {
        'arg': arg.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is JsonExprNeg && arg == other.arg;

  @override
  int get hashCode => Object.hash(op, arg);
}

sealed class JsonBinaryExpr extends JsonExpr {
  const JsonBinaryExpr(this.left, this.right);

  final JsonExpr left;
  final JsonExpr right;

  @nonVirtual
  @override
  Map<String, Object?> valueToJson() => {
        'left': left.toJson(),
        'right': right.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) &&
      other is JsonBinaryExpr &&
      op == other.op &&
      left == other.left &&
      right == other.right;

  @override
  int get hashCode => Object.hash(op, left, right);
}

final class JsonExprEquals extends JsonBinaryExpr {
  const JsonExprEquals(super.left, super.right);

  factory JsonExprEquals.fromJson(Map<String, Object?> json) {
    return JsonExprEquals(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      JsonExpr.fromJson(json['right'] as Map<String, Object?>),
    );
  }

  @override
  JsonExprOpCode get op => JsonExprOpCode.equals;
}

final class JsonExprNotEquals extends JsonBinaryExpr {
  const JsonExprNotEquals(super.left, super.right);

  factory JsonExprNotEquals.fromJson(Map<String, Object?> json) {
    return JsonExprNotEquals(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      JsonExpr.fromJson(json['right'] as Map<String, Object?>),
    );
  }

  @override
  JsonExprOpCode get op => JsonExprOpCode.notEquals;
}

final class JsonExprIn extends JsonBinaryExpr {
  const JsonExprIn(super.left, super.right);

  factory JsonExprIn.fromJson(Map<String, Object?> json) {
    return JsonExprIn(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      JsonExpr.fromJson(json['right'] as Map<String, Object?>),
    );
  }

  @override
  JsonExprOpCode get op => JsonExprOpCode.in$;
}

final class JsonExprLessThan extends JsonBinaryExpr {
  const JsonExprLessThan(super.left, super.right);

  factory JsonExprLessThan.fromJson(Map<String, Object?> json) {
    return JsonExprLessThan(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      JsonExpr.fromJson(json['right'] as Map<String, Object?>),
    );
  }

  @override
  JsonExprOpCode get op => JsonExprOpCode.lessThan;
}

final class JsonExprLessThanOrEquals extends JsonBinaryExpr {
  const JsonExprLessThanOrEquals(super.left, super.right);

  factory JsonExprLessThanOrEquals.fromJson(Map<String, Object?> json) {
    return JsonExprLessThanOrEquals(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      JsonExpr.fromJson(json['right'] as Map<String, Object?>),
    );
  }

  @override
  JsonExprOpCode get op => JsonExprOpCode.lessThanOrEquals;
}

final class JsonExprGreaterThan extends JsonBinaryExpr {
  const JsonExprGreaterThan(super.left, super.right);

  factory JsonExprGreaterThan.fromJson(Map<String, Object?> json) {
    return JsonExprGreaterThan(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      JsonExpr.fromJson(json['right'] as Map<String, Object?>),
    );
  }

  @override
  JsonExprOpCode get op => JsonExprOpCode.greaterThan;
}

final class JsonExprGreaterThanOrEquals extends JsonBinaryExpr {
  const JsonExprGreaterThanOrEquals(super.left, super.right);

  factory JsonExprGreaterThanOrEquals.fromJson(Map<String, Object?> json) {
    return JsonExprGreaterThanOrEquals(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      JsonExpr.fromJson(json['right'] as Map<String, Object?>),
    );
  }

  @override
  JsonExprOpCode get op => JsonExprOpCode.greaterThanOrEquals;
}

final class JsonExprAnd extends JsonBinaryExpr {
  const JsonExprAnd(super.left, super.right);

  factory JsonExprAnd.fromJson(Map<String, Object?> json) {
    return JsonExprAnd(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      JsonExpr.fromJson(json['right'] as Map<String, Object?>),
    );
  }

  @override
  JsonExprOpCode get op => JsonExprOpCode.and;
}

final class JsonExprOr extends JsonBinaryExpr {
  const JsonExprOr(super.left, super.right);

  factory JsonExprOr.fromJson(Map<String, Object?> json) {
    return JsonExprOr(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      JsonExpr.fromJson(json['right'] as Map<String, Object?>),
    );
  }

  @override
  JsonExprOpCode get op => JsonExprOpCode.or;
}

final class JsonExprPlus extends JsonBinaryExpr {
  const JsonExprPlus(super.left, super.right);

  factory JsonExprPlus.fromJson(Map<String, Object?> json) {
    return JsonExprPlus(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      JsonExpr.fromJson(json['right'] as Map<String, Object?>),
    );
  }

  @override
  JsonExprOpCode get op => JsonExprOpCode.plus;
}

final class JsonExprMinus extends JsonBinaryExpr {
  const JsonExprMinus(super.left, super.right);

  factory JsonExprMinus.fromJson(Map<String, Object?> json) {
    return JsonExprMinus(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      JsonExpr.fromJson(json['right'] as Map<String, Object?>),
    );
  }

  @override
  JsonExprOpCode get op => JsonExprOpCode.minus;
}

final class JsonExprTimes extends JsonBinaryExpr {
  const JsonExprTimes(super.left, super.right);

  factory JsonExprTimes.fromJson(Map<String, Object?> json) {
    return JsonExprTimes(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      JsonExpr.fromJson(json['right'] as Map<String, Object?>),
    );
  }

  @override
  JsonExprOpCode get op => JsonExprOpCode.times;
}

final class JsonExprContains extends JsonBinaryExpr {
  const JsonExprContains(super.left, super.right);

  factory JsonExprContains.fromJson(Map<String, Object?> json) {
    return JsonExprContains(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      JsonExpr.fromJson(json['right'] as Map<String, Object?>),
    );
  }

  @override
  JsonExprOpCode get op => JsonExprOpCode.contains;
}

final class JsonExprContainsAll extends JsonBinaryExpr {
  const JsonExprContainsAll(super.left, super.right);

  factory JsonExprContainsAll.fromJson(Map<String, Object?> json) {
    return JsonExprContainsAll(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      JsonExpr.fromJson(json['right'] as Map<String, Object?>),
    );
  }

  @override
  JsonExprOpCode get op => JsonExprOpCode.containsAll;
}

final class JsonExprContainsAny extends JsonBinaryExpr {
  const JsonExprContainsAny(super.left, super.right);

  factory JsonExprContainsAny.fromJson(Map<String, Object?> json) {
    return JsonExprContainsAny(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      JsonExpr.fromJson(json['right'] as Map<String, Object?>),
    );
  }

  @override
  JsonExprOpCode get op => JsonExprOpCode.containsAny;
}

final class JsonExprGetAttribute extends JsonExpr {
  const JsonExprGetAttribute(this.left, this.attr);

  factory JsonExprGetAttribute.fromJson(Map<String, Object?> json) {
    return JsonExprGetAttribute(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      json['attr'] as String,
    );
  }

  final JsonExpr left;
  final String attr;

  @override
  JsonExprOpCode get op => JsonExprOpCode.getAttribute;

  @override
  Map<String, Object?> valueToJson() => {
        'left': left.toJson(),
        'attr': attr,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JsonExprGetAttribute && left == other.left && attr == other.attr;

  @override
  int get hashCode => Object.hash(op, left, attr);
}

final class JsonExprHasAttribute extends JsonExpr {
  const JsonExprHasAttribute(this.left, this.attr);

  factory JsonExprHasAttribute.fromJson(Map<String, Object?> json) {
    return JsonExprHasAttribute(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      json['attr'] as String,
    );
  }

  final JsonExpr left;
  final String attr;

  @override
  JsonExprOpCode get op => JsonExprOpCode.hasAttribute;

  @override
  Map<String, Object?> valueToJson() => {
        'left': left.toJson(),
        'attr': attr,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JsonExprHasAttribute && left == other.left && attr == other.attr;

  @override
  int get hashCode => Object.hash(op, left, attr);
}

final class JsonExprLike extends JsonExpr {
  const JsonExprLike(this.left, this.pattern);

  factory JsonExprLike.fromJson(Map<String, Object?> json) {
    return JsonExprLike(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      json['pattern'] as String,
    );
  }

  final JsonExpr left;
  final String pattern;

  @override
  JsonExprOpCode get op => JsonExprOpCode.like;

  @override
  Map<String, Object?> valueToJson() => {
        'left': left.toJson(),
        'pattern': pattern,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JsonExprLike && left == other.left && pattern == other.pattern;

  @override
  int get hashCode => Object.hash(op, left, pattern);
}

final class JsonExprIs extends JsonExpr {
  const JsonExprIs(this.left, this.entityType, [this.inExpr]);

  factory JsonExprIs.fromJson(Map<String, Object?> json) {
    return JsonExprIs(
      JsonExpr.fromJson(json['left'] as Map<String, Object?>),
      json['entity_type'] as String,
      json['in'] != null
          ? JsonExpr.fromJson(json['in'] as Map<String, Object?>)
          : null,
    );
  }

  final JsonExpr left;
  final String entityType;
  final JsonExpr? inExpr;

  @override
  JsonExprOpCode get op => JsonExprOpCode.is$;

  @override
  Map<String, Object?> valueToJson() => {
        'left': left.toJson(),
        'entity_type': entityType,
        if (inExpr case final inExpr?) 'in': inExpr.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JsonExprIs &&
          left == other.left &&
          entityType == other.entityType &&
          inExpr == other.inExpr;

  @override
  int get hashCode => Object.hash(op, left, entityType, inExpr);
}

final class JsonExprIfThenElse extends JsonExpr {
  const JsonExprIfThenElse({
    required this.cond,
    required this.then,
    required this.else$,
  });

  factory JsonExprIfThenElse.fromJson(Map<String, Object?> json) {
    return JsonExprIfThenElse(
      cond: JsonExpr.fromJson(json['if'] as Map<String, Object?>),
      then: JsonExpr.fromJson(json['then'] as Map<String, Object?>),
      else$: JsonExpr.fromJson(json['else'] as Map<String, Object?>),
    );
  }

  final JsonExpr cond;
  final JsonExpr then;
  final JsonExpr else$;

  @override
  JsonExprOpCode get op => JsonExprOpCode.ifThenElse;

  @override
  Map<String, Object?> valueToJson() => {
        'if': cond.toJson(),
        'then': then.toJson(),
        'else': else$.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JsonExprIfThenElse &&
          cond == other.cond &&
          then == other.then &&
          else$ == other.else$;

  @override
  int get hashCode => Object.hash(op, cond, then, else$);
}

final class JsonExprSet extends JsonExpr {
  const JsonExprSet(this.expressions);

  factory JsonExprSet.fromJson(List<Object?> json) {
    return JsonExprSet([
      for (final expression in json)
        JsonExpr.fromJson(expression as Map<String, Object?>)
    ]);
  }

  final List<JsonExpr> expressions;

  @override
  JsonExprOpCode get op => JsonExprOpCode.set;

  @override
  List<Object?> valueToJson() => [
        for (final expression in expressions) expression.toJson(),
      ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JsonExprSet &&
          const UnorderedIterableEquality()
              .equals(expressions, other.expressions);

  @override
  int get hashCode => Object.hashAllUnordered(expressions);
}

final class JsonExprRecord extends JsonExpr {
  const JsonExprRecord(this.attributes);

  factory JsonExprRecord.fromJson(Map<String, Object?> json) {
    return JsonExprRecord({
      for (final entry in json.entries)
        entry.key: JsonExpr.fromJson(entry.value as Map<String, Object?>)
    });
  }

  final Map<String, JsonExpr> attributes;

  @override
  JsonExprOpCode get op => JsonExprOpCode.record;

  @override
  Map<String, Object?> valueToJson() => {
        for (final entry in attributes.entries) entry.key: entry.value.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JsonExprRecord &&
          const MapEquality().equals(attributes, other.attributes);

  @override
  int get hashCode => const MapEquality().hash(attributes);
}

String _prettyJson(Object? o) => const JsonEncoder.withIndent('  ').convert(o);
