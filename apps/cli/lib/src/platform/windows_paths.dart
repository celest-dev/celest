// Copied from:
// https://github.com/flutter/packages/blob/36a7b99381f85e86914e82c75fc7d9038ed96cca/packages/path_provider/path_provider_windows/lib/src/path_provider_windows_real.dart

// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: prefer_asserts_with_message

import 'dart:ffi';
import 'dart:io';

import 'package:celest_cli/src/platform/windows_folders.dart';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;
import 'package:win32/win32.dart';

/// Constant for en-US language used in VersionInfo keys.
@visibleForTesting
const String languageEn = '0409';

/// Constant for CP1252 encoding used in VersionInfo keys
@visibleForTesting
const String encodingCP1252 = '04e4';

/// Constant for Unicode encoding used in VersionInfo keys
@visibleForTesting
const String encodingUnicode = '04b0';

/// Wraps the Win32 VerQueryValue API call.
///
/// This class exists to allow injecting alternate metadata in tests without
/// building multiple custom test binaries.
@visibleForTesting
class VersionInfoQuerier {
  /// Returns the value for [key] in [versionInfo]s in section with given
  /// language and encoding, or null if there is no such entry,
  /// or if versionInfo is null.
  ///
  /// See https://docs.microsoft.com/en-us/windows/win32/menurc/versioninfo-resource
  /// for list of possible language and encoding values.
  String? getStringValue(
    Pointer<Uint8>? versionInfo,
    String key, {
    required String language,
    required String encoding,
  }) {
    assert(language.isNotEmpty);
    assert(encoding.isNotEmpty);
    if (versionInfo == null) {
      return null;
    }
    final keyPath = TEXT('\\StringFileInfo\\$language$encoding\\$key');
    final length = calloc<UINT>();
    final valueAddress = calloc<Pointer<Utf16>>();
    try {
      if (VerQueryValue(versionInfo, keyPath, valueAddress, length) == 0) {
        return null;
      }
      return valueAddress.value.toDartString();
    } finally {
      calloc
        ..free(keyPath)
        ..free(length)
        ..free(valueAddress);
    }
  }
}

/// The Windows implementation of path provider.
///
/// This class implements the `package:path_provider` functionality for Windows.
class PathProviderWindows {
  /// The object to use for performing VerQueryValue calls.
  @visibleForTesting
  VersionInfoQuerier versionInfoQuerier = VersionInfoQuerier();

  /// This is typically the same as the TMP environment variable.
  String? getTemporaryPath() {
    final buffer = calloc<Uint16>(MAX_PATH + 1).cast<Utf16>();
    String path;

    try {
      final length = GetTempPath(MAX_PATH, buffer);

      if (length == 0) {
        final error = GetLastError();
        throw WindowsException(error);
      } else {
        path = buffer.toDartString();

        // GetTempPath adds a trailing backslash, but SHGetKnownFolderPath does
        // not. Strip off trailing backslash for consistency with other methods
        // here.
        if (path.endsWith(r'\')) {
          path = path.substring(0, path.length - 1);
        }
      }

      // Ensure that the directory exists, since GetTempPath doesn't.
      final directory = Directory(path);
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }

      return path;
    } finally {
      calloc.free(buffer);
    }
  }

  String? getApplicationSupportPath() =>
      _createApplicationSubdirectory(WindowsKnownFolder.RoamingAppData);

  String? getApplicationDocumentsPath() =>
      getPath(WindowsKnownFolder.Documents);

  String? getApplicationCachePath() =>
      _createApplicationSubdirectory(WindowsKnownFolder.LocalAppData);

  String? getDownloadsPath() => getPath(WindowsKnownFolder.Downloads);

  /// Retrieve any known folder from Windows.
  ///
  /// folderID is a GUID that represents a specific known folder ID, drawn from
  /// [WindowsKnownFolder].
  String? getPath(String folderID) {
    final pathPtrPtr = calloc<Pointer<Utf16>>();
    final knownFolderID = calloc<GUID>()..ref.setGUID(folderID);

    try {
      final hr = SHGetKnownFolderPath(
        knownFolderID,
        KF_FLAG_DEFAULT,
        NULL,
        pathPtrPtr,
      );

      if (FAILED(hr)) {
        if (hr == E_INVALIDARG || hr == E_FAIL) {
          throw WindowsException(hr);
        }
        return null;
      }

      final path = pathPtrPtr.value.toDartString();
      return path;
    } finally {
      calloc
        ..free(pathPtrPtr)
        ..free(knownFolderID);
    }
  }

  String? _getStringValue(Pointer<Uint8>? infoBuffer, String key) =>
      versionInfoQuerier.getStringValue(
        infoBuffer,
        key,
        language: languageEn,
        encoding: encodingCP1252,
      ) ??
      versionInfoQuerier.getStringValue(
        infoBuffer,
        key,
        language: languageEn,
        encoding: encodingUnicode,
      );

  /// Returns the relative path string to append to the root directory returned
  /// by Win32 APIs for application storage (such as RoamingAppDir) to get a
  /// directory that is unique to the application.
  ///
  /// The convention is to use company-name\product-name\. This will use that if
  /// possible, using the data in the VERSIONINFO resource, with the following
  /// fallbacks:
  /// - If the company name isn't there, that component will be dropped.
  /// - If the product name isn't there, it will use the exe's filename (without
  ///   extension).
  String _getApplicationSpecificSubdirectory() {
    String? companyName;
    String? productName;

    final moduleNameBuffer = wsalloc(MAX_PATH + 1);
    final unused = calloc<DWORD>();
    Pointer<BYTE>? infoBuffer;
    try {
      // Get the module name.
      final moduleNameLength = GetModuleFileName(0, moduleNameBuffer, MAX_PATH);
      if (moduleNameLength == 0) {
        final error = GetLastError();
        throw WindowsException(error);
      }

      // From that, load the VERSIONINFO resource
      final infoSize = GetFileVersionInfoSize(moduleNameBuffer, unused);
      if (infoSize != 0) {
        infoBuffer = calloc<BYTE>(infoSize);
        if (GetFileVersionInfo(moduleNameBuffer, 0, infoSize, infoBuffer) ==
            0) {
          calloc.free(infoBuffer);
          infoBuffer = null;
        }
      }
      companyName = _sanitizedDirectoryName(
        _getStringValue(infoBuffer, 'CompanyName'),
      );
      productName = _sanitizedDirectoryName(
        _getStringValue(infoBuffer, 'ProductName'),
      );

      // If there was no product name, use the executable name.
      productName ??= path.basenameWithoutExtension(
        moduleNameBuffer.toDartString(),
      );

      return companyName != null
          ? path.join(companyName, productName)
          : productName;
    } finally {
      calloc
        ..free(moduleNameBuffer)
        ..free(unused);
      if (infoBuffer != null) {
        calloc.free(infoBuffer);
      }
    }
  }

  /// Makes [rawString] safe as a directory component. See
  /// https://docs.microsoft.com/en-us/windows/win32/fileio/naming-a-file#naming-conventions
  ///
  /// If after sanitizing the string is empty, returns null.
  String? _sanitizedDirectoryName(String? rawString) {
    if (rawString == null) {
      return null;
    }
    var sanitized = rawString
        // Replace banned characters.
        .replaceAll(RegExp(r'[<>:"/\\|?*]'), '_')
        // Remove trailing whitespace.
        .trimRight()
        // Ensure that it does not end with a '.'.
        .replaceAll(RegExp(r'[.]+$'), '');
    const kMaxComponentLength = 255;
    if (sanitized.length > kMaxComponentLength) {
      sanitized = sanitized.substring(0, kMaxComponentLength);
    }
    return sanitized.isEmpty ? null : sanitized;
  }

  String? _createApplicationSubdirectory(String folderId) {
    final baseDir = getPath(folderId);
    if (baseDir == null) {
      return null;
    }
    final directory = Directory(
      path.join(baseDir, _getApplicationSpecificSubdirectory()),
    );
    // Ensure that the directory exists if possible, since it will on other
    // platforms. If the name is longer than MAXPATH, creating will fail, so
    // skip that step; it's up to the client to decide what to do with the path
    // in that case (e.g., using a short path).
    if (directory.path.length <= MAX_PATH) {
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }
    }
    return directory.path;
  }
}
