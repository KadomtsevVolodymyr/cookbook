import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/data/model/menu_item.dart';
import 'package:cookbook/data/model/recipe_item_model.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/presentation/account_screen/account_screen.dart';
import 'package:cookbook/presentation/favourite_recipes_screen/favourite_recipes_screen.dart';
import 'package:cookbook/widgets/atoms/spacing.dart';
import 'package:cookbook/widgets/molecules/custom_button.dart';
import 'package:cookbook/widgets/molecules/custom_form_field.dart';
import 'package:cookbook/widgets/organisms/custom_appbar.dart';
import 'package:cookbook/widgets/organisms/filter_drawer.dart';
import 'package:cookbook/widgets/organisms/filter_options.dart';
import 'package:cookbook/widgets/organisms/recipe_list.dart';
import 'package:cookbook/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class RecipesLayout extends StatefulWidget {
  const RecipesLayout({super.key});

  @override
  State<RecipesLayout> createState() => _RecipesLayoutState();
}

class _RecipesLayoutState extends State<RecipesLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController usernameController = TextEditingController();
  final List<MenuItem> dropDownItems = [
    MenuItem(text: 'Low calorie', icon: Assets.icons.lowCaloriesIcon),
    MenuItem(text: 'High protein', icon: Assets.icons.hightProtein),
    MenuItem(text: 'Low carb', icon: Assets.icons.lowCarb),
    MenuItem(text: 'High fiber', icon: Assets.icons.hightFiber),
  ];

  final filters = {
    'Cuisine': ['Italian', 'Mexican', 'Asian', 'Mediterranean', 'Others'],
    'Meal Type': ['Breakfast', 'Lunch', 'Dinner', 'Snack', 'Desserts'],
    'Dietary Preferences': [
      'Vegetarian',
      'Vegan',
      'Keto',
      'Paleo',
      'Gluten-Free',
    ],
    'Cooking Time': [
      'Under 15 minutes',
      '15-30 minutes',
      '30-60 minutes',
      'Over 60 minutes',
    ],
    'Cooking Method': ['Slow cook', 'Grill', 'Stovetop', 'Oven-baked'],
    'Health Condition': [
      'Diabetes-friendly',
      'Heart-healthy',
      'Low sodium',
      'High cholesterol',
    ],
    'Fitness Goals': [
      'Pre-workout',
      'Post-workout',
      'Muscle building',
      'Weight loss',
    ],
    'Ingredients': [
      'Common pantry items',
      'Specialty ingredients',
    ],
    'Skill Level': ['Beginner', 'Intermediate', 'Advanced'],
    'Sustainability': [
      'Plant-based',
      'Eco-friendly packaging',
      'Locally sourced',
    ],
  };

  final selectedFilters = {
    'Cuisine': <String>{},
    'Meal Type': <String>{},
    'Dietary Preferences': <String>{},
    'Cooking Time': <String>{},
    'Cooking Method': <String>{},
    'Health Condition': <String>{},
    'Fitness Goals': <String>{},
    'Ingredients': <String>{},
    'Skill Level': <String>{},
    'Sustainability': <String>{},
  };

  void applyFilters() {
    // Here, make an API call or update the data based on selectedFilters
    print('Filters applied: $selectedFilters');
    // Call your API or refresh data
  }

  String selectedHintText = 'Nutritional Goals';
  Widget? selectedIcon;
  bool isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: FilterDrawer(
        filters: filters,
        selectedFilters: selectedFilters,
        onApplyFilters: applyFilters,
      ),
      appBar: CustomAppBar(
        title: 'Recipes',
        icon: Assets.icons.profile.svg(),
        onIconTap: () => PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const AccountScreen(),
        ),
      ),
      body: SingleChildScrollView(
        child: ScreenSideOffset.large(
          child: Column(
            children: [
              Spacing.spacing40,
              CustomButton.shadowed(
                prefixIcon: Assets.icons.like.svg(),
                text: Text(
                  "My Favorite Recipes",
                  style: context.theme.textTheme.headlineMedium,
                ),
                onPressed: () => PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const FavouriteRecipesScreen(),
                ),
              ),
              Spacing.spacing20,
              CustomFormField.custom(
                label: 'Search',
                controller: usernameController,
                prefixIcon: Assets.icons.searchIcon.svg(),
              ),
              Spacing.spacing40,
              FilterOptions(
                scaffoldKey: _scaffoldKey,
                dropDownItems: dropDownItems,
                initialHintText: selectedHintText,
              ),
              Spacing.spacing24,
              Row(
                children: [
                  Text(
                    "We Recommend",
                    style: context.theme.textTheme.headlineLarge
                        ?.copyWith(color: DefaultPalette.kDarkGreen),
                  ),
                ],
              ),
              Spacing.spacing16,
              RecipeList(
                items: [
                  RecipeItemModel(
                    imageUrl: Assets.images.chickernRecipe.image(
                      height: 140.0.s,
                      fit: BoxFit.cover,
                    ),
                    recipeName: 'Chicken Healthy Recipe',
                    time: '45 min',
                    effortLevel: 'Effortless',
                    isFavourite: true,
                    nutritionalIcon: Assets.icons.hightFiber.svg(),
                    effortlessIcon: Assets.icons.unlock.svg(),
                    onHeartTap: () {},
                    badges: ["180kCal", "45 min", "30g fats", "20g proteins"],
                    ingredients: [
                      {"name": "Chicken", "quantity": "100gr"},
                      {"name": "Eggs", "quantity": "2 items"},
                      {"name": "Wheat Flour", "quantity": "100gr"},
                      {"name": "Salt", "quantity": "3 tbsp"},
                    ],
                    steps: [
                      "Prepare all of the ingredients needed.",
                      "Mix flour, sugar, salt, and baking powder.",
                      "Mix the eggs and liquid milk until blended.",
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
