// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [DepotTabView]
class DepotTabRoute extends PageRouteInfo<DepotTabRouteArgs> {
  DepotTabRoute({
    Key? key,
    required StockCardModel stok,
    List<PageRouteInfo>? children,
  }) : super(
         DepotTabRoute.name,
         args: DepotTabRouteArgs(key: key, stok: stok),
         initialChildren: children,
       );

  static const String name = 'DepotTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DepotTabRouteArgs>();
      return DepotTabView(key: args.key, stok: args.stok);
    },
  );
}

class DepotTabRouteArgs {
  const DepotTabRouteArgs({this.key, required this.stok});

  final Key? key;

  final StockCardModel stok;

  @override
  String toString() {
    return 'DepotTabRouteArgs{key: $key, stok: $stok}';
  }
}

/// generated route for
/// [GeneralTabView]
class GeneralTabRoute extends PageRouteInfo<GeneralTabRouteArgs> {
  GeneralTabRoute({
    Key? key,
    required StockCardModel stok,
    List<PageRouteInfo>? children,
  }) : super(
         GeneralTabRoute.name,
         args: GeneralTabRouteArgs(key: key, stok: stok),
         initialChildren: children,
       );

  static const String name = 'GeneralTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GeneralTabRouteArgs>();
      return GeneralTabView(key: args.key, stok: args.stok);
    },
  );
}

class GeneralTabRouteArgs {
  const GeneralTabRouteArgs({this.key, required this.stok});

  final Key? key;

  final StockCardModel stok;

  @override
  String toString() {
    return 'GeneralTabRouteArgs{key: $key, stok: $stok}';
  }
}

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
/// [PriceTabView]
class PriceTabRoute extends PageRouteInfo<PriceTabRouteArgs> {
  PriceTabRoute({
    Key? key,
    required StockCardModel stok,
    List<PageRouteInfo>? children,
  }) : super(
         PriceTabRoute.name,
         args: PriceTabRouteArgs(key: key, stok: stok),
         initialChildren: children,
       );

  static const String name = 'PriceTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PriceTabRouteArgs>();
      return PriceTabView(key: args.key, stok: args.stok);
    },
  );
}

class PriceTabRouteArgs {
  const PriceTabRouteArgs({this.key, required this.stok});

  final Key? key;

  final StockCardModel stok;

  @override
  String toString() {
    return 'PriceTabRouteArgs{key: $key, stok: $stok}';
  }
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
/// [StockDetailView]
class StockDetailRoute extends PageRouteInfo<StockDetailRouteArgs> {
  StockDetailRoute({
    Key? key,
    required StockCardModel stok,
    List<PageRouteInfo>? children,
  }) : super(
         StockDetailRoute.name,
         args: StockDetailRouteArgs(key: key, stok: stok),
         initialChildren: children,
       );

  static const String name = 'StockDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StockDetailRouteArgs>();
      return StockDetailView(key: args.key, stok: args.stok);
    },
  );
}

class StockDetailRouteArgs {
  const StockDetailRouteArgs({this.key, required this.stok});

  final Key? key;

  final StockCardModel stok;

  @override
  String toString() {
    return 'StockDetailRouteArgs{key: $key, stok: $stok}';
  }
}

/// generated route for
/// [StocksView]
class StocksRoute extends PageRouteInfo<void> {
  const StocksRoute({List<PageRouteInfo>? children})
    : super(StocksRoute.name, initialChildren: children);

  static const String name = 'StocksRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StocksView();
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
