import 'package:balancebyte/data/model/recipe_item_model.dart';
import 'package:balancebyte/presentation/single_recipe_screen/single_recipe_screen.dart';
import 'package:balancebyte/widgets/molecules/recipe_item.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class RecipeList extends StatelessWidget {
  final List<RecipeItemModel> items;

  const RecipeList({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () => PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: SingleRecipeScreen(
              recipeItemModel: item,
            ),
          ),
          child: RecipeItem(
            imageUrl: item.imageUrl,
            recipeName: item.recipeName,
            time: item.time,
            effortLevel: item.effortLevel,
            onHeartTap: () {
              // Handle heart tap action here
            },
            nutritionalIcon: item.nutritionalIcon,
            effortlessIcon: item.effortlessIcon,
            isFavourite: item.isFavourite,
          ),
        );
      },
    );
  }
}
