import 'package:core/core.dart';
import 'package:dinamik10_pos/feature/splash/view_model/splash_state.dart';
import 'package:dinamik10_pos/product/state/base/base_cubit.dart';

import '../../../product/state/view_model/product_view_model.dart';

class SplashViewModel extends BaseCubit<SplashState> {
  final ProductViewModel _productViewModel;
  SplashViewModel(this._productViewModel) : super(SplashState(isLoading: false));
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<bool> checkAuthStatusAndNavigate() async {
    changeLoading();
    await Future.delayed(const Duration(seconds: 2));
    final String authToken = _productViewModel.state.authToken;
    AppLogger.info('SplashViewModel: Checking auth token. Token: ${authToken.isNotEmpty ? "Found" : "Not Found"}');
    changeLoading();
    return authToken.isNotEmpty;
  }
}
