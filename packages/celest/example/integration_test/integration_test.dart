import 'package:example_app/main.dart';
import 'package:example_client/example_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('calls Celest API', (tester) async {
    celest.init();
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();
    expect(find.text('Hello, Celest!'), findsOne);
  });
}
