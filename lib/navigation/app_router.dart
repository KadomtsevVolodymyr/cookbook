import 'package:auto_route/auto_route.dart';
import 'package:cookbook/presentation/main_screen/main_screen.dart';
import 'package:cookbook/presentation/onboarding_screen/onboarding_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: MainRoute.page,
          path: MainScreen.path,
        ),
        AutoRoute(
          page: OnboardingRoute.page,
          path: OnboardingScreen.path,
          initial: true,
        ),
      ];
}
