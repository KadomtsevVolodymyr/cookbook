import 'package:flutter/material.dart';

class CustomBoxShadow extends StatelessWidget {
  const CustomBoxShadow({
    required this.child,
    super.key,
    this.boxShadow,
  });

  final Widget child;
  final BoxShadow? boxShadow;

  @override
  Widget build(BuildContext context) {
    final shadow = boxShadow ??
        const BoxShadow(
          offset: Offset(0, -1),
          blurRadius: 5,
        );

    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [shadow],
      ),
      child: child,
    );
  }
}
