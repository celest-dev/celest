// Copyright (c) 2023, Dart | Windows. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: unnecessary_import, unused_import

import 'dart:async';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart'
    hide DocumentProperties, WinRTStringConversion;
import 'package:windows_foundation/internal.dart';
import 'package:windows_foundation/windows_foundation.dart';

import 'ipasswordvault.dart';
import 'passwordcredential.dart';

/// Represents a Credential Locker of credentials. Lockers are specific to a
/// user.
class PasswordVault extends IInspectable implements IPasswordVault {
  PasswordVault() : super(activateClass(_className));
  PasswordVault.fromPtr(super.ptr);

  static const _className = 'Windows.Security.Credentials.PasswordVault';

  late final _iPasswordVault = IPasswordVault.from(this);

  @override
  void add(PasswordCredential? credential) => _iPasswordVault.add(credential);

  @override
  void remove(PasswordCredential? credential) =>
      _iPasswordVault.remove(credential);

  @override
  PasswordCredential? retrieve(String resource, String userName) =>
      _iPasswordVault.retrieve(resource, userName);

  @override
  List<PasswordCredential?> findAllByResource(String resource) =>
      _iPasswordVault.findAllByResource(resource);

  @override
  List<PasswordCredential?> findAllByUserName(String userName) =>
      _iPasswordVault.findAllByUserName(userName);

  @override
  List<PasswordCredential?> retrieveAll() => _iPasswordVault.retrieveAll();
}
