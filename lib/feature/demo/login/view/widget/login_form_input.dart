part of '../login_view.dart';

class _LoginFormInput extends StatelessWidget {
  const _LoginFormInput({required this.formKey, required this.emailC, required this.passwordC});
  final GlobalKey<FormState> formKey;
  final TextEditingController emailC;
  final TextEditingController passwordC;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomFormField(
            controller: emailC,
            fieldType: CustomFormFieldType.email,
            isDone: false,
            decoration: customFormFieldDecoration(
              context,
              labelText: LocaleKeys.login_email.tr(),
              prefixIcon: const Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: 16),
          CustomFormField(
            controller: passwordC,
            fieldType: CustomFormFieldType.password,
            isDone: true,
            decoration: customFormFieldDecoration(
              context,
              labelText: LocaleKeys.login_password.tr(),
              prefixIcon: const Icon(Icons.lock_outline_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
