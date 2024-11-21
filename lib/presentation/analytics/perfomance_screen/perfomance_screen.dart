import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/analytics/perfomance_screen/perfomance_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PerformanceScreen extends StatelessWidget {
  const PerformanceScreen({super.key});

  static const path = 'calories_screen';

  @override
  Widget build(BuildContext context) {
    return const PerformanceLayout();
  }
}
