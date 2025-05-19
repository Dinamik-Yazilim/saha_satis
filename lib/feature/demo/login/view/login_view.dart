/// The line `late final UserOperation _userOperation;` in the `HomeViewModel` class is declaring a
/// late final variable `_userOperation` of type `UserOperation`.
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dinamik10_pos/feature/demo/login/view/mixin/login_view_mixin.dart';
import 'package:dinamik10_pos/feature/demo/login/view_model/login_view_model.dart';
import 'package:dinamik10_pos/product/init/language/locale_keys.g.dart';
import 'package:dinamik10_pos/product/router/app_router.dart';
import 'package:dinamik10_pos/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';
import '../../../../product/init/config/app_environment.dart';
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
      child: Scaffold(
        appBar: AppBar(title: const Text(LocaleKeys.login_title).tr()),
        body: Padding(
          padding: ProjectPadding.allMedium(),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    _LoginFormInput(
                      formKey: loginViewModel.formKey,
                      emailC: loginViewModel.emailC,
                      passwordC: loginViewModel.passwordC,
                    ),
                    SizedBox(height: 32),
                    Text("baseUrl"),
                    Text(AppEnvironmentItems.baseUrl.value, style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
              _LoginButton(loginViewModel: loginViewModel),
            ],
          ),
        ),
      ),
    );
  }
}
