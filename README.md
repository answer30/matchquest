## 📁 프로젝트 구조

### 🏁 진입점
- `main.dart`: 앱 실행 시작점
- `app.dart`: `MaterialApp` 설정 및 테마 구성

### 🧠 ViewModels (MVVM)
- `viewmodels/matching_view_model.dart`
- `viewmodels/category_match_view_model.dart`
- `viewmodels/liked_me_view_model.dart`
- `viewmodels/chat_view_model.dart`
- `viewmodels/profile_view_model.dart`

### 📱 Screens
- `screens/main_tab.dart`: BottomNavigation Scaffold

### auth 
- `screens/auth/login_screen.dart`: 로그인화면

#### 🔄 Matching
- `screens/matching/matching_screen.dart`: 스와이프 기반 매칭 화면

#### 🎮 Category Match
- `screens/category_match/category_match_screen.dart`: 게임 카테고리 기반 매칭

#### ❤️ Liked Me
- `screens/liked_me/liked_me_screen.dart`: 나를 좋아요한 유저 목록

#### 💬 Chat
- `screens/chat/chat_screen.dart`: 채팅 기능 화면

#### 🙋‍♂️ Profile
- `screens/profile/profile_screen.dart`: 프로필 등록 및 수정

### 🧩 Widgets
- `widgets/profile_card.dart`: 스와이프 카드형 유저 프로필
- `widgets/game_chip.dart`: 게임 카테고리 칩

### 🧬 Models
- `models/user_model.dart`
- `models/message_model.dart`
- `models/game_model.dart`

### 🛠 Services
- `services/match_service.dart`
- `services/user_service.dart`

### 🗃 Repository
- `repository/user_repository.dart`
- `repository/match_repository.dart`

### 🧭 Routing
- `routes/app_routes.dart`: 앱 라우팅 정의

### ⚙️ 기타
- `utils/`: 유틸 함수들
- `constants.dart`: 전역 상수 정의
