import 'package:flutter/material.dart';
import 'login_state.dart';
import '../../../product/state/base/base_cubit.dart';

class LoginViewModel extends BaseCubit<LoginState> {
  LoginViewModel() : super(const LoginState());

  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    final email = emailC.text;
    final password = passwordC.text;

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      await Future.delayed(const Duration(seconds: 1));

      if (email == "d@d.com" && password == "d") {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: "Geçersiz kullanıcı bilgisi"));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void dispose() {
    emailC.dispose();
    passwordC.dispose();
  }
}
