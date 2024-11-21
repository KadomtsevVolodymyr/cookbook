import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/scanner_screen/scanner_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  static const path = '/scanner_screen';

  @override
  Widget build(BuildContext context) {
    return const ScannerLayout();
  }
}
