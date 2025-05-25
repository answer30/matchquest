import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:MatchQuest/screens/main_tab.dart';
import 'package:MatchQuest/viewmodels/profile_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const Color primaryColor = Color(0xFFF44336); // 메인 레드색

  void _signInWithGoogle(BuildContext context) async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;

      if (user != null) {
        final profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);
        profileViewModel.setUserInfo(
          name: user.displayName ?? '',
          email: user.email ?? '',
          photoUrl: user.photoURL,
          age: 20,
          favoriteGame: '로스트아크',
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainTab()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('로그인 실패: $e')),
      );
    }
  }

  void _onAppleLoginPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("알림"),
        content: const Text("애플 로그인은 현재 구현 중입니다."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("확인"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor, // ✅ 배경색 레드
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon/main.png',
                  height: 120,
                ),
                const SizedBox(height: 24),
                const Text(
                  "MatchQuest",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // ✅ 텍스트 색 흰색
                  ),
                ),
                const SizedBox(height: 48),
                _buildLoginButton(
                  context,
                  iconPath: "assets/icons/google.png",
                  text: "구글로 로그인",
                  backgroundColor: Colors.white,
                  textColor: primaryColor,
                  borderColor: Colors.transparent,
                  onPressed: () => _signInWithGoogle(context),
                ),
                const SizedBox(height: 16),
                _buildLoginButton(
                  context,
                  iconPath: "assets/icons/apple.png",
                  text: "애플로 로그인",
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  borderColor: Colors.transparent,
                  onPressed: () => _onAppleLoginPressed(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(
      BuildContext context, {
        required String iconPath,
        required String text,
        required Color backgroundColor,
        required Color textColor,
        required Color borderColor,
        required VoidCallback onPressed,
      }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 52),
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        side: BorderSide(color: borderColor, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 24),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
