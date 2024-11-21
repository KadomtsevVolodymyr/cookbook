import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/domain/repositories/auth_repository_interface.dart';
import 'package:balancebyte/domain/repositories/user_repository_interface.dart';
import 'package:balancebyte/presentation/user_profile_setup_screen/cubit/user_profile_set_up_cubit.dart';
import 'package:balancebyte/presentation/user_profile_setup_screen/user_profile_setup_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

@RoutePage()
class UserProfileSetupScreen extends StatelessWidget {
  const UserProfileSetupScreen({super.key});

  static const path = '/sign_up_screen';

  @override
  Widget build(BuildContext context) {
    final userRepository = Provider.of<IUserRepository>(context);
    return BlocProvider<UserProfileSetUpCubit>(
      create: (context) => UserProfileSetUpCubit(userRepository),
      child: const UserProfileSetupLayout(),
    );
  }
}
