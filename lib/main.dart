import 'package:MatchQuest/screens/auth/login_screen.dart';
import 'package:MatchQuest/screens/main_tab.dart';
import 'package:MatchQuest/viewmodels/category_match_view_model.dart';
import 'package:MatchQuest/viewmodels/chat_view_model.dart';
import 'package:MatchQuest/viewmodels/liked_me_view_model.dart';
import 'package:MatchQuest/viewmodels/matching_view_model.dart';
import 'package:MatchQuest/viewmodels/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'package:MatchQuest/viewmodels/profile_view_model.dart';
import 'package:MatchQuest/viewmodels/matching_view_model.dart';
import 'package:MatchQuest/viewmodels/liked_me_view_model.dart';
import 'package:MatchQuest/viewmodels/chat_view_model.dart';
import 'package:MatchQuest/viewmodels/category_match_view_model.dart';
import 'package:MatchQuest/screens/auth/login_screen.dart';
import 'package:MatchQuest/screens/main_tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color primaryColor = Color(0xFFF44336);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MatchingViewModel()),
        ChangeNotifierProvider(create: (_) => LikedMeViewModel()),
        ChangeNotifierProvider(create: (_) => ChatViewModel()),
        ChangeNotifierProvider(create: (_) => CategoryMatchViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MatchQuest',
        theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: primaryColor,
            brightness: Brightness.light,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
          ),
          tabBarTheme: TabBarTheme(
            labelColor: primaryColor,
            unselectedLabelColor: Colors.grey,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: primaryColor, width: 2),
            ),
          ),
          switchTheme: SwitchThemeData(
            thumbColor: MaterialStateProperty.all(primaryColor),
            trackColor: MaterialStateProperty.all(primaryColor.withOpacity(0.5)),
          ),
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.all(primaryColor),
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: primaryColor,
            selectionColor: primaryColor.withOpacity(0.3),
            selectionHandleColor: primaryColor,
          ),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _checkLoginStatus(context);
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  void _checkLoginStatus(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    final profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);

    await Future.delayed(const Duration(milliseconds: 500)); // 살짝 지연

    if (user != null) {
      profileViewModel.setUserInfo(
        name: user.displayName ?? '',
        email: user.email ?? '',
        photoUrl: user.photoURL,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainTab()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }
}
