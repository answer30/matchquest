import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  // 사용자 정보
  String? name;
  int? age;
  String? favoriteGame;
  String? email;
  String? imageUrl;

  // 수정 모드 여부
  bool isEditing = false;

  // 텍스트 컨트롤러
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController favoriteGameController = TextEditingController();

  void setUserInfo({
    required String name,
    required String email,
    String? photoUrl,
    int? age,
    String? favoriteGame,
  }) {
    this.name = name;
    this.email = email;
    this.imageUrl = photoUrl;
    this.age = age;
    this.favoriteGame = favoriteGame;

    nameController.text = name;
    ageController.text = age?.toString() ?? '';
    favoriteGameController.text = favoriteGame ?? '';

    notifyListeners();
  }

  void enableEditing() {
    isEditing = true;
    notifyListeners();
  }

  void saveProfile() {
    name = nameController.text;
    age = int.tryParse(ageController.text);
    favoriteGame = favoriteGameController.text;
    isEditing = false;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    favoriteGameController.dispose();
    super.dispose();
  }
}
