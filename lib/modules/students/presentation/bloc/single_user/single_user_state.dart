part of 'single_user_bloc.dart';

abstract class SingleUserState {
  const SingleUserState();
  static bool _loading = false;
  bool getLoading() => _loading;
  void setLoading(bool value) => _loading = value;
}

class SingleUserInitial extends SingleUserState {}

class LoadingSingleUser extends SingleUserState {}

class OfflineSingleUser extends SingleUserState {
  final String message;
  const OfflineSingleUser({required this.message});
}

class SuccessGetSingleUser extends SingleUserState {
  final User user;
  SuccessGetSingleUser({required this.user});
}

class FailedGetSingleUser extends SingleUserState {
  final String message;
  FailedGetSingleUser({required this.message});
}
