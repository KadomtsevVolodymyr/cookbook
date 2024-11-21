import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/domain/repositories/auth_repository_interface.dart';
import 'package:balancebyte/presentation/auth/cubit/auth_cubit.dart';
import 'package:balancebyte/presentation/auth/email_confirmation_screen/email_confirmation_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EmailConfirmationScreen extends StatelessWidget {
  const EmailConfirmationScreen({required this.email, super.key});
  final String email;

  static const path = '/email_confirmation_screen';

  @override
  Widget build(BuildContext context) {
    final authRepository = Provider.of<IAuthRepository>(context);

    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(authRepository),
      child: EmailConfirmationLayout(
        email: email,
        isPasswordRecovery: true,
      ),
    );
  }
}
