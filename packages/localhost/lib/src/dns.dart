// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:typed_data';

final class DnsHeader {
  const DnsHeader({
    required this.id,
    required this.flags,
    required this.questions,
    required this.answers,
    required this.authorityRecords,
    required this.additionalRecords,
  });

  factory DnsHeader.decode(Uint8List data) {
    final byteData = ByteData.view(data.buffer);
    final id = byteData.getUint16(0);
    final flags = byteData.getUint16(2);
    final questions = byteData.getUint16(4);
    final answers = byteData.getUint16(6);
    final authorityRecords = byteData.getUint16(8);
    final additionalRecords = byteData.getUint16(10);
    return DnsHeader(
      id: id,
      flags: flags,
      questions: questions,
      answers: answers,
      authorityRecords: authorityRecords,
      additionalRecords: additionalRecords,
    );
  }

  static const int length = 12;

  final int id;
  final int flags;
  final int questions;
  final int answers;
  final int authorityRecords;
  final int additionalRecords;

  Uint8List encode() {
    final data = Uint8List(length);
    final byteData = ByteData.view(data.buffer);
    byteData.setUint16(0, id);
    byteData.setUint16(2, flags);
    byteData.setUint16(4, questions);
    byteData.setUint16(6, answers);
    byteData.setUint16(8, authorityRecords);
    byteData.setUint16(10, additionalRecords);
    return data;
  }

  @override
  String toString() {
    final buff = StringBuffer('DnsHeader(')
      ..write({
        'id': id,
        'flags': flags,
        'questions': questions,
        'answers': answers,
        'authorityRecords': authorityRecords,
        'additionalRecords': additionalRecords,
      })
      ..write(')');
    return buff.toString();
  }
}

final class DnsQuestion {
  const DnsQuestion({
    required this.fqdn,
    required this.type,
    required this.cls,
  });

  factory DnsQuestion.decode(Uint8List data, int offset) {
    final byteData = ByteData.view(data.buffer);
    final fqdn = _readFQDN(data, byteData, offset, data.length);
    offset += fqdn.bytesRead;
    final type = ResourceRecordType.fromValue(byteData.getUint16(offset));
    offset += 2;
    final cls = ResourceRecordClass.fromValue(byteData.getUint16(offset));
    offset += 2;
    return DnsQuestion(
      fqdn: fqdn.fqdn,
      type: type,
      cls: cls,
    );
  }

  final String fqdn;
  final ResourceRecordType? type;
  final ResourceRecordClass? cls;

  int get length => fqdn.length + 2 + 2 + 2;

  Uint8List encode() {
    assert(type != null);
    assert(cls != null);
    final data = Uint8List(length);
    final byteData = ByteData.view(data.buffer);
    var offset = 0;
    final nameParts = fqdn.split('.');
    for (final part in nameParts) {
      data[offset] = part.length;
      offset++;
      data.setRange(offset, offset + part.length, utf8.encode(part));
      offset += part.length;
    }
    data[offset] = 0;
    offset++;
    byteData.setUint16(offset, type!.value);
    offset += 2;
    byteData.setUint16(offset, cls!.value);
    offset += 2;
    return data;
  }

  @override
  String toString() {
    return '$fqdn ${type?.name} ${cls?.name}';
  }
}

enum ResourceRecordType {
  A(1),
  AAAA(28);

  const ResourceRecordType(this.value);

  static ResourceRecordType? fromValue(int value) => switch (value) {
        1 => A,
        28 => AAAA,
        _ => null,
      };

  final int value;
}

enum ResourceRecordClass {
  IN(1);

  const ResourceRecordClass(this.value);

  static ResourceRecordClass? fromValue(int value) {
    if (value & 0x8000 == 0x8000) {
      value = value & ~0x8000;
    }
    return switch (value) {
      1 => IN,
      _ => null,
    };
  }

  final int value;
}

final class DnsResponse {
  const DnsResponse({
    required this.header,
    required this.questions,
    required this.answers,
    required this.authorityRecords,
    required this.additionalRecords,
  });

  factory DnsResponse.decode(Uint8List data) {
    final header = DnsHeader.decode(data);
    var offset = DnsHeader.length;
    final questions = <DnsQuestion>[];
    for (var i = 0; i < header.questions; i++) {
      final question = DnsQuestion.decode(data, offset);
      offset += question.length;
      questions.add(question);
    }
    final answers = <ResourceRecord>[];
    for (var i = 0; i < header.answers; i++) {
      final answer = ResourceRecord.decode(data, offset);
      offset += answer.length;
      answers.add(answer);
    }
    final authorityRecords = <ResourceRecord>[];
    for (var i = 0; i < header.authorityRecords; i++) {
      final authorityRecord = ResourceRecord.decode(data, offset);
      offset += authorityRecord.length;
      authorityRecords.add(authorityRecord);
    }
    final additionalRecords = <ResourceRecord>[];
    for (var i = 0; i < header.additionalRecords; i++) {
      final additionalRecord = ResourceRecord.decode(data, offset);
      offset += additionalRecord.length;
      additionalRecords.add(additionalRecord);
    }
    return DnsResponse(
      header: header,
      questions: questions,
      answers: answers,
      authorityRecords: authorityRecords,
      additionalRecords: additionalRecords,
    );
  }

  final DnsHeader header;
  final List<DnsQuestion> questions;
  final List<ResourceRecord> answers;
  final List<ResourceRecord> authorityRecords;
  final List<ResourceRecord> additionalRecords;

  int get length {
    var length = DnsHeader.length;
    for (final question in questions) {
      length += question.length;
    }
    for (final answer in answers) {
      length += answer.length;
    }
    for (final authorityRecord in authorityRecords) {
      length += authorityRecord.length;
    }
    for (final additionalRecord in additionalRecords) {
      length += additionalRecord.length;
    }
    return length;
  }

  Uint8List encode() {
    final data = Uint8List(length);
    var offset = 0;
    final headerData = header.encode();
    data.setRange(offset, offset + headerData.length, headerData);
    offset += headerData.length;
    for (final question in questions) {
      final questionData = question.encode();
      data.setRange(offset, offset + questionData.length, questionData);
      offset += questionData.length;
    }
    for (final answer in answers) {
      final answerData = answer.encode();
      data.setRange(offset, offset + answerData.length, answerData);
      offset += answerData.length;
    }
    for (final authorityRecord in authorityRecords) {
      final authorityRecordData = authorityRecord.encode();
      data.setRange(
        offset,
        offset + authorityRecordData.length,
        authorityRecordData,
      );
      offset += authorityRecordData.length;
    }
    for (final additionalRecord in additionalRecords) {
      final additionalRecordData = additionalRecord.encode();
      data.setRange(
        offset,
        offset + additionalRecordData.length,
        additionalRecordData,
      );
      offset += additionalRecordData.length;
    }
    return data;
  }

  @override
  String toString() {
    final buff = StringBuffer('DnsResponse(')
      ..writeln('  header=$header')
      ..writeln('  questions=$questions')
      ..writeln('  answers=$answers')
      ..writeln('  authorityRecords=$authorityRecords')
      ..writeln('  additionalRecords=$additionalRecords')
      ..write(')');
    return buff.toString();
  }
}

final class DnsResponseBuilder {
  DnsResponseBuilder({
    this.header,
  });

  DnsHeader? header;
  final questions = <DnsQuestion>[];
  final answers = <ResourceRecord>[];
  final authorityRecords = <ResourceRecord>[];
  final additionalRecords = <ResourceRecord>[];

  DnsResponse build() {
    assert(header != null);
    return DnsResponse(
      header: header!,
      questions: questions,
      answers: answers,
      authorityRecords: authorityRecords,
      additionalRecords: additionalRecords,
    );
  }
}

final class ResourceRecord {
  const ResourceRecord({
    required this.name,
    required this.type,
    required this.cls,
    required this.ttl,
    required this.data,
  });

  factory ResourceRecord.decode(Uint8List data, int offset) {
    final byteData = ByteData.view(data.buffer);
    final name = _readFQDN(data, byteData, offset, data.length);
    offset += name.bytesRead;
    final type = ResourceRecordType.fromValue(byteData.getUint16(offset))!;
    offset += 2;
    final cls = ResourceRecordClass.fromValue(byteData.getUint16(offset))!;
    offset += 2;
    final ttl = byteData.getUint32(offset);
    offset += 4;
    final rdataLength = byteData.getUint16(offset);
    offset += 2;
    final rdata = data.sublist(offset, offset + rdataLength);
    return ResourceRecord(
      name: name.fqdn,
      type: type,
      cls: cls,
      ttl: ttl,
      data: rdata,
    );
  }

  final String name;
  final ResourceRecordType type;
  final ResourceRecordClass cls;
  final int ttl;
  final Uint8List data;

  int get length => name.length + 2 + 2 + 2 + 4 + 2 + data.length;

  Uint8List encode() {
    final data = Uint8List(length);
    final byteData = ByteData.view(data.buffer);
    var offset = 0;
    final nameParts = name.split('.');
    for (final part in nameParts) {
      data[offset] = part.length;
      offset++;
      data.setRange(offset, offset + part.length, utf8.encode(part));
      offset += part.length;
    }
    data[offset] = 0;
    offset++;
    byteData.setUint16(offset, type.value);
    offset += 2;
    byteData.setUint16(offset, cls.value);
    offset += 2;
    byteData.setUint32(offset, ttl);
    offset += 4;
    byteData.setUint16(offset, this.data.length);
    offset += 2;
    data.setRange(offset, offset + this.data.length, this.data);
    return data;
  }

  @override
  String toString() {
    final buff = StringBuffer('ResourceRecord(')
      ..write({
        'name': name,
        'type': type.name,
        'cls': cls.name,
        'ttl': ttl,
        'data': data,
      })
      ..write(')');
    return buff.toString();
  }
}

// Read a FQDN at the given offset. Returns a pair with the FQDN
// parts and the number of bytes consumed.
//
// If decoding fails (e.g. due to an invalid packet) `null` is returned.
_FQDNReadResult _readFQDN(
  Uint8List data,
  ByteData byteData,
  int offset,
  int length,
) {
  void checkLength(int required) {
    RangeError.checkValueInInterval(required, 0, length);
  }

  final parts = <String>[];
  final prevOffset = offset;
  while (true) {
    // At least one byte is required.
    checkLength(offset + 1);

    // Check for compressed.
    if (data[offset] & 0xc0 == 0xc0) {
      // At least two bytes are required for a compressed FQDN.
      checkLength(offset + 2);

      // A compressed FQDN has a new offset in the lower 14 bits.
      final result = _readFQDN(
        data,
        byteData,
        byteData.getUint16(offset) & ~0xc000,
        length,
      );
      parts.addAll(result.fqdnParts);
      offset += 2;
      break;
    } else {
      // A normal FQDN part has a length and a UTF-8 encoded name
      // part. If the length is 0 this is the end of the FQDN.
      final partLength = data[offset];
      offset++;
      if (partLength > 0) {
        checkLength(offset + partLength);
        final partBytes = Uint8List.view(data.buffer, offset, partLength);
        offset += partLength;
        // According to the RFC, this is supposed to be utf-8 encoded, but
        // we should continue decoding even if it isn't to avoid dropping the
        // rest of the data, which might still be useful.
        parts.add(utf8.decode(partBytes, allowMalformed: true));
      } else {
        break;
      }
    }
  }
  return _FQDNReadResult(parts, offset - prevOffset);
}

/// Result of reading a Fully Qualified Domain Name (FQDN).
class _FQDNReadResult {
  /// Creates a new FQDN read result.
  _FQDNReadResult(this.fqdnParts, this.bytesRead);

  /// The raw parts of the FQDN.
  final List<String> fqdnParts;

  /// The bytes consumed from the packet for this FQDN.
  final int bytesRead;

  /// Returns the Fully Qualified Domain Name.
  String get fqdn => fqdnParts.join('.');

  @override
  String toString() => fqdn;
}
