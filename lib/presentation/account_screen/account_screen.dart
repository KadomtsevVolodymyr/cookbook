import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/account_screen/account_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static const path = 'account_screen';

  @override
  Widget build(BuildContext context) {
    return const AccountLayout();
  }
}
