import 'package:balancebyte/data/datasource/network/api/user/user_api_interface.dart';
import 'package:balancebyte/data/model/user_model.dart';
import 'package:balancebyte/data/model/user_settings.dart';
import 'package:balancebyte/domain/entities/result.dart';
import 'package:balancebyte/domain/repositories/user_repository_interface.dart';

class UserRepository implements IUserRepository {
  final IUserApi _userApi;

  UserRepository({required IUserApi userApi}) : _userApi = userApi;

  @override
  Future<Result<UserSettings>> getDiet() async {
    final response = await _userApi.getDiet();
    return response.when(
      onSuccess: Result.success,
      onError: Result.error,
    );
  }

  @override
  Future<Result<void>> setDiet(UserSettings diets) async {
    final response = await _userApi.setDiet(diets);
    return response.when(
      onSuccess: Result.success,
      onError: Result.error,
    );
  }

  @override
  Future<Result<UserSettings>> getGoals() async {
    final response = await _userApi.getGoals();
    return response.when(
      onSuccess: Result.success,
      onError: Result.error,
    );
  }

  @override
  Future<Result<void>> setGoals(UserSettings goals) async {
    final response = await _userApi.setGoals(goals);
    return response.when(
      onSuccess: Result.success,
      onError: Result.error,
    );
  }

  @override
  Future<Result<UserSettings>> getIntolerances() async {
    final response = await _userApi.getIntolerances();
    return response.when(
      onSuccess: Result.success,
      onError: Result.error,
    );
  }

  @override
  Future<Result<void>> setIntolerances(UserSettings intolerances) async {
    final response = await _userApi.setIntolerances(intolerances);
    return response.when(
      onSuccess: Result.success,
      onError: Result.error,
    );
  }

  @override
  Future<Result<UserModel>> getMe() async {
    final response = await _userApi.getMe();
    return response.when(
      onSuccess: Result.success,
      onError: Result.error,
    );
  }

  @override
  Future<Result<void>> updateProfile({
    required String name,
    required String username,
    required String address,
  }) async {
    final response = await _userApi.updateProfile(
      name: name,
      username: username,
      address: address,
    );
    return response.when(
      onSuccess: Result.success,
      onError: Result.error,
    );
  }

  @override
  Future<Result<void>> uploadAvatar({
    required String filePath,
  }) async {
    final response = await _userApi.uploadAvatar(
      filePath: filePath,
    );
    return response.when(
      onSuccess: Result.success,
      onError: Result.error,
    );
  }
}
