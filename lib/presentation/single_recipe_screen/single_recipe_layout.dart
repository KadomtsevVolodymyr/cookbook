import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/data/model/recipe_item_model.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/widgets/atoms/custom_container.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:balancebyte/widgets/organisms/sliding_details.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class SingleRecipeLayout extends StatefulWidget {
  const SingleRecipeLayout({required this.recipeItemModel, super.key});

  final RecipeItemModel recipeItemModel;

  @override
  State<SingleRecipeLayout> createState() => _SingleRecipeLayoutState();
}

class _SingleRecipeLayoutState extends State<SingleRecipeLayout> {
  final List<String> badges = ["180kCal", "45 min", "30g fats", "20g proteins"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Stack(
              children: [
                Assets.images.chickernRecipe.image(fit: BoxFit.cover),
                SafeArea(
                  child: _buildTopInfo(),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.85,
            builder: (context, scrollController) {
              return SlidingDetails(
                controller: scrollController,
                recipeItemModel: widget.recipeItemModel,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTopInfo() {
    return ScreenSideOffset.large(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => PersistentNavBarNavigator.pop(context),
            child: Assets.icons.arrowLeft.svg(
                color: DefaultPalette.white, width: 24.0.s, height: 24.0.s),
          ),
          Row(
            children: [
              CustomContainer(
                child: Assets.icons.fats.svg(),
              ),
              Spacing.spacingW8,
              CustomContainer(
                child: Text(
                  "180kCal",
                  style: context.theme.textTheme.displayMedium
                      ?.copyWith(color: DefaultPalette.kDarkGreen),
                ),
              ),
              Spacing.spacingW8,
              CustomContainer(
                child: Text(
                  "45 min",
                  style: context.theme.textTheme.displayMedium
                      ?.copyWith(color: DefaultPalette.kDarkGreen),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
