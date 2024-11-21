import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/data/model/recipe_item_model.dart';
import 'package:balancebyte/presentation/account_screen/account_screen.dart';
import 'package:balancebyte/presentation/analytics/bmi_screen/bmi_screen.dart';
import 'package:balancebyte/presentation/analytics/calories_screen/calories_screen.dart';
import 'package:balancebyte/presentation/analytics/food_group_screen/food_group_screen.dart';
import 'package:balancebyte/presentation/analytics/hydration_levels/hydration_levels_screen.dart';
import 'package:balancebyte/presentation/analytics/macro_element/macro_element_screen.dart';
import 'package:balancebyte/presentation/analytics/perfomance_screen/perfomance_screen.dart';
import 'package:balancebyte/presentation/analytics/weight_progress/weight_progress_screen.dart';
import 'package:balancebyte/presentation/auth/email_confirmation_screen/email_confirmation_layout.dart';
import 'package:balancebyte/presentation/auth/email_confirmation_screen/email_confirmation_screen.dart';
import 'package:balancebyte/presentation/auth/email_success_screen/email_success_screen.dart';
import 'package:balancebyte/presentation/auth/log_in_screen/log_in_screen.dart';
import 'package:balancebyte/presentation/auth/login_success_screen/login_success_screen.dart';
import 'package:balancebyte/presentation/auth/password_recovery_screen/password_recovery_screen.dart';
import 'package:balancebyte/presentation/auth/reset_password_screen/reset_passwrod_screen.dart';
import 'package:balancebyte/presentation/auth/sign_up_screen/sign_up_screen.dart';
import 'package:balancebyte/presentation/connect_health_app/connect_health_app_screen.dart';
import 'package:balancebyte/presentation/favourite_recipes_screen/favourite_recipes_screen.dart';
import 'package:balancebyte/presentation/forum/add_story_screen/add_story_screen.dart';
import 'package:balancebyte/presentation/forum/camera_screen/camera_screen.dart';
import 'package:balancebyte/presentation/forum/community_screen/community_screen.dart';
import 'package:balancebyte/presentation/forum/followers_screen/followers_screen.dart';
import 'package:balancebyte/presentation/forum/following_screen/following_screen.dart';
import 'package:balancebyte/presentation/home_screen/home_screen.dart';
import 'package:balancebyte/presentation/main_screen/main_screen.dart';
import 'package:balancebyte/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:balancebyte/presentation/recipes_screen/recipes_screen.dart';
import 'package:balancebyte/presentation/reports_analytics_screen/reports_analytics_screen.dart';
import 'package:balancebyte/presentation/scanner_screen/scanner_screen.dart';
import 'package:balancebyte/presentation/settings_screen/settings_screen.dart';
import 'package:balancebyte/presentation/single_recipe_screen/single_recipe_screen.dart';
import 'package:balancebyte/presentation/single_tip_screen/single_tip_screen.dart';
import 'package:balancebyte/presentation/support_screen/support_screen.dart';
import 'package:balancebyte/presentation/tips_screen/tips_screen.dart';
import 'package:balancebyte/presentation/user_profile_setup_screen/user_profile_setup_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: OnboardingRoute.page,
          path: OnboardingScreen.path,
          initial: true,
        ),
        AutoRoute(
          page: SignUpRoute.page,
          path: SignUpScreen.path,
        ),
        AutoRoute(
          page: LogInRoute.page,
          path: LogInScreen.path,
        ),
        AutoRoute(
          page: ResetPasswordRoute.page,
          path: ResetPasswordScreen.path,
        ),
        AutoRoute(
          page: EmailConfirmationRoute.page,
          path: EmailConfirmationScreen.path,
        ),
        AutoRoute(
          page: PasswordRecoveryRoute.page,
          path: PasswordRecoveryScreen.path,
        ),
        AutoRoute(
          page: UserProfileSetupRoute.page,
          path: UserProfileSetupScreen.path,
        ),
        AutoRoute(
          page: ConnectHealthAppRoute.page,
          path: ConnectHealthAppScreen.path,
        ),
        AutoRoute(
          page: LogInSuccessRoute.page,
          path: LogInSuccessScreen.path,
        ),
        AutoRoute(
          page: EmailSuccessRoute.page,
          path: EmailSuccessScreen.path,
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: HomeScreen.path,
          children: [
            AutoRoute(
              page: MainRoute.page,
              path: MainScreen.path,
              children: [
                AutoRoute(
                  page: AccountRoute.page,
                  path: AccountScreen.path,
                  children: [
                    AutoRoute(
                      path: ReportsAnalyticsScreen.path,
                      page: ReportsAnalyticsRoute.page,
                    ),
                  ],
                ),
                AutoRoute(
                  page: RecipesRoute.page,
                  path: RecipesScreen.path,
                  children: [
                    AutoRoute(
                      path: FavouriteRecipesScreen.path,
                      page: FavouriteRecipesRoute.page,
                    ),
                    AutoRoute(
                      path: SingleRecipeScreen.path,
                      page: SingleRecipeRoute.page,
                    ),
                  ],
                ),
              ],
            ),
            AutoRoute(
              page: TipsRoute.page,
              path: TipsScreen.path,
            ),
          ],
        ),
      ];
}
