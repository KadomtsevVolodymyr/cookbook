import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/auth/email_success_screen/email_success_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EmailSuccessScreen extends StatelessWidget {
  const EmailSuccessScreen({super.key});

  static const path = '/email_success_screen';

  @override
  Widget build(BuildContext context) {
    return const EmailSuccessLayout();
  }
}
