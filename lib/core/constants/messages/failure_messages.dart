import '../../errors/failures.dart';

class FailureMessages {
  static const String SERVER_FAILURE_MESSAGE = 'Internal server error, try again later.';
  static const String OFFLINE_FAILURE_MESSAGE = 'You are offline, please check your internet connection and try again';

  static String getMessage(Failure failure) {
    switch (failure.runtimeType) {
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return SERVER_FAILURE_MESSAGE;
    }
  }
}
