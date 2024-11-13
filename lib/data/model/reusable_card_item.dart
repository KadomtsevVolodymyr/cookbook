import 'package:flutter/material.dart';

class ReusableCardItem {
  final String text;
  final Widget? icon;
  final VoidCallback onTap;
  final Widget? switchWidget;

  ReusableCardItem({
    required this.text,
    required this.onTap,
    this.icon,
    this.switchWidget,
  });
}
