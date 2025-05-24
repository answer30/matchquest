import 'package:MatchQuest/screens/category_match/category_match_screen.dart';
import 'package:MatchQuest/screens/chat/chat_screen.dart';
import 'package:MatchQuest/screens/liked_me/liked_me_screen.dart';
import 'package:MatchQuest/screens/matching/matching_screen.dart';
import 'package:MatchQuest/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:MatchQuest/screens/matching/matching_screen.dart';
import 'package:MatchQuest/screens/category_match/category_match_screen.dart';
import 'package:MatchQuest/screens/liked_me/liked_me_screen.dart';
import 'package:MatchQuest/screens/chat/chat_screen.dart';
import 'package:MatchQuest/screens/profile/profile_screen.dart';

class MainTab extends StatefulWidget {
  const MainTab({super.key});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    MatchingScreen(),
    CategoryMatchScreen(),
    LikedMeScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}
