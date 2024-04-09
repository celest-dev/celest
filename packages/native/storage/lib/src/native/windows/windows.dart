import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:native_storage/native_storage.dart';
import 'package:native_storage/src/native_storage_exception.dart';
import 'package:native_storage/src/native_storage_extended.dart';
import 'package:native_storage/src/util/functional.dart';
import 'package:path/path.dart' as p;
import 'package:win32/win32.dart';
import 'package:win32_registry/win32_registry.dart';
import 'package:windows_applicationmodel/windows_applicationmodel.dart';

final windows = WindowsCommon._();

typedef WindowsApplicationInfo = ({
  String companyName,
  String productName,
});

final class _LANGANDCODEPAGE extends Struct {
  @WORD()
  external int wLanguage;

  @WORD()
  external int wCodepage;
}

final class WindowsCommon {
  WindowsCommon._();

  WindowsException get _lastException =>
      WindowsException(HRESULT_FROM_WIN32(GetLastError()));

  late final String applicationId = lazy(() {
    final exeName = p.basenameWithoutExtension(Platform.resolvedExecutable);
    try {
      return Package.current?.id?.fullName ?? exeName;
    } on Object {
      return exeName;
    }
  });

  /// Retrieves the package information.
  /// Adapted from:
  /// - https://github.com/fluttercommunity/plus_plugins/blob/e8d3b445ce52012456126a3844ddb49b92c5c850/packages/package_info_plus/package_info_plus/lib/src/file_version_info.dart
  /// - https://github.com/dart-windows/win32/blob/5f305167bfe181abbc663a7f7f2a0787910fac21/example/filever.dart#L22
  /// - https://learn.microsoft.com/en-us/windows/win32/api/winver/nf-winver-verqueryvaluea
  late final WindowsApplicationInfo? applicationInfo = using((arena) {
    final lptstrFilename = wsalloc(MAX_PATH);
    arena.onReleaseAll(() => free(lptstrFilename));
    if (FAILED(
      GetModuleFileName(0, lptstrFilename, MAX_PATH),
    )) {
      throw NativeStorageException(
        'Could not retrieve filename: $_lastException',
      );
    }
    final verSize = GetFileVersionInfoSize(lptstrFilename, nullptr);
    if (verSize == 0) {
      return null;
    }
    final verData = arena<BYTE>(verSize);
    if (FAILED(
      GetFileVersionInfo(lptstrFilename, NULL, verSize, verData),
    )) {
      return null;
    }

    final lpTranslate = arena<Pointer<_LANGANDCODEPAGE>>();
    final lenTranslate = arena<UINT>();
    final lpTranslateSubBlock = TEXT(r'\VarFileInfo\Translation');
    arena.onReleaseAll(() => free(lpTranslateSubBlock));
    if (FAILED(
      VerQueryValue(
        verData,
        lpTranslateSubBlock,
        lpTranslate,
        lenTranslate,
      ),
    )) {
      throw NativeStorageException(
        'Could not retrieve translation info: $_lastException',
      );
    }

    String toHex(int value) => value.toRadixString(16).padLeft(4, '0');
    String? valueFor(String name) {
      if (lpTranslate == nullptr || lenTranslate.value == 0) return null;
      final langCodepageArr = lpTranslate.value;
      final n = lenTranslate.value / sizeOf<_LANGANDCODEPAGE>();
      final langCodepages = [
        for (var i = 0; i < n; i++) langCodepageArr[i],
      ];
      for (final _LANGANDCODEPAGE(:wLanguage, :wCodepage) in langCodepages) {
        final lpBuffer = arena<LPWSTR>();
        final puLen = arena<UINT>();
        final lang = toHex(wLanguage);
        final codepage = toHex(wCodepage);
        final lpSubBlock = TEXT('\\StringFileInfo\\$lang$codepage\\$name');
        arena.onReleaseAll(() => free(lpSubBlock));
        if (SUCCEEDED(
          VerQueryValue(
            lpTranslateSubBlock,
            lpSubBlock,
            lpBuffer,
            puLen,
          ),
        )) {
          if (lpBuffer != nullptr && puLen.value > 0) {
            return lpBuffer.value.toDartString(length: puLen.value);
          }
        }
      }

      return null;
    }

    final companyName = valueFor('CompanyName');
    if (companyName == null) {
      return null;
    }
    final applicationName = valueFor('ProductName');
    if (applicationName == null) {
      return (
        companyName: companyName,
        productName: applicationId,
      );
    }
    return (
      companyName: companyName,
      productName: applicationName,
    );
  });
}

// ignore: invalid_use_of_visible_for_testing_member
mixin NativeStorageWindows on NativeStorage implements NativeStorageExtended {
  @protected
  abstract final String? namespaceOverride;

  @override
  late final String namespace = lazy(() {
    if (namespaceOverride case final namespaceOverride?) {
      return namespaceOverride;
    }
    if (windows.applicationInfo case (:final companyName, :final productName)) {
      return '$companyName\\$productName';
    }
    return windows.applicationId;
  });

  @protected
  late final registry = lazy(() {
    final hkcu = Registry.currentUser;
    var key = hkcu
        .createKey('SOFTWARE\\Classes\\Local Settings\\Software\\$namespace');
    if (scope case final scope?) {
      for (final path in scope.split('/')) {
        key = key.createKey(path);
      }
    }
    return key;
  });

  @override
  String? delete(String key) {
    final current = read(key);
    if (current == null) {
      return null;
    }
    registry.deleteValue(key);
    return current;
  }

  @override
  List<String> get allKeys {
    final allKeys = <String>[];
    try {
      for (final value in List.of(registry.values)) {
        allKeys.add(value.name);
      }
    } on WindowsException catch (e) {
      if (e.toString().contains('marked for deletion')) {
        // OK. Will throw if recently cleared/deleted.
        return const [];
      }
      rethrow;
    }
    for (final subkey in List.of(registry.subkeyNames)) {
      try {
        allKeys.addAll(
          registry.createKey(subkey).values.map((v) => '$subkey/${v.name}'),
        );
      } on WindowsException catch (e) {
        if (e.toString().contains('marked for deletion')) {
          // OK. Will throw if recently cleared/deleted.
          continue;
        }
        rethrow;
      }
    }
    return allKeys;
  }

  @override
  void clear() {
    for (final value in List.of(registry.values)) {
      registry.deleteValue(value.name);
    }
    for (final subkey in List.of(registry.subkeyNames)) {
      registry.deleteKey(subkey, recursive: true);
    }
  }

  @override
  void close() {
    registry.close();
    super.close();
  }
}
