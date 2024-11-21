import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/onboarding_screen/onboarding_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const path = '/onboarding_screen';

  @override
  Widget build(BuildContext context) {
    return const OnboardingLayout();
  }
}
