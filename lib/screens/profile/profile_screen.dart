import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:MatchQuest/viewmodels/profile_view_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProfileViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('내 프로필'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: viewModel.enableEditing,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: ClipOval(
                child: viewModel.imageUrl != null
                    ? Image.network(
                  viewModel.imageUrl!,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                )
                    : const Icon(Icons.account_circle, size: 150),
              ),
            ),
            const SizedBox(height: 20),

            // 수정 폼을 카드보다 위로 올림
            if (viewModel.isEditing)
              Column(
                children: [
                  TextField(
                    controller: viewModel.nameController,
                    decoration: const InputDecoration(labelText: '닉네임'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: viewModel.ageController,
                    decoration: const InputDecoration(labelText: '나이'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: viewModel.favoriteGameController,
                    decoration: const InputDecoration(labelText: '주로하는 게임'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.saveProfile();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("프로필이 저장되었습니다")),
                      );
                    },
                    child: const Text('저장'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),

            _buildProfileCard(context, viewModel),

            const SizedBox(height: 30),
            _buildSettingsTile("💰 캐쉬 현황", "현재 보유 캐쉬: 0캐쉬"),
            _buildSettingsTile("🛠️ 계정 설정", "비밀번호, 이메일 등 관리"),
            _buildSettingsTile("🌍 소셜 디스커버리 설정", "다른 유저에게 나를 표시"),
            _buildSettingsTile("📍 상대방과의 거리", "50km 이내"),
            _buildSettingsTile("🚻 보고싶은 성별", "모두"),
            _buildSettingsTile("🎂 상대방의 나이", "20세 ~ 35세"),
            _buildSettingsTile("🖼️ 프로필 최소 사진", "3장 이상"),
            _buildSettingsTile("⭐ 관심사", "게임, 음악, 영화"),

            const SizedBox(height: 30),
            if (!viewModel.isEditing)
              ElevatedButton(
                onPressed: viewModel.enableEditing,
                child: const Text('프로필 수정'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context, ProfileViewModel viewModel) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              viewModel.name ?? '이름 없음',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${viewModel.age ?? '나이 없음'}세',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              viewModel.favoriteGame ?? '주로하는 게임 없음',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile(String title, String subtitle) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // 설정 상세 페이지로 이동하도록 구성 가능
      },
    );
  }
}
