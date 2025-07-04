import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../feature/demo/home/view/home_view.dart';
import '../../feature/login/view/login_view.dart';
import '../../feature/layout/view/layout_view.dart';
import '../../feature/setting/view/setting_view.dart';
import '../../feature/splash/view/splash_view.dart';
import '../../feature/synchronization/view/synchronization_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    CustomRoute(page: SplashRoute.page, initial: true, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: LoginRoute.page, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: HomeRoute.page, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: LayoutRoute.page, transitionsBuilder: TransitionsBuilders.noTransition),
    CustomRoute(page: SettingRoute.page, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
      page: SynchronizationRoute.page,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      fullscreenDialog: true,
      opaque: false,
    ),
  ];
}
