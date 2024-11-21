import 'package:auto_route/annotations.dart';
import 'package:balancebyte/presentation/favourite_recipes_screen/favourite_recipes_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FavouriteRecipesScreen extends StatelessWidget {
  const FavouriteRecipesScreen({super.key});

  static const path = 'favourite_recipes_screen';

  @override
  Widget build(BuildContext context) {
    return const FavouriteRecipesLayout();
  }
}
