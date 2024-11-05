import 'package:auto_route/auto_route.dart';
import 'package:cookbook/presentation/onboarding_screen/onboarding_layout.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/presentation/main_screen/main_layout.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const path = '/onboarding_screen';

  @override
  Widget build(BuildContext context) {
    return const OnboardingLayout();
  }
}
