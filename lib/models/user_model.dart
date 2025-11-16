class UserModel {
  final String id;
  final String nom;
  final String email;
  final String role;
  final String? photoUrl;
  final String? telephone;

  UserModel({
    required this.id,
    required this.nom,
    required this.email,
    required this.role,
    this.photoUrl,
    this.telephone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'email': email,
      'role': role,
      'photoUrl': photoUrl,
      'telephone': telephone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      nom: map['nom'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
      photoUrl: map['photoUrl'],
      telephone: map['telephone'],
    );
  }
}