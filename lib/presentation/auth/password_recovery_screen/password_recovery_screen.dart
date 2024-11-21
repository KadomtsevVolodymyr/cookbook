import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/domain/repositories/auth_repository_interface.dart';
import 'package:balancebyte/presentation/auth/cubit/auth_cubit.dart';
import 'package:balancebyte/presentation/auth/password_recovery_screen/password_recovery_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({required this.isPassRecovery, super.key});

  static const path = '/password_recovery_screen';
  final bool isPassRecovery;

  @override
  Widget build(BuildContext context) {
    final authRepository = Provider.of<IAuthRepository>(context);

    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(authRepository),
      child: PasswordRecoveryLayout(
        isPassRecovery: isPassRecovery,
      ),
    );
  }
}
