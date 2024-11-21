import 'package:balancebyte/data/model/user_settings.dart';
import 'package:balancebyte/domain/repositories/user_repository_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_set_up_state.dart';
part 'user_profile_set_up_cubit.freezed.dart';

class UserProfileSetUpCubit extends Cubit<UserProfileSetUpState> {
  UserProfileSetUpCubit(this.userRepository)
      : super(const UserProfileSetUpState.initial());
  final IUserRepository userRepository;

  Future<void> setDiet(UserSettings data) async {
    await userRepository.setDiet(data);
  }

  Future<void> setGoals(UserSettings data) async {
    await userRepository.setGoals(data);
  }

  Future<void> setIntolerances(UserSettings data) async {
    await userRepository.setIntolerances(data);
  }

  Future<void> uploadAvatar({
    required String filePath,
  }) async {
    await userRepository.uploadAvatar(
      filePath: filePath,
    );
  }
}
