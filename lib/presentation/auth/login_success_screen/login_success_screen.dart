import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/auth/login_success_screen/login_success_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LogInSuccessScreen extends StatelessWidget {
  const LogInSuccessScreen({super.key});

  static const path = '/log_in_success_screen';

  @override
  Widget build(BuildContext context) {
    return const LoginSuccessLayout();
  }
}
