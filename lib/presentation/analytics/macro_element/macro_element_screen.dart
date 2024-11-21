import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/analytics/calories_screen/calories_layout.dart';
import 'package:balancebyte/presentation/analytics/macro_element/macro_element_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MacroElementScreen extends StatelessWidget {
  const MacroElementScreen({super.key});

  static const path = 'calories_screen';

  @override
  Widget build(BuildContext context) {
    return const MacroElementLayout();
  }
}
