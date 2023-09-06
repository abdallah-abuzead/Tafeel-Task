part of 'single_user_bloc.dart';

abstract class SingleUserEvent {}

class GetSingleUserEvent extends SingleUserEvent {
  final int id;
  GetSingleUserEvent({required this.id});
}
