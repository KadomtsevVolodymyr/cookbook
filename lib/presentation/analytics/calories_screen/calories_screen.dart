import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/analytics/calories_screen/calories_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CaloriesScreen extends StatelessWidget {
  const CaloriesScreen({super.key});

  static const path = 'calories_screen';

  @override
  Widget build(BuildContext context) {
    return const CaloriesLayout();
  }
}
