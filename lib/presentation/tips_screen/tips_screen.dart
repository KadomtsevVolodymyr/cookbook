import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/tips_screen/tips_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  static const path = 'tips_screen';

  @override
  Widget build(BuildContext context) {
    return const TipsLayout();
  }
}
