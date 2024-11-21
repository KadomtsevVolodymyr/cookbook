import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/connect_health_app/connect_health_app_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ConnectHealthAppScreen extends StatelessWidget {
  const ConnectHealthAppScreen({super.key});

  static const path = '/connect_health_app_screen';

  @override
  Widget build(BuildContext context) {
    return const ConnectHealthAppLayout();
  }
}
