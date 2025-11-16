class HealthCenterModel {
  final String id;
  final String nom;
  final String adresse;
  final double latitude;
  final double longitude;
  final String? specialite;
  final String? telephone;

  HealthCenterModel({
    required this.id,
    required this.nom,
    required this.adresse,
    required this.latitude,
    required this.longitude,
    this.specialite,
    this.telephone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'adresse': adresse,
      'latitude': latitude,
      'longitude': longitude,
      'specialite': specialite,
      'telephone': telephone,
    };
  }

  factory HealthCenterModel.fromMap(Map<String, dynamic> map) {
    return HealthCenterModel(
      id: map['id'] ?? '',
      nom: map['nom'] ?? '',
      adresse: map['adresse'] ?? '',
      latitude: (map['latitude'] ?? 0.0).toDouble(),
      longitude: (map['longitude'] ?? 0.0).toDouble(),
      specialite: map['specialite'],
      telephone: map['telephone'],
    );
  }
}