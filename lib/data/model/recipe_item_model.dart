import 'package:flutter/material.dart';

class RecipeItemModel {
  final Widget imageUrl;
  final String recipeName;
  final String time;
  final String effortLevel;
  final Widget nutritionalIcon;
  final Widget effortlessIcon;
  final bool isFavourite;
  final VoidCallback onHeartTap;
  final List<String> badges;
  final List<Map<String, String>> ingredients;
  final List<String> steps;

  RecipeItemModel({
    required this.imageUrl,
    required this.recipeName,
    required this.time,
    required this.effortLevel,
    required this.nutritionalIcon,
    required this.isFavourite,
    required this.effortlessIcon,
    required this.onHeartTap,
    required this.badges,
    required this.ingredients,
    required this.steps,
  });
}
