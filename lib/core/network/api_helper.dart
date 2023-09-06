import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../constants/app_url.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';
import 'network_checker.dart';

class ApiHelper extends Equatable {
  static NetworkChecker networkChecker = NetworkCheckerImpl(InternetConnectionChecker());
  late final Dio dio;

  ApiHelper() {
    BaseOptions options = BaseOptions(
      baseUrl: AppUrl.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveDataWhenStatusError: true,
      validateStatus: (_) => true,
    );
    dio = Dio(options);
  }

  Future<T> handleDataSourceRequest<T>({
    required Function() onTry,
    required T Function(Response response) onSuccess,
  }) async {
    try {
      final Response response = await onTry();
      if (response.statusCode == 201 || response.statusCode == 200) {
        return onSuccess(response);
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }

  static Future<Either<Failure, T>> handleRepoFunction<T>({required Function() onTry}) async {
    if (await networkChecker.isConnected) {
      try {
        return Right(await onTry());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  List<Object?> get props => [dio];
}
