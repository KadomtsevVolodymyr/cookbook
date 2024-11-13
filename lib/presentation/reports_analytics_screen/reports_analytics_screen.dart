import 'package:auto_route/auto_route.dart';
import 'package:cookbook/presentation/reports_analytics_screen/reports_analytics_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ReportsAnalyticsScreen extends StatelessWidget {
  const ReportsAnalyticsScreen({super.key});

  static const path = 'reports_analytics_screen';

  @override
  Widget build(BuildContext context) {
    return const ReportsAnalyticsLayout();
  }
}
