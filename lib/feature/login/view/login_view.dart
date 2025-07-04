import 'package:auto_route/auto_route.dart';
import 'package:dinamik10_pos/product/common/widget/app_logo_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'mixin/login_view_mixin.dart';
import '../view_model/login_view_model.dart';
import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/router/app_router.dart';
import '../../../product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';
import '../view_model/login_state.dart';
part 'widget/login_form_input.dart';
part 'widget/login_button.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> with LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginViewModel,
      child: Scaffold(body: SafeArea(child: AdaptMobileView(phone: _phoneUi(), tablet: _tabletUi()))),
    );
  }

  Widget _tabletUi() {
    return Padding(
      padding: ProjectPadding.allLarge(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppLogoWidget(),
          Expanded(
            child: ListView(
              children: [
                _LoginFormInput(
                  formKey: loginViewModel.formKey,
                  emailC: loginViewModel.emailC,
                  passwordC: loginViewModel.passwordC,
                ),
                _LoginButton(loginViewModel: loginViewModel),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _phoneUi() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              AppLogoWidget(),
              Padding(
                padding: ProjectPadding.allMedium(),
                child: _LoginFormInput(
                  formKey: loginViewModel.formKey,
                  emailC: loginViewModel.emailC,
                  passwordC: loginViewModel.passwordC,
                ),
              ),
            ],
          ),
        ),
        Padding(padding: ProjectPadding.allMedium(), child: _LoginButton(loginViewModel: loginViewModel)),
      ],
    );
  }
}
