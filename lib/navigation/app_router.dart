import 'package:auto_route/auto_route.dart';
import 'package:cookbook/presentation/account_screen/account_screen.dart';
import 'package:cookbook/presentation/connect_health_app/connect_health_app_screen.dart';
import 'package:cookbook/presentation/home_screen/home_screen.dart';
import 'package:cookbook/presentation/log_in_screen/log_in_screen.dart';
import 'package:cookbook/presentation/login_success_screen/login_success_screen.dart';
import 'package:cookbook/presentation/main_screen/main_screen.dart';
import 'package:cookbook/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:cookbook/presentation/reports_analytics_screen/reports_analytics_screen.dart';
import 'package:cookbook/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:cookbook/presentation/user_profile_setup_screen/user_profile_setup_screen.dart';

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
              ],
            ),
          ],
        ),
      ];
}
