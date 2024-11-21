import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/domain/repositories/auth_repository_interface.dart';
import 'package:balancebyte/presentation/auth/cubit/auth_cubit.dart';
import 'package:balancebyte/presentation/auth/reset_password_screen/reset_password_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  static const path = '/reset_password_screen';

  @override
  Widget build(BuildContext context) {
    final authRepository = Provider.of<IAuthRepository>(context);

    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(authRepository),
      child: const ResetPasswordLayout(),
    );
  }
}
