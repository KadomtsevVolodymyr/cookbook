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
    AddStoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddStoryScreen(),
      );
    },
    BmiRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BmiScreen(),
      );
    },
    CaloriesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CaloriesScreen(),
      );
    },
    CameraRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CameraScreen(),
      );
    },
    CommunityRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CommunityScreen(),
      );
    },
    ConnectHealthAppRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConnectHealthAppScreen(),
      );
    },
    EmailConfirmationRoute.name: (routeData) {
      final args = routeData.argsAs<EmailConfirmationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EmailConfirmationScreen(
          email: args.email,
          key: args.key,
        ),
      );
    },
    EmailSuccessRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmailSuccessScreen(),
      );
    },
    FavouriteRecipesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavouriteRecipesScreen(),
      );
    },
    FollowersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FollowersScreen(),
      );
    },
    FollowingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FollowingScreen(),
      );
    },
    FoodGroupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FoodGroupScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    HydrationLevelsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HydrationLevelsScreen(),
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
    MacroElementRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MacroElementScreen(),
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
    PasswordRecoveryRoute.name: (routeData) {
      final args = routeData.argsAs<PasswordRecoveryRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PasswordRecoveryScreen(
          isPassRecovery: args.isPassRecovery,
          key: args.key,
        ),
      );
    },
    PerformanceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PerformanceScreen(),
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
    ResetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResetPasswordScreen(),
      );
    },
    ScannerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScannerScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
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
    SingleTipRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SingleTipScreen(),
      );
    },
    SupportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SupportScreen(),
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
    WeightProgressRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WeightProgressScreen(),
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
/// [AddStoryScreen]
class AddStoryRoute extends PageRouteInfo<void> {
  const AddStoryRoute({List<PageRouteInfo>? children})
      : super(
          AddStoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddStoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BmiScreen]
class BmiRoute extends PageRouteInfo<void> {
  const BmiRoute({List<PageRouteInfo>? children})
      : super(
          BmiRoute.name,
          initialChildren: children,
        );

  static const String name = 'BmiRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CaloriesScreen]
class CaloriesRoute extends PageRouteInfo<void> {
  const CaloriesRoute({List<PageRouteInfo>? children})
      : super(
          CaloriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CaloriesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CameraScreen]
class CameraRoute extends PageRouteInfo<void> {
  const CameraRoute({List<PageRouteInfo>? children})
      : super(
          CameraRoute.name,
          initialChildren: children,
        );

  static const String name = 'CameraRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CommunityScreen]
class CommunityRoute extends PageRouteInfo<void> {
  const CommunityRoute({List<PageRouteInfo>? children})
      : super(
          CommunityRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommunityRoute';

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
/// [EmailConfirmationScreen]
class EmailConfirmationRoute extends PageRouteInfo<EmailConfirmationRouteArgs> {
  EmailConfirmationRoute({
    required String email,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EmailConfirmationRoute.name,
          args: EmailConfirmationRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EmailConfirmationRoute';

  static const PageInfo<EmailConfirmationRouteArgs> page =
      PageInfo<EmailConfirmationRouteArgs>(name);
}

class EmailConfirmationRouteArgs {
  const EmailConfirmationRouteArgs({
    required this.email,
    this.key,
  });

  final String email;

  final Key? key;

  @override
  String toString() {
    return 'EmailConfirmationRouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [EmailSuccessScreen]
class EmailSuccessRoute extends PageRouteInfo<void> {
  const EmailSuccessRoute({List<PageRouteInfo>? children})
      : super(
          EmailSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmailSuccessRoute';

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
/// [FollowersScreen]
class FollowersRoute extends PageRouteInfo<void> {
  const FollowersRoute({List<PageRouteInfo>? children})
      : super(
          FollowersRoute.name,
          initialChildren: children,
        );

  static const String name = 'FollowersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FollowingScreen]
class FollowingRoute extends PageRouteInfo<void> {
  const FollowingRoute({List<PageRouteInfo>? children})
      : super(
          FollowingRoute.name,
          initialChildren: children,
        );

  static const String name = 'FollowingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FoodGroupScreen]
class FoodGroupRoute extends PageRouteInfo<void> {
  const FoodGroupRoute({List<PageRouteInfo>? children})
      : super(
          FoodGroupRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoodGroupRoute';

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
/// [HydrationLevelsScreen]
class HydrationLevelsRoute extends PageRouteInfo<void> {
  const HydrationLevelsRoute({List<PageRouteInfo>? children})
      : super(
          HydrationLevelsRoute.name,
          initialChildren: children,
        );

  static const String name = 'HydrationLevelsRoute';

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
/// [MacroElementScreen]
class MacroElementRoute extends PageRouteInfo<void> {
  const MacroElementRoute({List<PageRouteInfo>? children})
      : super(
          MacroElementRoute.name,
          initialChildren: children,
        );

  static const String name = 'MacroElementRoute';

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
/// [PasswordRecoveryScreen]
class PasswordRecoveryRoute extends PageRouteInfo<PasswordRecoveryRouteArgs> {
  PasswordRecoveryRoute({
    required bool isPassRecovery,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PasswordRecoveryRoute.name,
          args: PasswordRecoveryRouteArgs(
            isPassRecovery: isPassRecovery,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PasswordRecoveryRoute';

  static const PageInfo<PasswordRecoveryRouteArgs> page =
      PageInfo<PasswordRecoveryRouteArgs>(name);
}

class PasswordRecoveryRouteArgs {
  const PasswordRecoveryRouteArgs({
    required this.isPassRecovery,
    this.key,
  });

  final bool isPassRecovery;

  final Key? key;

  @override
  String toString() {
    return 'PasswordRecoveryRouteArgs{isPassRecovery: $isPassRecovery, key: $key}';
  }
}

/// generated route for
/// [PerformanceScreen]
class PerformanceRoute extends PageRouteInfo<void> {
  const PerformanceRoute({List<PageRouteInfo>? children})
      : super(
          PerformanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'PerformanceRoute';

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
/// [ResetPasswordScreen]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScannerScreen]
class ScannerRoute extends PageRouteInfo<void> {
  const ScannerRoute({List<PageRouteInfo>? children})
      : super(
          ScannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScannerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

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
/// [SingleTipScreen]
class SingleTipRoute extends PageRouteInfo<void> {
  const SingleTipRoute({List<PageRouteInfo>? children})
      : super(
          SingleTipRoute.name,
          initialChildren: children,
        );

  static const String name = 'SingleTipRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SupportScreen]
class SupportRoute extends PageRouteInfo<void> {
  const SupportRoute({List<PageRouteInfo>? children})
      : super(
          SupportRoute.name,
          initialChildren: children,
        );

  static const String name = 'SupportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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

/// generated route for
/// [WeightProgressScreen]
class WeightProgressRoute extends PageRouteInfo<void> {
  const WeightProgressRoute({List<PageRouteInfo>? children})
      : super(
          WeightProgressRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeightProgressRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
