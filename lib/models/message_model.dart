class MessageModel {
  final String id;
  final String senderId;
  final String receiverId;
  final String contenu;
  final DateTime timestamp;
  final bool isImage;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.contenu,
    required this.timestamp,
    this.isImage = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'contenu': contenu,
      'timestamp': timestamp.toIso8601String(),
      'isImage': isImage,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] ?? '',
      senderId: map['senderId'] ?? '',
      receiverId: map['receiverId'] ?? '',
      contenu: map['contenu'] ?? '',
      timestamp: DateTime.parse(map['timestamp']),
      isImage: map['isImage'] ?? false,
    );
  }
}