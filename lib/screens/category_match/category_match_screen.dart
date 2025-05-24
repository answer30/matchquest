import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:MatchQuest/viewmodels/category_match_view_model.dart';
import 'package:MatchQuest/widgets/profile_card.dart';

class CategoryMatchScreen extends StatelessWidget {
  const CategoryMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CategoryMatchViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('게임 카테고리로 매칭'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          // 카테고리 선택
          Wrap(
            spacing: 8,
            children: viewModel.categories.map((category) {
              final isSelected = viewModel.selectedCategory == category;
              return ChoiceChip(
                label: Text(category),
                selected: isSelected,
                onSelected: (_) => viewModel.selectCategory(category),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.filteredUsers.length,
              itemBuilder: (context, index) {
                final user = viewModel.filteredUsers[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ProfileCard(user: user),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
