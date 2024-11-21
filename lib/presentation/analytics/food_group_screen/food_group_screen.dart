import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/analytics/calories_screen/calories_layout.dart';
import 'package:balancebyte/presentation/analytics/food_group_screen/food_group_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FoodGroupScreen extends StatelessWidget {
  const FoodGroupScreen({super.key});

  static const path = 'calories_screen';

  @override
  Widget build(BuildContext context) {
    return const FoodGroupLayout();
  }
}
