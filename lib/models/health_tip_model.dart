class HealthTipModel {
  final String id;
  final String titre;
  final String description;
  final String categorie;

  HealthTipModel({
    required this.id,
    required this.titre,
    required this.description,
    required this.categorie,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titre': titre,
      'description': description,
      'categorie': categorie,
    };
  }

  factory HealthTipModel.fromMap(Map<String, dynamic> map) {
    return HealthTipModel(
      id: map['id'] ?? '',
      titre: map['titre'] ?? '',
      description: map['description'] ?? '',
      categorie: map['categorie'] ?? '',
    );
  }
}