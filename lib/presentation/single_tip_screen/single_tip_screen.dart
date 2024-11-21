import 'package:auto_route/annotations.dart';
import 'package:cookbook/presentation/single_tip_screen/single_tip_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SingleTipScreen extends StatelessWidget {
  const SingleTipScreen({super.key});

  static const path = 'single_recipes_screen';

  @override
  Widget build(BuildContext context) {
    return const SingleTipLayout();
  }
}
