import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import '../view_model/home_state.dart';
import '../view_model/home_view_model.dart';
import '../../../../product/state/base/base_state.dart';

import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/init/language/locales.dart';
import '../../../../product/init/language/product_localization.dart';
import 'mixin/home_view_mixin.dart';

part 'widget/home_app_bar.dart';
part 'widget/user_list.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: Scaffold(
        appBar: _HomeAppBar(title: Text(LocaleKeys.home_title).tr()),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            homeViewModel.fetchUsers();
          },
          label: Text(LocaleKeys.home_home_get_users).tr(),
          icon: const Icon(Icons.download),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SwitchListTile(
                value: productViewModel.state.themeMode == ThemeMode.dark,
                title: Text(LocaleKeys.home_change_theme).tr(),
                onChanged: (value) {
                  if (value == false) {
                    productViewModel.changeThemeMode(ThemeMode.light);
                  } else {
                    productViewModel.changeThemeMode(ThemeMode.dark);
                    
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    LocaleKeys.general_language_change_language,
                    style: Theme.of(context).textTheme.titleMedium,
                  ).tr(),
                  DropdownButton<Locales>(
                    value: selectedLocale,
                    items:
                        Locales.values.map((locale) {
                          return DropdownMenuItem<Locales>(value: locale, child: Text(locale.name));
                        }).toList(),
                    onChanged: (Locales? newLocale) async {
                      if (newLocale != null) {
                        ProductLocalization.updateLanguage(context: context, value: newLocale);
                      }
                    },
                  ),
                ],
              ),
              Expanded(child: _UserList()),
            ],
          ),
        ),
      ),
    );
  }
}
