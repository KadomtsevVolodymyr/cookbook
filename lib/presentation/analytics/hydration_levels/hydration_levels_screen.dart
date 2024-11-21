import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/analytics/hydration_levels/hydration_levels_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HydrationLevelsScreen extends StatelessWidget {
  const HydrationLevelsScreen({super.key});

  static const path = 'bmi_screen';

  @override
  Widget build(BuildContext context) {
    return const HydrationLevelsLayout();
  }
}
