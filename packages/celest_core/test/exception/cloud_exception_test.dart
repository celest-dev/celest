import 'package:celest_core/celest_core.dart';
import 'package:test/test.dart';

void main() {
  // Tests that cloud exceptions can be created and thrown on VM/Web.
  //
  // We need to make sure that no `dart:io` imports are accidentally added.
  test('CloudException', () {
    const exception = CloudException.badRequest();
    expect(exception, isA<BadRequestException>());
  });
}
