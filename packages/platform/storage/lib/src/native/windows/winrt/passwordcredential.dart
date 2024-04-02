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

import 'icredentialfactory.dart';
import 'ipasswordcredential.dart';

/// Represents the password credential store.
class PasswordCredential extends IInspectable implements IPasswordCredential {
  PasswordCredential() : super(activateClass(_className));
  PasswordCredential.fromPtr(super.ptr);

  static const _className = 'Windows.Security.Credentials.PasswordCredential';

  factory PasswordCredential.createPasswordCredential(
          String resource, String userName, String password) =>
      createActivationFactory(
              ICredentialFactory.fromPtr, _className, IID_ICredentialFactory)
          .createPasswordCredential(resource, userName, password);

  late final _iPasswordCredential = IPasswordCredential.from(this);

  @override
  String get resource => _iPasswordCredential.resource;

  @override
  set resource(String resource) => _iPasswordCredential.resource = resource;

  @override
  String get userName => _iPasswordCredential.userName;

  @override
  set userName(String userName) => _iPasswordCredential.userName = userName;

  @override
  String get password => _iPasswordCredential.password;

  @override
  set password(String password) => _iPasswordCredential.password = password;

  @override
  void retrievePassword() => _iPasswordCredential.retrievePassword();

  @override
  IPropertySet? get properties => _iPasswordCredential.properties;
}
