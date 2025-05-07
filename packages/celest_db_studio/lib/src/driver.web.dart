import 'package:celest_db_studio/src/driver.dart';

abstract final class DriverImpl {
  static Future<Driver> connect(Uri uri, {String? authToken}) async {
    throw UnimplementedError('DriverImpl.connect() is not implemented on Web');
  }
}
