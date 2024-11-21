import 'package:auto_route/annotations.dart';
import 'package:balancebyte/data/model/recipe_item_model.dart';
import 'package:balancebyte/presentation/single_recipe_screen/single_recipe_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SingleRecipeScreen extends StatelessWidget {
  const SingleRecipeScreen({required this.recipeItemModel, super.key});

  final RecipeItemModel recipeItemModel;

  static const path = 'item_recipes_screen';

  @override
  Widget build(BuildContext context) {
    return SingleRecipeLayout(
      recipeItemModel: recipeItemModel,
    );
  }
}
