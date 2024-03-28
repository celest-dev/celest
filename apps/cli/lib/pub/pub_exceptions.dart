// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';
import 'dart:isolate';

import 'package:args/command_runner.dart';
import 'package:http/http.dart' as http;
import 'package:source_span/source_span.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:yaml/yaml.dart';

/// An exception class for exceptions that are intended to be seen by the user.
///
/// These exceptions won't have any debugging information printed when they're
/// thrown.
class ApplicationException implements Exception {
  ApplicationException(this.message);
  final String message;

  @override
  String toString() => message;
}

/// A subclass of [ApplicationException] that occurs when running a subprocess
/// has failed.
class RunProcessException extends ApplicationException {
  RunProcessException(super.message);
}

/// An exception class for exceptions that are intended to be seen by the user
/// and are associated with a problem in a file at some path.
class FileException implements ApplicationException {
  FileException(this.message, this.path);
  @override
  final String message;

  /// The path to the file that was missing or erroneous.
  final String path;

  @override
  String toString() => message;
}

/// A class for exceptions that wrap other exceptions.
class WrappedException extends ApplicationException {
  WrappedException(super.message, this.innerError, [StackTrace? innerTrace])
      : innerChain = innerTrace == null ? null : Chain.forTrace(innerTrace);

  /// The underlying exception that [this] is wrapping, if any.
  final Object? innerError;

  /// The stack chain for [innerError] if it exists.
  final Chain? innerChain;
}

/// A class for exceptions that shouldn't be printed at the top level.
///
/// This is usually used when an exception has already been printed using
/// [log.exception].
class SilentException extends WrappedException {
  SilentException(Object? innerError, [StackTrace? innerTrace])
      : super(innerError.toString(), innerError, innerTrace);
}

/// A class for errors in a command's input data.
///
/// This corresponds to the `data` exit code.
class DataException extends ApplicationException {
  DataException(super.message);
}

/// An exception indicating that the users configuration is invalid.
///
/// This corresponds to the `config` exit code;
class ConfigException extends ApplicationException {
  ConfigException(super.message);
}

/// An class for exceptions where a package could not be found in a [Source].
///
/// The source is responsible for wrapping its internal exceptions in this so
/// that other code in pub can use this to show a more detailed explanation of
/// why the package was being requested.
class PackageNotFoundException extends WrappedException {
  PackageNotFoundException(
    String message, {
    Object? innerError,
    StackTrace? innerTrace,
    this.hint,
  }) : super(message, innerError, innerTrace);

  /// A hint indicating an action the user could take to resolve this problem.
  ///
  /// This will be printed after the package resolution conflict.
  final String? hint;

  @override
  String toString() => 'Package not available ($message).';
}

/// Returns whether [error] is a user-facing error object.
///
/// This includes both [ApplicationException] and any dart:io errors.
bool isUserFacingException(Object error) {
  return error is ApplicationException ||
      error is IsolateSpawnException ||
      error is IOException ||
      error is http.ClientException ||
      error is YamlException ||
      error is UsageException;
}

/// An exception thrown when parsing a `pubspec.yaml` or a `pubspec.lock`.
///
/// These exceptions are often thrown lazily while accessing pubspec properties.
///
/// By being an [ApplicationException] this will not trigger a stack-trace on
/// normal operations.
///
/// Works as a [SourceSpanFormatException], but can contain more context:
/// An optional [explanation] that explains the operation that failed.
/// An optional [hint] that gives suggestions how to proceed.
class SourceSpanApplicationException extends SourceSpanFormatException
    implements ApplicationException {
  SourceSpanApplicationException(
    super.message,
    super.span, {
    this.hint,
    this.explanation,
  });
  final String? explanation;
  final String? hint;

  @override
  String toString({Object? color}) {
    return [
      if (explanation != null) explanation,
      if (span == null)
        message
      else
        'Error on ${span?.message(message, color: color)}',
      if (hint != null) hint,
    ].join('\n\n');
  }
}
