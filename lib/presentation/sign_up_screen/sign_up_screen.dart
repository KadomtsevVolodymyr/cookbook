import 'package:auto_route/auto_route.dart';
import 'package:cookbook/presentation/sign_up_screen/sign_up_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const path = '/sign_up_screen';

  @override
  Widget build(BuildContext context) {
    return const SignUpLayout();
  }
}
