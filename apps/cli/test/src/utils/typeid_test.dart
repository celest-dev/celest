import 'package:celest_cli/src/utils/typeid.dart';
import 'package:celest_core/celest_core.dart';
import 'package:test/test.dart';

void main() {
  test('TypeId', () {
    final id = typeId<User>('user');
    print(id);
  });
}
