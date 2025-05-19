import 'package:easy_localization/easy_localization.dart';

import '../../../../../product/init/language/locales.dart';
import '../../../../../product/service/manager/product_network_error_manager.dart';
import '../../../../../product/service/user_service.dart';
import '../../../../../product/state/base/base_state.dart';
import '../../../../../product/state/container/product_state_items.dart';
import '../../view_model/home_view_model.dart';
import '../home_view.dart';

mixin HomeViewMixin on BaseState<HomeView> {
  late Locales selectedLocale;
  late final ProductNetworkErrorManager _productNetworkErrorManager;
  late final HomeViewModel _homeViewModel;

  HomeViewModel get homeViewModel => _homeViewModel;
  @override
  void initState() {
    super.initState();
    _productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(onErrorStatus: _productNetworkErrorManager.handleError);
    _homeViewModel = HomeViewModel(operationService: UserService(productNetworkManager));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final currentLocale = context.locale;

    selectedLocale = Locales.values.firstWhere(
      (e) => e.locale.languageCode == currentLocale.languageCode,
      orElse: () => Locales.en,
    );
  }
}
