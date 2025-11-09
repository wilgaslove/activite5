class Redacteur {
  int? id;
  String nom;
  String prenom;
  String email;

  Redacteur({this.id, required this.nom, required this.prenom, required this.email});

  // Convertir un objet en Map pour SQLite
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'nom': nom,
      'prenom': prenom,
      'email': email,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  // Créer un objet à partir d’un Map (SQLite → objet)
  factory Redacteur.fromMap(Map<String, dynamic> map) {
    return Redacteur(
      id: map['id'],
      nom: map['nom'],
      prenom: map['prenom'],
      email: map['email'],
    );
  }
}
