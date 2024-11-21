import 'package:balancebyte/data/model/menu_item.dart';
import 'package:balancebyte/data/model/recipe_item_model.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/presentation/account_screen/account_screen.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:balancebyte/widgets/molecules/custom_form_field.dart';
import 'package:balancebyte/widgets/organisms/custom_appbar.dart';
import 'package:balancebyte/widgets/organisms/filter_drawer.dart';
import 'package:balancebyte/widgets/organisms/filter_options.dart';
import 'package:balancebyte/widgets/organisms/recipe_list.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class FavouriteRecipesLayout extends StatefulWidget {
  const FavouriteRecipesLayout({super.key});

  @override
  State<FavouriteRecipesLayout> createState() => _FavouriteRecipesLayoutState();
}

class _FavouriteRecipesLayoutState extends State<FavouriteRecipesLayout> {
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
  final TextEditingController usernameController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedHintText = 'Nutritional Goals';

  void applyFilters() {
    // Here, make an API call or update the data based on selectedFilters
    print('Filters applied: $selectedFilters');
    // Call your API or refresh data
  }

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
        iconBack: true,
        title: 'My favorite recipes',
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
              CustomFormField.custom(
                label: 'Search',
                controller: usernameController,
                prefixIcon: Assets.icons.searchIcon.svg(),
              ),
              Spacing.spacing20,
              FilterOptions(
                scaffoldKey: _scaffoldKey,
                dropDownItems: dropDownItems,
                initialHintText: selectedHintText,
              ),
              Spacing.spacing20,
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
              // Padding(
              //   padding: EdgeInsets.only(top: 114.0.s),
              //   child: EmptyState.item(onButtonPressed: () {}),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
