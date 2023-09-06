import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tafeel/core/errors/failures.dart';

import '../../../../../core/constants/messages/failure_messages.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/use_cases/users_use_cases.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersUseCases useCases;
  List<User> users = [];
  int page = 1;
  bool hasReachedMax = false;

  UsersBloc({required this.useCases}) : super(UsersInitial()) {
    on<GetAllUsersEvent>((event, emit) => _getAllUsersHandler(event, emit));
  }

  // ====================================================================
  void _getAllUsersHandler(GetAllUsersEvent event, Emitter<UsersState> emit) async {
    if (state is LoadingUsers) return;
    if (event.isRefresh) {
      users.clear();
      page = 1;
      hasReachedMax = false;
    }
    emit(LoadingUsers());

    final response = await useCases.getAllUsers(page: page);
    response.fold(
      (failure) {
        if (failure is OfflineFailure) {
          emit(OfflineUsers(message: FailureMessages.getMessage(failure)));
        } else {
          emit(FailedGetAllUsers(message: FailureMessages.getMessage(failure)));
        }
      },
      (users) {
        page++;
        hasReachedMax = false;
        this.users.addAll(users);
        emit(SuccessGetAllUsers(users: users));
      },
    );
  }
}
