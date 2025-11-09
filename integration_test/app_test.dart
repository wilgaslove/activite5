import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mon_projet/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Test du calcul de la moyenne', (tester) async {
    await tester.pumpWidget(MonApplication());
    await tester.tap(find.text('Calculer la moyenne de la classe'));
    await tester.pumpAndSettle();

    expect(find.textContaining('La moyenne des étudiants est'), findsOneWidget);
  });
}
