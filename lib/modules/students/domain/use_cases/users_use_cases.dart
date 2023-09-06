import 'package:dartz/dartz.dart';
import 'package:tafeel/modules/students/domain/repositories/users_repository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user.dart';

class UsersUseCases {
  final UsersRepository repository;

  UsersUseCases({required this.repository});

  Future<Either<Failure, List<User>>> getAllUsers({int? page}) => repository.getAllUsers(page: page);
  Future<Either<Failure, User>> getSingleUser({required int id}) => repository.getSingleUser(id: id);
}
