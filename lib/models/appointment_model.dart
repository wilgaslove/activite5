class AppointmentModel {
  final String id;
  final String userId;
  final String centre;
  final DateTime date;
  final String statut;

  AppointmentModel({
    required this.id,
    required this.userId,
    required this.centre,
    required this.date,
    required this.statut,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'centre': centre,
      'date': date.toIso8601String(),
      'statut': statut,
    };
  }

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      centre: map['centre'] ?? '',
      date: DateTime.parse(map['date']),
      statut: map['statut'] ?? '',
    );
  }
}