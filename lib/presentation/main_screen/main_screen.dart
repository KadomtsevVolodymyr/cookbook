import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/main_screen/main_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const path = 'main_screen';

  @override
  Widget build(BuildContext context) {
    return const MainLayout();
  }
}
