import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:localhost/src/darwin/bonjour.ffi.dart';
import 'package:localhost/src/local_host.dart';
import 'package:logging/logging.dart';

int htons(int host) {
  return Uint16List.fromList([host])
      .buffer
      .asByteData()
      .getUint16(0, Endian.big);
}

final class LocalHostDarwin extends LocalHost {
  LocalHostDarwin({
    required super.projectName,
    required super.localPort,
  }) : super.base();

  static final _logger = Logger('MacOsLocalHost');

  var _started = false;
  DNSServiceRef? _serviceRef;

  @override
  Future<void> start() => using((arena) async {
        _logger.fine('Starting mDNS service');
        final serviceRef = arena<DNSServiceRef>();

        final completedRegistration = Completer<DNSServiceRef>();
        late final NativeCallable<DNSServiceRegisterReplyFunction>
            onCompleteRegistrationCallback;
        void onCompleteRegistration(
          DNSServiceRef sdRef,
          int flags,
          int errorCode,
          Pointer<Char> namePtr,
          Pointer<Char> regtypePtr,
          Pointer<Char> domainPtr,
          Pointer<Void> context,
        ) {
          _logger.finest(
            'mDNS registration callback called with flags="${_dnsFlagsString(flags)}", '
            'errorCode="${_dnsErrorString(errorCode)}"',
          );
          // https://developer.apple.com/documentation/dnssd/dnsserviceregisterreply
          final successfullyRegistered = errorCode == kDNSServiceErr_NoError &&
              flags & kDNSServiceFlagsAdd != 0;
          if (successfullyRegistered) {
            assert(sdRef != nullptr, 'Should be set if successful');
            _logger.fine('mDNS service successfully registered');
            completedRegistration.complete(sdRef);
          } else {
            _logger.fine('Failed to register mDNS service');
            completedRegistration
                .completeError(StateError('Failed to register mDNS service'));
          }
          onCompleteRegistrationCallback.close();
        }

        onCompleteRegistrationCallback =
            NativeCallable.listener(onCompleteRegistration);

        // https://developer.apple.com/documentation/dnssd/1804733-dnsserviceregister
        final registerRes = DNSServiceRegister(
          serviceRef, // sdRef
          kDNSServiceFlagsDefault | kDNSServiceFlagsNoAutoRename, // flags
          0, // interfaceIndex
          projectName.toNativeUtf8(allocator: arena).cast(), // name
          '_celest._tcp'.toNativeUtf8(allocator: arena).cast(), // regtype
          nullptr, // domain
          nullptr, // host
          htons(localPort), // port
          0, // txtLen
          nullptr, // txtRecord
          onCompleteRegistrationCallback.nativeFunction, // callBack
          nullptr, // context
        );
        if (registerRes != kDNSServiceErr_NoError) {
          _logger.fine(
            'Failed to start mDNS service: ${_dnsErrorString(registerRes)}',
          );
          throw StateError('Failed to start mDNS service');
        }
        _logger.fine('Waiting for mDNS service registration');
        Timer.run(() {
          _logger.finest('Processing mDNS service registration');
          final processResult = DNSServiceProcessResult(serviceRef.value);
          _logger.finest('Processed mDNS service registration: $processResult');
          if (processResult != kDNSServiceErr_NoError) {
            _logger.fine(
              'Failed to process mDNS service registration: ${_dnsErrorString(processResult)}',
            );
            if (!completedRegistration.isCompleted) {
              completedRegistration.completeError(
                StateError('Failed to process mDNS service registration'),
              );
            }
          }
        });
        _serviceRef = await completedRegistration.future;
        _started = true;
        _logger.fine('mDNS service started');
      });

  @override
  Future<void> stop() async {
    if (!_started) return;
    _logger.fine('Stopping mDNS service');
    _started = false;
    assert(_serviceRef != null, 'Should be set if started');
    try {
      DNSServiceRefDeallocate(_serviceRef!);
    } finally {
      _serviceRef = null;
    }
  }
}

String _dnsFlagsString(int flags) {
  final flagStrings = <String>[];
  if (flags & kDNSServiceFlagsMoreComing != 0) {
    flagStrings.add('More coming');
  }
  if (flags & kDNSServiceFlagsAdd != 0) {
    flagStrings.add('Add');
  }
  if (flags & kDNSServiceFlagsDefault != 0) {
    flagStrings.add('Default');
  }
  if (flags & kDNSServiceFlagsNoAutoRename != 0) {
    flagStrings.add('No auto rename');
  }
  if (flags & kDNSServiceFlagsShared != 0) {
    flagStrings.add('Shared');
  }
  if (flags & kDNSServiceFlagsUnique != 0) {
    flagStrings.add('Unique');
  }
  if (flags & kDNSServiceFlagsBrowseDomains != 0) {
    flagStrings.add('Browse domains');
  }
  if (flags & kDNSServiceFlagsRegistrationDomains != 0) {
    flagStrings.add('Registration domains');
  }
  if (flags & kDNSServiceFlagsLongLivedQuery != 0) {
    flagStrings.add('Long lived query');
  }
  if (flags & kDNSServiceFlagsAllowRemoteQuery != 0) {
    flagStrings.add('Allow remote query');
  }
  if (flags & kDNSServiceFlagsForceMulticast != 0) {
    flagStrings.add('Force multicast');
  }
  if (flags & kDNSServiceFlagsForce != 0) {
    flagStrings.add('Force');
  }
  if (flags & kDNSServiceFlagsReturnIntermediates != 0) {
    flagStrings.add('Return intermediates');
  }
  if (flags & kDNSServiceFlagsShareConnection != 0) {
    flagStrings.add('Share connection');
  }
  if (flags & kDNSServiceFlagsSuppressUnusable != 0) {
    flagStrings.add('Suppress unusable');
  }
  if (flags & kDNSServiceFlagsWakeOnResolve != 0) {
    flagStrings.add('Wake on resolve');
  }
  if (flags & kDNSServiceFlagsBackgroundTrafficClass != 0) {
    flagStrings.add('Background traffic class');
  }
  if (flags & kDNSServiceFlagsIncludeAWDL != 0) {
    flagStrings.add('Include AWDL');
  }
  if (flags & kDNSServiceFlagsValidate != 0) {
    flagStrings.add('Validate');
  }
  if (flags & kDNSServiceFlagsWakeOnlyService != 0) {
    flagStrings.add('Wake only service');
  }
  if (flags & kDNSServiceFlagsThresholdOne != 0) {
    flagStrings.add('Threshold one');
  }
  if (flags & kDNSServiceFlagsThresholdFinder != 0) {
    flagStrings.add('Threshold finder');
  }
  if (flags & kDNSServiceFlagsThresholdReached != 0) {
    flagStrings.add('Threshold reached');
  }
  return flagStrings.join(', ');
}

String _dnsErrorString(int errorCode) {
  return switch (errorCode) {
    kDNSServiceErr_NoError => '',
    kDNSServiceErr_NoMemory => 'No memory',
    kDNSServiceErr_BadParam => 'Bad param',
    kDNSServiceErr_BadReference => 'Bad reference',
    kDNSServiceErr_BadState => 'Bad state',
    kDNSServiceErr_BadFlags => 'Bad flags',
    kDNSServiceErr_Unsupported => 'Unsupported',
    kDNSServiceErr_NotInitialized => 'Not initialized',
    kDNSServiceErr_AlreadyRegistered => 'Already registered',
    kDNSServiceErr_NameConflict => 'Name conflict',
    kDNSServiceErr_Invalid => 'Invalid',
    kDNSServiceErr_Firewall => 'Firewall',
    kDNSServiceErr_Incompatible => 'Incompatible',
    kDNSServiceErr_BadInterfaceIndex => 'Bad interface index',
    kDNSServiceErr_Refused => 'Refused',
    kDNSServiceErr_NoSuchRecord => 'No such record',
    kDNSServiceErr_NoAuth => 'No auth',
    kDNSServiceErr_NoSuchKey => 'No such key',
    kDNSServiceErr_NATTraversal => 'NAT traversal',
    kDNSServiceErr_DoubleNAT => 'Double NAT',
    kDNSServiceErr_BadTime => 'Bad time',
    kDNSServiceErr_BadSig => 'Bad sig',
    kDNSServiceErr_BadKey => 'Bad key',
    kDNSServiceErr_Transient => 'Transient',
    kDNSServiceErr_ServiceNotRunning => 'Service not running',
    kDNSServiceErr_NATPortMappingUnsupported => 'NAT port mapping unsupported',
    kDNSServiceErr_NATPortMappingDisabled => 'NAT port mapping disabled',
    kDNSServiceErr_NoRouter => 'No router',
    kDNSServiceErr_PollingMode => 'Polling mode',
    kDNSServiceErr_Timeout => 'Timeout',
    kDNSServiceErr_DefunctConnection => 'Defunct connection',
    _ => 'Unknown error',
  };
}

final class MdnsException implements Exception {
  const MdnsException(this.message);

  final String message;

  @override
  String toString() => 'MdnsException: $message';
}
