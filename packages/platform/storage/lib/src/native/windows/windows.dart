import 'package:windows_applicationmodel/windows_applicationmodel.dart';

final windows = WindowsCommon._();

final class WindowsCommon {
  WindowsCommon._();

  late final String? applicationId = Package.current?.id?.fullName;
}
