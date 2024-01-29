import 'dart:async';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:localhost/localhost.dart';
import 'package:localhost/src/darwin/bonjour.g.dart';
import 'package:logging/logging.dart';

const int _kDNSFlagsNone = 0;
const int _kDNSAllInterfaces = 0;

final class LocalClientDarwin implements LocalClient {
  static final Logger logger = Logger('LocalClient');
  static final BonjourFramework _bonjour =
      BonjourFramework(DynamicLibrary.process());

  final Map<LocalServiceId, LocalService> _cache = {};

  @override
  Stream<LocalService> discover({
    required String type,
    String? domain,
  }) {
    DNSServiceRef? sdRef;
    void cleanUp() {
      if (sdRef != null) {
        _bonjour.DNSServiceRefDeallocate(sdRef!);
        sdRef = null;
      }
    }

    final controller = StreamController<LocalService>(onCancel: cleanUp);
    void closeWithError(String message) {
      controller
        ..addError(LocalException(message))
        ..close();
    }

    late final NativeCallable<DNSServiceBrowseReplyFunction> browseCallback;
    void onCompleteBrowse(
      DNSServiceRef sdRef,
      int flags,
      int interfaceIndex,
      int errorCode,
      Pointer<Char> serviceName,
      Pointer<Char> regtype,
      Pointer<Char> replyDomain,
      Pointer<Void> context,
    ) {
      try {
        final errorMessage = _dnsErrorString(errorCode);
        logger.finest(
          'Browse completed with flags="${_dnsFlagsString(flags)}", '
          'errorCode="$errorMessage"',
        );
        if (errorCode != kDNSServiceErr_NoError) {
          logger.finest(
            'DNSServiceBrowse completed with error: $errorMessage',
          );
          return closeWithError(
            'An error occurred browsing for the service',
          );
        }
        final name = serviceName.cast<Utf8>().toDartString();
        final type = regtype.cast<Utf8>().toDartString();
        final domain = replyDomain.cast<Utf8>().toDartString();
        final id = LocalServiceId(name: name, type: type, domain: domain);
        if (flags & kDNSServiceFlagsAdd != 0) {
          logger.finest('Service added: $id');
          _cache[id] = LocalService(
            name: name,
            type: type,
            domain: domain,
            host: '',
            port: 0,
          );
          controller.add(_cache[id]!);
        } else {
          logger.finest('Service removed: $id');
          _cache.remove(id);
        }
      } finally {
        if (flags & kDNSServiceFlagsMoreComing == 0 ||
            errorCode != kDNSServiceErr_NoError) {
          logger.finest('Service discovery complete');
          browseCallback.close();
          controller.close();
          cleanUp();
        }
      }
    }

    browseCallback = NativeCallable.listener(onCompleteBrowse);

    using((arena) {
      final sdRefPtr = arena<DNSServiceRef>();
      // https://developer.apple.com/documentation/dnssd/1804742-dnsservicebrowse
      // https://developer.apple.com/library/archive/documentation/Networking/Conceptual/dns_discovery_api/Articles/browse.html#//apple_ref/doc/uid/TP40002486-SW1
      final browseRet = _bonjour.DNSServiceBrowse(
        sdRefPtr, // sdRef
        _kDNSFlagsNone, // flags
        _kDNSAllInterfaces, // interfaceIndex
        type.toNativeUtf8(allocator: arena).cast(), // regtype
        domain?.toNativeUtf8(allocator: arena).cast() ?? nullptr, // domain
        browseCallback.nativeFunction, // callBack
        nullptr, // context
      );
      if (browseRet != kDNSServiceErr_NoError) {
        final errorMessage = _dnsErrorString(browseRet);
        logger.finest(
          'DNSServiceBrowse failed with error: $errorMessage',
        );
        return closeWithError(
          'An error occurred browsing for the service',
        );
      }
      sdRef = sdRefPtr.value;
      assert(sdRef != nullptr);
      final setQueueRet = _bonjour.DNSServiceSetDispatchQueue(
        sdRef!,
        _bonjour.dispatch_get_current_queue(),
      );
      if (setQueueRet != kDNSServiceErr_NoError) {
        final errorMessage = _dnsErrorString(setQueueRet);
        logger.finest(
          'DNSServiceSetDispatchQueue failed with error: $errorMessage',
        );
        return closeWithError(
          'An error occurred browsing for the service',
        );
      }
    });

    return controller.stream;
  }

  @override
  Future<LocalService?> find({
    required String type,
    required String name,
    String? domain,
  }) async {
    return discover(type: type, domain: domain)
        .cast<LocalService?>()
        .firstWhere(
          (service) => service?.name == name,
          orElse: () => null,
        );
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
