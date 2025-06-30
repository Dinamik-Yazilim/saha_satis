// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeView();
    },
  );
}

/// generated route for
/// [LayoutView]
class LayoutRoute extends PageRouteInfo<void> {
  const LayoutRoute({List<PageRouteInfo>? children})
    : super(LayoutRoute.name, initialChildren: children);

  static const String name = 'LayoutRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LayoutView();
    },
  );
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginView();
    },
  );
}

/// generated route for
/// [SettingView]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
    : super(SettingRoute.name, initialChildren: children);

  static const String name = 'SettingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingView();
    },
  );
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashView();
    },
  );
}

/// generated route for
/// [SynchronizationView]
class SynchronizationRoute extends PageRouteInfo<SynchronizationRouteArgs> {
  SynchronizationRoute({
    Key? key,
    bool showAsDialog = false,
    PageRouteInfo<Object?>? redirectToRoute,
    required bool clearExisting,
    List<PageRouteInfo>? children,
  }) : super(
         SynchronizationRoute.name,
         args: SynchronizationRouteArgs(
           key: key,
           showAsDialog: showAsDialog,
           redirectToRoute: redirectToRoute,
           clearExisting: clearExisting,
         ),
         initialChildren: children,
       );

  static const String name = 'SynchronizationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SynchronizationRouteArgs>();
      return SynchronizationView(
        key: args.key,
        showAsDialog: args.showAsDialog,
        redirectToRoute: args.redirectToRoute,
        clearExisting: args.clearExisting,
      );
    },
  );
}

class SynchronizationRouteArgs {
  const SynchronizationRouteArgs({
    this.key,
    this.showAsDialog = false,
    this.redirectToRoute,
    required this.clearExisting,
  });

  final Key? key;

  final bool showAsDialog;

  final PageRouteInfo<Object?>? redirectToRoute;

  final bool clearExisting;

  @override
  String toString() {
    return 'SynchronizationRouteArgs{key: $key, showAsDialog: $showAsDialog, redirectToRoute: $redirectToRoute, clearExisting: $clearExisting}';
  }
}
