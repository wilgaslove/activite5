import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mon_projet/main.dart';

void main() {
  testWidgets('Affiche la liste des étudiants', (WidgetTester tester) async {
    await tester.pumpWidget(MonApplication());

    expect(find.text('Liste des étudiants'), findsOneWidget);
    expect(find.text('Alice'), findsOneWidget);
    expect(find.text('Bob'), findsOneWidget);
  });
}
