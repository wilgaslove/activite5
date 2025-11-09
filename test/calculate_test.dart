import 'package:flutter_test/flutter_test.dart';
import 'package:mon_projet/main.dart';

void main() {
  test('Calcule correctement la moyenne de la classe', () {
    final etudiants = [
      Etudiant(nom: 'A', moyenne: 10),
      Etudiant(nom: 'B', moyenne: 20),
    ];
    final page = PageAccueil();
    final moyenne = page.calculateMoyenne(etudiants);
    expect(moyenne, 15);
  });
}
