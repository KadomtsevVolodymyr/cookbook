import 'package:balancebyte/extensions/num.dart';
import 'package:balancebyte/widgets/molecules/custom_form_field.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    this.fieldLabel,
    this.showUsernameField = true,
    super.key,
  });

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool showUsernameField;
  final String? fieldLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24.0.s,
        ),
        if (showUsernameField)
          CustomFormField.username(
            label: 'Username',
            controller: usernameController,
          ),
        if (!showUsernameField)
          CustomFormField.username(
            label: fieldLabel ?? "Email or Username",
            controller: usernameController,
          ),
        if (showUsernameField)
          SizedBox(
            height: 20.0.s,
          ),
        if (showUsernameField)
          CustomFormField.email(
            label: 'Email',
            controller: emailController,
          ),
        SizedBox(
          height: 20.0.s,
        ),
        CustomFormField.password(
          label: 'Password',
          controller: passwordController,
        ),
        SizedBox(
          height: 12.0.s,
        ),
      ],
    );
  }
}
