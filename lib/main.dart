import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product/init/application_initialize.dart';
import 'product/init/language/product_localization.dart';
import 'product/init/state_initialize.dart';
import 'product/router/app_router.dart';
import 'product/state/view_model/product_view_model.dart';
import 'product/theme/custom_dark_theme.dart';
import 'product/theme/custom_light_theme.dart';

void main() async {
  await ApplicationInitialize().make();
  runApp(ProductLocalization(child: StateInitialize(child: _MyApp())));
}

class _MyApp extends StatelessWidget {
  const _MyApp();
  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      themeMode: context.watch<ProductViewModel>().state.themeMode,
    );
  }
}
