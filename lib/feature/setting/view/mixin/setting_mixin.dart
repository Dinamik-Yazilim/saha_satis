import 'package:dinamik10_pos/feature/setting/view/setting_view.dart';
import 'package:dinamik10_pos/product/state/base/base_state.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../product/init/language/locales.dart';

mixin SettingMixin on BaseState<SettingView> {
  late Locales selectedLocale;
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final currentLocale = context.locale;

    selectedLocale = Locales.values.firstWhere(
      (e) => e.locale.languageCode == currentLocale.languageCode,
      orElse: () => Locales.en,
    );
  }
}
