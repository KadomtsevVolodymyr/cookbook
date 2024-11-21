import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/analytics/bmi_screen/bmi_layout.dart';
import 'package:balancebyte/presentation/analytics/weight_progress/weight_progress_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WeightProgressScreen extends StatelessWidget {
  const WeightProgressScreen({super.key});

  static const path = 'bmi_screen';

  @override
  Widget build(BuildContext context) {
    return const WeightProgressLayout();
  }
}
