import 'package:flutter/material.dart';
import '../models/user_model.dart';

class CategoryMatchViewModel extends ChangeNotifier {
  final List<String> categories = ['롤', '배그', '오버워치', '발로란트'];
  String selectedCategory = '롤';

  final List<UserModel> allUsers = [
    UserModel(
      id: '1',
      name: '유저1',
      age: 23,
      game: '롤',
      classType: '서폿',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    UserModel(
      id: '2',
      name: '유저2',
      age: 25,
      game: '배그',
      classType: '저격수',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    UserModel(
      id: '3',
      name: '유저3',
      age: 21,
      game: '오버워치',
      classType: '탱커',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    UserModel(
      id: '4',
      name: '유저4',
      age: 26,
      game: '발로란트',
      classType: '듀얼리스트',
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  List<UserModel> get filteredUsers =>
      allUsers.where((user) => user.game == selectedCategory).toList();

  void selectCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }
}
