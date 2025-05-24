import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:MatchQuest/viewmodels/liked_me_view_model.dart';
import 'package:MatchQuest/widgets/profile_card.dart';

class LikedMeScreen extends StatelessWidget {
  const LikedMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final likedViewModel = Provider.of<LikedMeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('나를 좋아한 유저'),
      ),
      body: ListView.builder(
        itemCount: likedViewModel.likedUsers.length,
        itemBuilder: (context, index) {
          final user = likedViewModel.likedUsers[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProfileCard(user: user),
          );
        },
      ),
    );
  }
}
