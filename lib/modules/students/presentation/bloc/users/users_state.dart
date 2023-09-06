part of 'users_bloc.dart';

abstract class UsersState {
  const UsersState();
  static bool _loading = false;
  bool getLoading() => _loading;
  void setLoading(bool value) => _loading = value;
}

class UsersInitial extends UsersState {}

class LoadingUsers extends UsersState {}

class OfflineUsers extends UsersState {
  final String message;
  const OfflineUsers({required this.message});
}

class SuccessGetAllUsers extends UsersState {
  final List<User> users;
  const SuccessGetAllUsers({required this.users});
}

class FailedGetAllUsers extends UsersState {
  final String message;
  const FailedGetAllUsers({required this.message});
}
