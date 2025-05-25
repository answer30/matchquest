import 'package:flutter/material.dart';
import 'package:MatchQuest/models/user_model.dart';

class ProfileCard extends StatelessWidget {
  final UserModel user;

  const ProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(user.imageUrl, height: 200, fit: BoxFit.cover),
          const SizedBox(height: 16),
          Text('${user.name}, ${user.age}', style: const TextStyle(fontSize: 24)),
          Text('${user.game} / ${user.classType}', style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
