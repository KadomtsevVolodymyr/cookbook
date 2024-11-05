import 'package:auto_route/auto_route.dart';
import 'package:cookbook/presentation/log_in_screen/log_in_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  static const path = '/log_in_screen';

  @override
  Widget build(BuildContext context) {
    return const LogInLayout();
  }
}
