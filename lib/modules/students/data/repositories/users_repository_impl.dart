import 'package:dartz/dartz.dart';
import 'package:tafeel/modules/students/data/data_sources/users_data_source.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_helper.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersDataSource dataSource;
  UsersRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<User>>> getAllUsers({int? page}) async {
    return ApiHelper.handleRepoFunction(onTry: () async => await dataSource.getAllUsers(page: page));
  }

  @override
  Future<Either<Failure, User>> getSingleUser({required int id}) async {
    return ApiHelper.handleRepoFunction(onTry: () async => await dataSource.getSingleUser(id: id));
  }
}
