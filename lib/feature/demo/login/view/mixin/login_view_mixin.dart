import '../../../../../product/state/base/base_state.dart';
import '../../view_model/login_view_model.dart';
import '../login_view.dart';

mixin LoginViewMixin on BaseState<LoginView> {
  late final LoginViewModel _loginViewModel;
  LoginViewModel get loginViewModel => _loginViewModel;
  @override
  void initState() {
    super.initState();
    _loginViewModel = LoginViewModel();
  }
}
