import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tafeel/core/errors/failures.dart';

import '../../../../../core/constants/messages/failure_messages.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/use_cases/users_use_cases.dart';

part 'single_user_event.dart';
part 'single_user_state.dart';

class SingleUserBloc extends Bloc<SingleUserEvent, SingleUserState> {
  final UsersUseCases useCases;

  SingleUserBloc({required this.useCases}) : super(SingleUserInitial()) {
    on<GetSingleUserEvent>((event, emit) => _getSingleUserHandler(event, emit));
  }

  // ====================================================================
  _getSingleUserHandler(GetSingleUserEvent event, Emitter<SingleUserState> emit) async {
    emit(LoadingSingleUser());
    final response = await useCases.getSingleUser(id: event.id);
    response.fold(
      (failure) {
        if (failure is OfflineFailure) {
          emit(OfflineSingleUser(message: FailureMessages.getMessage(failure)));
        } else {
          emit(FailedGetSingleUser(message: FailureMessages.getMessage(failure)));
        }
      },
      (user) => emit(SuccessGetSingleUser(user: user)),
    );
  }
}
