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

/// @nodoc
const IID_IPasswordCredential = '{6ab18989-c720-41a7-a6c1-feadb36329a0}';

class IPasswordCredential extends IInspectable {
  IPasswordCredential.fromPtr(super.ptr)
      : _vtable = ptr.ref.vtable.cast<_IPasswordCredentialVtbl>().ref;

  final _IPasswordCredentialVtbl _vtable;

  factory IPasswordCredential.from(IInspectable interface) =>
      interface.cast(IPasswordCredential.fromPtr, IID_IPasswordCredential);

  String get resource {
    final resource = calloc<IntPtr>();

    try {
      final hr = _vtable.get_Resource.asFunction<
              int Function(VTablePointer lpVtbl, Pointer<IntPtr> resource)>()(
          lpVtbl, resource);

      if (FAILED(hr)) throwWindowsException(hr);

      return resource.toDartString();
    } finally {
      free(resource);
    }
  }

  set resource(String resource) {
    final hr = _vtable.put_Resource
            .asFunction<int Function(VTablePointer lpVtbl, int resource)>()(
        lpVtbl, resource.toHString());

    if (FAILED(hr)) throwWindowsException(hr);
  }

  String get userName {
    final userName = calloc<IntPtr>();

    try {
      final hr = _vtable.get_UserName.asFunction<
              int Function(VTablePointer lpVtbl, Pointer<IntPtr> userName)>()(
          lpVtbl, userName);

      if (FAILED(hr)) throwWindowsException(hr);

      return userName.toDartString();
    } finally {
      free(userName);
    }
  }

  set userName(String userName) {
    final hr = _vtable.put_UserName
            .asFunction<int Function(VTablePointer lpVtbl, int userName)>()(
        lpVtbl, userName.toHString());

    if (FAILED(hr)) throwWindowsException(hr);
  }

  String get password {
    final password = calloc<IntPtr>();

    try {
      final hr = _vtable.get_Password.asFunction<
              int Function(VTablePointer lpVtbl, Pointer<IntPtr> password)>()(
          lpVtbl, password);

      if (FAILED(hr)) throwWindowsException(hr);

      return password.toDartString();
    } finally {
      free(password);
    }
  }

  set password(String password) {
    final hr = _vtable.put_Password
            .asFunction<int Function(VTablePointer lpVtbl, int password)>()(
        lpVtbl, password.toHString());

    if (FAILED(hr)) throwWindowsException(hr);
  }

  void retrievePassword() {
    final hr = _vtable.RetrievePassword.asFunction<
        int Function(VTablePointer lpVtbl)>()(lpVtbl);

    if (FAILED(hr)) throwWindowsException(hr);
  }

  IPropertySet? get properties {
    final props = calloc<COMObject>();

    final hr = _vtable.get_Properties.asFunction<
        int Function(
            VTablePointer lpVtbl, Pointer<COMObject> props)>()(lpVtbl, props);

    if (FAILED(hr)) {
      free(props);
      throwWindowsException(hr);
    }

    if (props.isNull) {
      free(props);
      return null;
    }

    return IPropertySet.fromPtr(props);
  }
}

final class _IPasswordCredentialVtbl extends Struct {
  external IInspectableVtbl baseVtbl;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, Pointer<IntPtr> resource)>>
      get_Resource;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, IntPtr resource)>>
      put_Resource;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, Pointer<IntPtr> userName)>>
      get_UserName;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, IntPtr userName)>>
      put_UserName;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, Pointer<IntPtr> password)>>
      get_Password;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, IntPtr password)>>
      put_Password;
  external Pointer<NativeFunction<HRESULT Function(VTablePointer lpVtbl)>>
      RetrievePassword;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, Pointer<COMObject> props)>>
      get_Properties;
}
