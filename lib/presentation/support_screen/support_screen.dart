import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/support_screen/support_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  static const path = '/support_screen';

  @override
  Widget build(BuildContext context) {
    return const SupportLayout();
  }
}
