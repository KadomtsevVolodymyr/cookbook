import 'package:flutter/material.dart';

class FocusPoint extends StatelessWidget {
  final Offset position;

  const FocusPoint({
    required this.position,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position.dy - 40,
      left: position.dx - 30,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
