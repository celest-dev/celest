// Copyright (c) 2023, Dart | Windows. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: unnecessary_import, unused_import

import 'dart:async';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:platform_storage/src/native/windows/winrt/helpers.dart';
import 'package:win32/win32.dart'
    hide DocumentProperties, WinRTStringConversion;
import 'package:windows_foundation/internal.dart';
import 'package:windows_foundation/windows_foundation.dart';

import 'passwordcredential.dart';

/// @nodoc
const IID_IPasswordVault = '{61fd2c0b-c8d4-48c1-a54f-bc5a64205af2}';

class IPasswordVault extends IInspectable {
  IPasswordVault.fromPtr(super.ptr)
      : _vtable = ptr.ref.vtable.cast<_IPasswordVaultVtbl>().ref;

  final _IPasswordVaultVtbl _vtable;

  factory IPasswordVault.from(IInspectable interface) =>
      interface.cast(IPasswordVault.fromPtr, IID_IPasswordVault);

  void add(PasswordCredential? credential) {
    final hr = _vtable.Add.asFunction<
            int Function(VTablePointer lpVtbl, VTablePointer credential)>()(
        lpVtbl, credential.lpVtbl);

    if (FAILED(hr)) throwWindowsException(hr);
  }

  void remove(PasswordCredential? credential) {
    final hr = _vtable.Remove.asFunction<
            int Function(VTablePointer lpVtbl, VTablePointer credential)>()(
        lpVtbl, credential.lpVtbl);

    if (FAILED(hr)) throwWindowsException(hr);
  }

  PasswordCredential? retrieve(String resource, String userName) {
    final credential = calloc<COMObject>();

    final hr = _vtable.Retrieve.asFunction<
            int Function(VTablePointer lpVtbl, int resource, int userName,
                Pointer<COMObject> credential)>()(
        lpVtbl, resource.toHString(), userName.toHString(), credential);

    if (FAILED(hr)) {
      free(credential);
      throwWindowsException(hr);
    }

    if (credential.isNull) {
      free(credential);
      return null;
    }

    return PasswordCredential.fromPtr(credential);
  }

  List<PasswordCredential?> findAllByResource(String resource) {
    final credentials = calloc<COMObject>();

    final hr = _vtable.FindAllByResource.asFunction<
            int Function(VTablePointer lpVtbl, int resource,
                Pointer<COMObject> credentials)>()(
        lpVtbl, resource.toHString(), credentials);

    if (FAILED(hr)) {
      free(credentials);
      throwWindowsException(hr);
    }

    return IVectorView<PasswordCredential?>.fromPtr(credentials,
            iterableIid: '{0d224a66-bad5-5ad5-9ade-1e9f5a60fe73}',
            creator: PasswordCredential.fromPtr)
        .toList();
  }

  List<PasswordCredential?> findAllByUserName(String userName) {
    final credentials = calloc<COMObject>();

    final hr = _vtable.FindAllByUserName.asFunction<
            int Function(VTablePointer lpVtbl, int userName,
                Pointer<COMObject> credentials)>()(
        lpVtbl, userName.toHString(), credentials);

    if (FAILED(hr)) {
      free(credentials);
      throwWindowsException(hr);
    }

    return IVectorView<PasswordCredential?>.fromPtr(credentials,
            iterableIid: '{0d224a66-bad5-5ad5-9ade-1e9f5a60fe73}',
            creator: PasswordCredential.fromPtr)
        .toList();
  }

  List<PasswordCredential?> retrieveAll() {
    final credentials = calloc<COMObject>();

    final hr = _vtable.RetrieveAll.asFunction<
        int Function(VTablePointer lpVtbl,
            Pointer<COMObject> credentials)>()(lpVtbl, credentials);

    if (FAILED(hr)) {
      free(credentials);
      throwWindowsException(hr);
    }

    return IVectorView<PasswordCredential?>.fromPtr(credentials,
            iterableIid: '{0d224a66-bad5-5ad5-9ade-1e9f5a60fe73}',
            creator: PasswordCredential.fromPtr)
        .toList();
  }
}

final class _IPasswordVaultVtbl extends Struct {
  external IInspectableVtbl baseVtbl;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, VTablePointer credential)>>
      Add;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, VTablePointer credential)>>
      Remove;
  external Pointer<
      NativeFunction<
          HRESULT Function(VTablePointer lpVtbl, IntPtr resource,
              IntPtr userName, Pointer<COMObject> credential)>> Retrieve;
  external Pointer<
      NativeFunction<
          HRESULT Function(VTablePointer lpVtbl, IntPtr resource,
              Pointer<COMObject> credentials)>> FindAllByResource;
  external Pointer<
      NativeFunction<
          HRESULT Function(VTablePointer lpVtbl, IntPtr userName,
              Pointer<COMObject> credentials)>> FindAllByUserName;
  external Pointer<
          NativeFunction<
              HRESULT Function(
                  VTablePointer lpVtbl, Pointer<COMObject> credentials)>>
      RetrieveAll;
}
