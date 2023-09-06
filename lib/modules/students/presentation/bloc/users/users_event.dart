part of 'users_bloc.dart';

abstract class UsersEvent {}

class GetAllUsersEvent extends UsersEvent {
  final bool isRefresh;
  GetAllUsersEvent({this.isRefresh = false});
}
