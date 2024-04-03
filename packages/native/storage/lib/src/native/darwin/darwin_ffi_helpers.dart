import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'core_foundation.ffi.dart';

extension StringToCFString on String {
  /// Converts `this` to a [CFString] within the given [arena].
  Pointer<CFString> toCFString(Arena arena) {
    final str = toNativeUtf8(allocator: arena);
    final cfStr = CFStringCreateWithCString(
      kCFAllocatorDefault,
      str.cast<Char>(),
      kCFStringEncodingUTF8,
    );
    arena.onReleaseAll(() {
      CFRelease(cfStr.cast());
    });
    return cfStr;
  }

  /// Converts `this` to a [CFData] within the given [arena].
  Pointer<CFData> toCFData(Arena arena) {
    final data = toNativeUtf8(allocator: arena);
    final cfData = CFDataCreate(
      kCFAllocatorDefault,
      data.cast<UnsignedChar>(),
      data.length,
    );
    arena.onReleaseAll(() {
      CFRelease(cfData.cast());
    });
    return cfData;
  }
}

extension MapToCFDictionary on Map<Pointer, Pointer> {
  /// Converts `this` to a [CFDictionary] within the given [arena].
  Pointer<CFDictionary> toCFDictionary(Arena arena) {
    final cfKeys = arena<CFTypeRef>(length);
    final cfValues = arena<CFTypeRef>(length);
    var i = 0;
    for (final entry in entries) {
      cfKeys[i] = entry.key.cast();
      cfValues[i] = entry.value.cast();
      i++;
    }
    final cfDict = CFDictionaryCreate(
      nullptr, // default allocator
      cfKeys,
      cfValues,
      length,
      nullptr, // kCFTypeDictionaryKeyCallBacks
      nullptr, // kCFTypeDictionaryValueCallBacks
    );
    arena.onReleaseAll(() {
      CFRelease(cfDict.cast());
    });
    return cfDict;
  }
}

extension CFDataRefToString on CFDataRef {
  /// Converts `this` to a [String].
  String? toDartString() {
    if (this == nullptr) {
      return null;
    }
    final ptr = CFDataGetBytePtr(this);
    if (ptr == nullptr) {
      return null;
    }
    return ptr.cast<Utf8>().toDartString();
  }
}

extension CFStringRefToString on CFStringRef {
  /// Converts `this` to a [String].
  String? toDartString() {
    if (this == nullptr) {
      return null;
    }
    final cStringPtr = CFStringGetCStringPtr(
      this,
      kCFStringEncodingUTF8,
    );
    if (cStringPtr != nullptr) {
      return cStringPtr.cast<Utf8>().toDartString();
    }
    // Call CFStringGetCString as a backup.
    // See: https://developer.apple.com/documentation/corefoundation/1542133-cfstringgetcstringptr
    final strLen = CFStringGetLength(this);
    final maxLen = CFStringGetMaximumSizeForEncoding(
          strLen,
          kCFStringEncodingUTF8,
        ) +
        1 /* terminating NUL byte */;
    final buffer = calloc<Char>(maxLen);
    try {
      final ret = CFStringGetCString(
        this,
        buffer,
        maxLen,
        kCFStringEncodingUTF8,
      );
      if (ret == 0 /* FALSE */) {
        return null;
      }
      return buffer.cast<Utf8>().toDartString();
    } finally {
      calloc.free(buffer);
    }
  }
}
