import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user.dart';

abstract class UsersRepository {
  Future<Either<Failure, List<User>>> getAllUsers({int? page});
  Future<Either<Failure, User>> getSingleUser({required int id});
}
