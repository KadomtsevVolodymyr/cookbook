import 'package:auto_route/auto_route.dart';
import 'package:cookbook/presentation/user_profile_setup_screen/user_profile_setup_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserProfileSetupScreen extends StatelessWidget {
  const UserProfileSetupScreen({super.key});

  static const path = '/sign_up_screen';

  @override
  Widget build(BuildContext context) {
    return const UserProfileSetupLayout();
  }
}
