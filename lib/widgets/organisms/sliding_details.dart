import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/data/model/recipe_item_model.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/widgets/atoms/handle_bar.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:balancebyte/widgets/molecules/ingredient_item.dart';
import 'package:balancebyte/widgets/organisms/nutritional_badges_list.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:balancebyte/widgets/organisms/step_list.dart';
import 'package:flutter/material.dart';

class SlidingDetails extends StatelessWidget {
  final ScrollController controller;

  final RecipeItemModel recipeItemModel;

  const SlidingDetails({
    required this.controller,
    required this.recipeItemModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: DefaultPalette.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0.s)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HandleBar(),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              controller: controller,
              child: Column(
                children: [
                  _buildRecipeHeader(context),
                  Spacing.spacing20,
                  Padding(
                    padding: EdgeInsets.only(left: 24.0.s),
                    child: NutritionalBadgesList(
                      badges: recipeItemModel.badges,
                    ),
                  ),
                  Spacing.spacing20,
                  ScreenSideOffset.large(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(context, "Ingredients"),
                        Spacing.spacing12,
                        ...recipeItemModel.ingredients.map((ingredient) {
                          return IngredientItem(
                            name: ingredient["name"]!,
                            quantity: ingredient["quantity"]!,
                          );
                        }),
                        Spacing.spacing20,
                        _buildHeader(context, "Step by Step"),
                        Spacing.spacing20,
                        StepList(steps: recipeItemModel.steps),
                      ],
                    ),
                  ),
                  Spacing.spacing8,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ScreenSideOffset _buildRecipeHeader(BuildContext context) {
    return ScreenSideOffset.large(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, recipeItemModel.recipeName),
          Spacing.spacing8,
          Row(
            children: [
              Assets.icons.unlock.svg(),
              SizedBox(width: 8.0.s),
              Text(
                "Effortless",
                style: context.theme.textTheme.titleLarge?.copyWith(
                  color: DefaultPalette.inactiveTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Text _buildHeader(BuildContext context, String text) {
    return Text(
      text,
      style: context.theme.textTheme.headlineLarge?.copyWith(
        color: DefaultPalette.kDarkGreen,
      ),
    );
  }
}
