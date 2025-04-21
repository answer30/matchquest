# matchquest


## 앱구조

lib/
├── main.dart
├── app.dart                       # 앱 진입 설정 (MaterialApp)
├── viewmodels/
│   ├── matching_view_model.dart
│   ├── category_match_view_model.dart
│   ├── liked_me_view_model.dart
│   ├── chat_view_model.dart
│   └── profile_view_model.dart
├── screens/
│   └── main_tab.dart             # BottomNavigation scaffold
│   └── matching/
│       └── matching_screen.dart
│   └── category_match/
│       └── category_match_screen.dart
│   └── liked_me/
│       └── liked_me_screen.dart
│   └── chat/
│       └── chat_screen.dart
│   └── profile/
│       └── profile_screen.dart
├── widgets/
│   └── profile_card.dart         # 유저 프로필 카드 (스와이프용)
│   └── game_chip.dart            # 게임 카테고리용 위젯
├── models/
│   └── user_model.dart
│   └── message_model.dart
│   └── game_model.dart
├── services/
│   └── match_service.dart
│   └── user_service.dart
├── repository/
│   └── user_repository.dart
│   └── match_repository.dart
├── routes/
│   └── app_routes.dart
└── utils/
└── constants.dart
