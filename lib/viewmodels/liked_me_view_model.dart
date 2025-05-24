import 'package:flutter/material.dart';
import '../models/user_model.dart';

class LikedMeViewModel extends ChangeNotifier {
  final List<UserModel> likedUsers = [
    UserModel(
      id: '5',
      name: '좋아한유저1',
      age: 24,
      game: '롤',
      classType: '원딜',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    UserModel(
      id: '6',
      name: '좋아한유저2',
      age: 28,
      game: '발로란트',
      classType: '서포터',
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];
}
