
part of '../login_view.dart';
class _LoginButton extends StatelessWidget {
  const _LoginButton({required this.loginViewModel});

  final LoginViewModel loginViewModel;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.router.replace(const HomeRoute());
        } else if (state.errorMessage != null) {
          customShowDialogGeneric(context, alertEnum: AlertEnum.error, subTitle: state.errorMessage ?? '');
        }
      },
      child: CustomLoadingButton(
        hasBorder: false,
        onPressed: () async {
          await loginViewModel.login();
        },
        title: LocaleKeys.login_title.tr(),
      ),
    );
  }
}
