import 'package:auto_route/annotations.dart';
import 'package:balancebyte/presentation/recipes_screen/recipes_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  static const path = 'recipes_screen';

  @override
  Widget build(BuildContext context) {
    return const RecipesLayout();
  }
}
