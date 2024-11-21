import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/domain/repositories/auth_repository_interface.dart';
import 'package:balancebyte/presentation/auth/cubit/auth_cubit.dart';
import 'package:balancebyte/presentation/auth/sign_up_screen/sign_up_layout.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const path = '/sign_up_screen';

  @override
  Widget build(BuildContext context) {
    final authRepository = Provider.of<IAuthRepository>(context);

    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(authRepository),
      child: const SignUpLayout(),
    );
  }
}
