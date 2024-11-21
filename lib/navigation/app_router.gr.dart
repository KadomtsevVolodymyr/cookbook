// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountScreen(),
      );
    },
    ConnectHealthAppRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConnectHealthAppScreen(),
      );
    },
    FavouriteRecipesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavouriteRecipesScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LogInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LogInScreen(),
      );
    },
    LogInSuccessRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LogInSuccessScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    RecipesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RecipesScreen(),
      );
    },
    ReportsAnalyticsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReportsAnalyticsScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
    SingleRecipeRoute.name: (routeData) {
      final args = routeData.argsAs<SingleRecipeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SingleRecipeScreen(
          recipeItemModel: args.recipeItemModel,
          key: args.key,
        ),
      );
    },
    TipsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TipsScreen(),
      );
    },
    UserProfileSetupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserProfileSetupScreen(),
      );
    },
  };
}

/// generated route for
/// [AccountScreen]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConnectHealthAppScreen]
class ConnectHealthAppRoute extends PageRouteInfo<void> {
  const ConnectHealthAppRoute({List<PageRouteInfo>? children})
      : super(
          ConnectHealthAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConnectHealthAppRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavouriteRecipesScreen]
class FavouriteRecipesRoute extends PageRouteInfo<void> {
  const FavouriteRecipesRoute({List<PageRouteInfo>? children})
      : super(
          FavouriteRecipesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouriteRecipesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LogInScreen]
class LogInRoute extends PageRouteInfo<void> {
  const LogInRoute({List<PageRouteInfo>? children})
      : super(
          LogInRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LogInSuccessScreen]
class LogInSuccessRoute extends PageRouteInfo<void> {
  const LogInSuccessRoute({List<PageRouteInfo>? children})
      : super(
          LogInSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogInSuccessRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RecipesScreen]
class RecipesRoute extends PageRouteInfo<void> {
  const RecipesRoute({List<PageRouteInfo>? children})
      : super(
          RecipesRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecipesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReportsAnalyticsScreen]
class ReportsAnalyticsRoute extends PageRouteInfo<void> {
  const ReportsAnalyticsRoute({List<PageRouteInfo>? children})
      : super(
          ReportsAnalyticsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportsAnalyticsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SingleRecipeScreen]
class SingleRecipeRoute extends PageRouteInfo<SingleRecipeRouteArgs> {
  SingleRecipeRoute({
    required RecipeItemModel recipeItemModel,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SingleRecipeRoute.name,
          args: SingleRecipeRouteArgs(
            recipeItemModel: recipeItemModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SingleRecipeRoute';

  static const PageInfo<SingleRecipeRouteArgs> page =
      PageInfo<SingleRecipeRouteArgs>(name);
}

class SingleRecipeRouteArgs {
  const SingleRecipeRouteArgs({
    required this.recipeItemModel,
    this.key,
  });

  final RecipeItemModel recipeItemModel;

  final Key? key;

  @override
  String toString() {
    return 'SingleRecipeRouteArgs{recipeItemModel: $recipeItemModel, key: $key}';
  }
}

/// generated route for
/// [TipsScreen]
class TipsRoute extends PageRouteInfo<void> {
  const TipsRoute({List<PageRouteInfo>? children})
      : super(
          TipsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TipsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserProfileSetupScreen]
class UserProfileSetupRoute extends PageRouteInfo<void> {
  const UserProfileSetupRoute({List<PageRouteInfo>? children})
      : super(
          UserProfileSetupRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserProfileSetupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
