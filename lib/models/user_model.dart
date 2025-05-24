class UserModel {
  final String id;
  final String name;
  final int age;
  final String game;
  final String classType;
  final String imageUrl;

  // ✅ 추가 필드들
  final String? bio;
  final bool isOnline;
  final String? location;
  final bool voiceChat;
  final List<String> favoriteGames;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.age,
    required this.game,
    required this.classType,
    required this.imageUrl,
    this.bio,
    this.isOnline = false,
    this.location,
    this.voiceChat = false,
    this.favoriteGames = const [],
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}
