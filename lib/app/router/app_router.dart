import 'package:auto_route/auto_route.dart';
import 'package:flutter_boilerplate/features/home/view/home_page.dart';
import 'package:flutter_boilerplate/features/splash/view/splash_screen.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
// @MaterialAutoRouter
// run: flutter packages pub run build_runner build --delete-conflicting-outputs
@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, path: 'splash', initial: true),
    AutoRoute(page: HomePage, path: 'home'),
  ],
)
class $AppRouter {}
