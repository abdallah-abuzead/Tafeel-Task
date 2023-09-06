import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tafeel/modules/students/presentation/bloc/single_user/single_user_bloc.dart';
import 'package:tafeel/modules/students/presentation/bloc/users/users_bloc.dart';

import '../../modules/students/data/data_sources/users_data_source.dart';
import '../../modules/students/data/repositories/users_repository_impl.dart';
import '../../modules/students/domain/repositories/users_repository.dart';
import '../../modules/students/domain/use_cases/users_use_cases.dart';
import '../network/network_checker.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  /// Blocs & Cubits
  getIt.registerFactory(() => UsersBloc(useCases: getIt()));
  getIt.registerFactory(() => SingleUserBloc(useCases: getIt()));

  /// UseCases
  getIt.registerLazySingleton(() => UsersUseCases(repository: getIt()));

  /// Repository
  getIt.registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(dataSource: getIt()));

  /// DataSources
  getIt.registerLazySingleton<UsersDataSource>(() => StudentsDataSourceImpl());

  /// core
  getIt.registerLazySingleton<NetworkChecker>(() => NetworkCheckerImpl(getIt()));

  /// External
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
