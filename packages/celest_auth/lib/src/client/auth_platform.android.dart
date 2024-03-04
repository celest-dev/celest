import 'dart:async';

import 'package:celest_auth/src/client/auth_platform_impl.vm.dart';
import 'package:celest_auth/src/platform/android/jni_bindings.ffi.dart'
    as android show Uri;
import 'package:celest_auth/src/platform/android/jni_bindings.ffi.dart'
    hide Uri, Exception;
import 'package:jni/jni.dart';
import 'package:logging/logging.dart';

final class AuthPlatformAndroid extends AuthPlatformImpl {
  AuthPlatformAndroid({
    required super.protocol,
  }) : super.base() {
    Jni.initDLApi();
    _celestAuth.init(_applicationContext);
  }

  static final Logger _logger = Logger('Celest.AuthClientAndroid');

  /// A code to identify the result of the custom tabs request.
  static const int _customTabsRequestCode = 7777;

  late final CelestAuth _celestAuth = CelestAuth();

  late final Activity _mainActivity =
      Activity.fromRef(Jni.getCurrentActivity());
  late final Context _applicationContext =
      Context.fromRef(Jni.getCachedApplicationContext());

  /// The application ID of the installed package which can handle custom tabs,
  /// typically a browser like Chrome.
  ///
  /// Adapted from: https://github.com/GoogleChrome/custom-tabs-client/blob/f55501961a211a92eacbe3c2f15d7c58c19c8ef9/shared/src/main/java/org/chromium/customtabsclient/shared/CustomTabsHelper.java#L64
  String? get browserPackageName {
    final packageManager = _applicationContext.getPackageManager();
    final browserIntent = Intent()
      ..setAction(Intent.ACTION_VIEW.toJString())
      ..addCategory(Intent.CATEGORY_BROWSABLE.toJString())
      ..setData(android.Uri.parse('https://google.com'.toJString()));
    final defaultBrowserHandler = packageManager.resolveActivity1(
      browserIntent,
      PackageManager_ResolveInfoFlags.of(PackageManager.MATCH_DEFAULT_ONLY),
    );
    final defaultBroswerPackageName = defaultBrowserHandler.resolvedPackageName;

    // Get all apps that can handle browser intents.
    final resolvedActivityList = packageManager.queryIntentActivities1(
      browserIntent,
      PackageManager_ResolveInfoFlags.of(PackageManager.MATCH_ALL),
    );
    final packagesSupportingCustomTabs = <String>[];
    for (final info in resolvedActivityList) {
      final infoPackageName = info.resolvedPackageName;
      assert(infoPackageName != null);
      final customTabsIntent = Intent()
        ..setAction(CustomTabsService.ACTION_CUSTOM_TABS_CONNECTION.toJString())
        ..setPackage(infoPackageName!.toJString());
      // Check if the package also resolves the Custom Tabs service.
      final resolvedService = packageManager.resolveService1(
        customTabsIntent,
        PackageManager_ResolveInfoFlags.of(0),
      );
      if (resolvedService.resolvedPackageName case final resolvedPackage?) {
        packagesSupportingCustomTabs.add(resolvedPackage);
      }
    }
    _logger
      ..fine('defaultBroswerPackageName: $defaultBroswerPackageName')
      ..fine('packagesSupportingCustomTabs: $packagesSupportingCustomTabs');
    if (packagesSupportingCustomTabs.isEmpty) {
      return null;
    }
    if (defaultBroswerPackageName != null &&
        packagesSupportingCustomTabs.contains(defaultBroswerPackageName)) {
      return defaultBroswerPackageName;
    }
    return packagesSupportingCustomTabs.first;
  }

  Future<void> _launchCustomTabsIntent({
    required Uri uri,
  }) async {
    final intent = CustomTabsIntent_Builder()
        .setShareState(CustomTabsIntent.SHARE_STATE_OFF)
        .build();
    final useBrowserPackage = browserPackageName;
    if (useBrowserPackage == null) {
      throw Exception('No browser supporting custom tabs found');
    }
    _logger.fine('Using browser package: $useBrowserPackage');
    final thisApplicationPackage = _applicationContext
        .getPackageName()
        .toDartString(releaseOriginal: true);
    intent.intent
      ..setPackage(useBrowserPackage.toJString())
      ..putExtra12(
        Intent.EXTRA_REFERRER.toJString(),
        android.Uri.parse('android-app://$thisApplicationPackage'.toJString()),
      )
      ..setData(android.Uri.parse(uri.toString().toJString()));

    // Should be launched from the main activity and not the application context so that
    // FLAG_ACTIVITY_NEW_TASK does not have to be used which would always launch the tab
    // in a separate process instead of an embedded tab.
    _mainActivity.startActivityForResult(intent.intent, _customTabsRequestCode);
  }

  Future<Map<String, String>> startSignIn({
    required Uri uri,
    String? callbackUrlScheme,
  }) async {
    throw UnimplementedError();
  }
}

extension on ResolveInfo {
  String? get resolvedPackageName {
    if (isNull) return null;
    if (activityInfo.isNull) return null;
    return PackageItemInfo.fromRef(activityInfo.reference)
        .packageName
        .toDartString(releaseOriginal: true);
  }
}
