import 'package:auto_route/auto_route.dart';
import 'package:dinamik10_pos/feature/setting/view/mixin/setting_mixin.dart';
import 'package:dinamik10_pos/product/common/widget/custom_appbar.dart';
import 'package:dinamik10_pos/product/router/app_router.dart';
import 'package:dinamik10_pos/product/state/base/base_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/init/language/locales.dart';
import '../../../product/init/language/product_localization.dart';
part 'widget/setting_card.dart';

@RoutePage()
class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends BaseState<SettingView> with SettingMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(LocaleKeys.menu_settings).tr(),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: context.general.colorScheme.primary),
          onPressed: () {
            context.router.replace(LayoutRoute());
          },
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          _SettingCard(
            children: [
              SwitchListTile(
                value: productViewModel.state.themeMode == ThemeMode.dark,
                title: Row(
                  children: [
                    Icon(Icons.dark_mode),
                    SizedBox(width: 15),
                    Text(LocaleKeys.home_change_theme, style: context.general.textTheme.titleMedium).tr(),
                  ],
                ),
                onChanged: (value) {
                  if (value == false) {
                    productViewModel.changeThemeMode(ThemeMode.light);
                  } else {
                    productViewModel.changeThemeMode(ThemeMode.dark);
                  }
                },
              ),
              ListTile(
                leading: Icon(BootstrapIcons.translate),
                title:
                    Text(
                      LocaleKeys.general_language_change_language,
                      style: context.general.textTheme.titleMedium,
                    ).tr(),
                trailing: DropdownButton<Locales>(
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
