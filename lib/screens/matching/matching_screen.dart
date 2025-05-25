import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:MatchQuest/viewmodels/matching_view_model.dart';
import 'package:MatchQuest/widgets/profile_card.dart';

class MatchingScreen extends StatefulWidget {
  const MatchingScreen({super.key});

  @override
  State<MatchingScreen> createState() => _MatchingScreenState();
}

class _MatchingScreenState extends State<MatchingScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Consumer<MatchingViewModel>(
      builder: (context, viewModel, child) {
        final users = viewModel.users;

        return Scaffold(
          appBar: AppBar(
            title: const Text('매칭'),
            centerTitle: true,
          ),
          body: users.isEmpty
              ? const Center(child: Text('매칭할 유저가 없습니다.'))
              : Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: users.length,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ProfileCard(user: user);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.replay, color: Colors.orange, size: 32),
                      onPressed: () {
                        // ✅ 되돌리기 기능
                        viewModel.undoLastAction();
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.clear, color: Colors.red, size: 32),
                      onPressed: () {
                        viewModel.dislikeCurrentUser();
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.pink, size: 32),
                      onPressed: () {
                        viewModel.likeCurrentUser();
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.star, color: Colors.blueAccent, size: 32),
                      onPressed: () {
                        viewModel.superLikeCurrentUser();
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
