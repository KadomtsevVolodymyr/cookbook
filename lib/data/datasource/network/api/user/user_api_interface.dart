import 'package:balancebyte/data/datasource/network/exchange_models/response.dart';
import 'package:balancebyte/data/model/user_model.dart';
import 'package:balancebyte/data/model/user_settings.dart';

abstract class IUserApi {
  Future<NetworkResponse<UserSettings>> getDiet();
  Future<NetworkResponse<void>> setDiet(UserSettings diets);

  Future<NetworkResponse<UserSettings>> getGoals();
  Future<NetworkResponse<void>> setGoals(UserSettings goals);

  Future<NetworkResponse<UserSettings>> getIntolerances();
  Future<NetworkResponse<void>> setIntolerances(UserSettings intolerances);

  Future<NetworkResponse<UserModel>> getMe();
  Future<NetworkResponse<void>> updateProfile({
    required String name,
    required String username,
    required String address,
  });

  Future<NetworkResponse<void>> uploadAvatar({
    required String filePath,
  });
}
