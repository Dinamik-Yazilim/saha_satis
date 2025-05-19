import 'package:easy_localization/easy_localization.dart';

import '../../init/language/locale_keys.g.dart';

String? emptyValidator(String? value) {
  if (value == null || value.isEmpty) {
    return LocaleKeys.general_validation_required.tr(args: ['']);
  }
  return null;
}
