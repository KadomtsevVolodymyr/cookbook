import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/domain/repositories/auth_repository_interface.dart';
import 'package:balancebyte/presentation/auth/cubit/auth_cubit.dart';
import 'package:balancebyte/presentation/auth/log_in_screen/log_in_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  static const path = '/log_in_screen';

  @override
  Widget build(BuildContext context) {
    final authRepository = Provider.of<IAuthRepository>(context);

    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(authRepository),
      child: const LogInLayout(),
    );
  }
}
