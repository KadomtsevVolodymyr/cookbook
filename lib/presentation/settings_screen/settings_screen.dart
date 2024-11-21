import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/settings_screen/settings_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const path = '/settings_screen';

  @override
  Widget build(BuildContext context) {
    return const SettingsLayout();
  }
}
