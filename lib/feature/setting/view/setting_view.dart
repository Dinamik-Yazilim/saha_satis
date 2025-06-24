import 'package:auto_route/auto_route.dart';
import 'package:dinamik10_pos/feature/setting/view/mixin/setting_mixin.dart';
import 'package:dinamik10_pos/product/common/widget/custom_appbar.dart';
import 'package:dinamik10_pos/product/router/app_router.dart';
import 'package:dinamik10_pos/product/state/base/base_state.dart';
import 'package:dinamik10_pos/product/state/view_model/product_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/init/language/locales.dart';
import '../../../product/init/language/product_localization.dart';
import '../../../product/state/layout_menu/model/app_layout_enum.dart';
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
              ListTile(
                leading: Icon(BootstrapIcons.grid_3x3_gap_fill),
                title: Text(LocaleKeys.settings_app_layout, style: context.general.textTheme.titleMedium).tr(),
                trailing: DropdownButton<AppLayouts>(
                  value: appLayoutFromString(context.watch<ProductViewModel>().state.appLayout) ?? AppLayouts.grid,
                  items:
                      AppLayouts.values.map((layout) {
                        return DropdownMenuItem<AppLayouts>(
                          value: layout,
                          child: Text(
                            layout == AppLayouts.grid
                                ? 'Izgara Düzeni'
                                : layout == AppLayouts.list
                                ? 'Liste Düzeni'
                                : layout.toShortString(),
                          ),
                        );
                      }).toList(),
                  onChanged: (AppLayouts? newLayout) {
                    if (newLayout != null) {
                      productViewModel.changeAppLayout(newLayout);
                    }
                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text(LocaleKeys.settings_version, style: context.general.textTheme.titleMedium).tr(),
                onTap: () {
                  //  context.router.push(AboutRoute());
                },
              ),
            ],
          ),
          _SettingCard(
            children: [
              ListTile(
                leading: Icon(Icons.logout, color: context.general.colorScheme.error),
                title: Text(LocaleKeys.settings_app_exit, style: context.general.textTheme.titleMedium).tr(),
                onTap: () {
                  productViewModel.changeToken('');
                  context.router.replaceAll([LoginRoute()]);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
