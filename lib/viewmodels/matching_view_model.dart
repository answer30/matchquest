import 'package:flutter/material.dart';
import 'package:MatchQuest/models/user_model.dart';

class MatchingViewModel extends ChangeNotifier {
  final List<UserModel> _users = [
    UserModel(
      id: '1',
      name: '아린',
      age: 23,
      game: '롤',
      classType: '소서리스',
      imageUrl: 'https://example.com/user1.jpg',
    ),
    UserModel(
      id: '2',
      name: '지민',
      age: 25,
      game: '오버워치',
      classType: '한조',
      imageUrl: 'https://example.com/user2.jpg',
    ),
  ];

  List<UserModel> get users => _users;

  // 선택된 유저와 그에 대한 좋아요/싫어요/슈퍼 좋아요 상태
  String? _lastActionUserId;
  final Set<String> _likedUsers = {}; // 좋아요한 유저 아이디 목록
  final Set<String> _dislikedUsers = {}; // 싫어요한 유저 아이디 목록
  final Set<String> _superLikedUsers = {}; // 슈퍼 좋아요한 유저 아이디 목록

  List<String> get likedUsers => _likedUsers.toList();
  List<String> get dislikedUsers => _dislikedUsers.toList();
  List<String> get superLikedUsers => _superLikedUsers.toList();

  // 현재 유저 정보 가져오기
  UserModel getCurrentUser(int index) {
    return _users[index];
  }

  // 유저 선택 시
  void setCurrentUser(int index) {
    _lastActionUserId = _users[index].id;
    notifyListeners();
  }

  // 좋아요 처리
  void likeCurrentUser() {
    if (_lastActionUserId != null) {
      _likedUsers.add(_lastActionUserId!);
      _lastActionUserId = null;
      notifyListeners();
    }
  }

  // 싫어요 처리
  void dislikeCurrentUser() {
    if (_lastActionUserId != null) {
      _dislikedUsers.add(_lastActionUserId!);
      _lastActionUserId = null;
      notifyListeners();
    }
  }

  // 슈퍼 좋아요 처리
  void superLikeCurrentUser() {
    if (_lastActionUserId != null) {
      _superLikedUsers.add(_lastActionUserId!);
      _lastActionUserId = null;
      notifyListeners();
    }
  }

  // 되돌리기 처리 (마지막 행동 취소)
  void undoLastAction() {
    if (_lastActionUserId != null) {
      _likedUsers.remove(_lastActionUserId);
      _dislikedUsers.remove(_lastActionUserId);
      _superLikedUsers.remove(_lastActionUserId);
      _lastActionUserId = null;
      notifyListeners();
    }
  }

  // 유저 제거
  void removeUser(int index) {
    _users.removeAt(index);
    notifyListeners();
  }

  // 유저 목록 새로고침 (예시로 추가)
  void refreshUsers() {
    // 서버에서 유저 데이터 새로 불러오기
    notifyListeners();
  }
}
