import 'package:balancebyte/data/model/user_model.dart';
import 'package:balancebyte/data/model/user_settings.dart';
import 'package:balancebyte/domain/entities/result.dart';

abstract interface class IUserRepository {
  Future<Result<UserSettings>> getDiet();
  Future<Result<void>> setDiet(UserSettings diets);

  Future<Result<UserSettings>> getGoals();
  Future<Result<void>> setGoals(UserSettings goals);

  Future<Result<UserSettings>> getIntolerances();
  Future<Result<void>> setIntolerances(UserSettings intolerances);

  Future<Result<UserModel>> getMe();
  Future<Result<void>> updateProfile({
    required String name,
    required String username,
    required String address,
  });

  Future<Result<void>> uploadAvatar({
    required String filePath,
  });
}
