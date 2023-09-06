import 'package:tafeel/modules/students/data/models/user_model.dart';

import '../../../../core/constants/app_url.dart';
import '../../../../network/api_helper.dart';

abstract class UsersDataSource {
  Future<List<UserModel>> getAllUsers({int? page});
  Future<UserModel> getSingleUser({required int id});
}

class StudentsDataSourceImpl implements UsersDataSource {
  ApiHelper apiHelper = ApiHelper();

  @override
  Future<List<UserModel>> getAllUsers({int? page}) async {
    return apiHelper.handleDataSourceRequest(
      onTry: () async => await apiHelper.dio.get(AppUrl.users, queryParameters: {'page': page ?? ''}),
      onSuccess: (response) {
        return (response.data['data'] as List).map((user) => UserModel.fromJson(user)).toList();
      },
    );
  }

  @override
  Future<UserModel> getSingleUser({required int id}) {
    return apiHelper.handleDataSourceRequest(
      onTry: () async => await apiHelper.dio.get('${AppUrl.users}/$id'),
      onSuccess: (response) {
        return UserModel.fromJson(response.data['data']);
      },
    );
  }
}
