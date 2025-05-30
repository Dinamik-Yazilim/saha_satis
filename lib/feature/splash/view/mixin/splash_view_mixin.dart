import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:dinamik10_pos/feature/splash/view/splash_view.dart';
import 'package:dinamik10_pos/product/router/app_router.dart';
import 'package:dinamik10_pos/product/state/base/base_state.dart';

import '../../../../product/service/manager/product_network_error_manager.dart';
import '../../../../product/state/container/product_state_items.dart';
import '../../view_model/splash_view_model.dart';

mixin SplashViewMixin on BaseState<SplashView> {
  late final ProductNetworkErrorManager _productNetworkErrorManager;
  late final SplashViewModel _splashViewModel;
  SplashViewModel get splashViewModel => _splashViewModel;
  @override
  void initState() {
    super.initState();
    _productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(onErrorStatus: _productNetworkErrorManager.handleError);
    _splashViewModel = SplashViewModel(productViewModel);
    route();
  }

  Future<void> route() async {
    final bool isAuthenticated = await splashViewModel.checkAuthStatusAndNavigate();

    if (!mounted) {
      AppLogger.warning('SplashView: Widget is unmounted, skipping navigation.');
      return;
    }

    if (isAuthenticated) {
      AppLogger.info('SplashView: Navigating to HomeView.');
      context.router.replace(LayoutRoute());
    } else {
      AppLogger.info('SplashView: Navigating to LoginView.');
      context.router.replace(LoginRoute());
    }
  }
}
