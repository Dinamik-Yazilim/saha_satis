 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'locales.dart';

/// The code is defining a class named `ProductLocalization` that extends the
/// `EasyLocalization` class.
final class ProductLocalization extends EasyLocalization {
  /// The code is defining a constructor for the `ProductLocalization` class.
  ProductLocalization({required super.child, super.key})
    : super(supportedLocales: _supportedLocales, path: _translationPath, useOnlyLangCode: true);

  static final List<Locale> _supportedLocales = [Locales.tr.locale, Locales.en.locale];
  static const String _translationPath = 'assets/translations';

  /// The function updates the language/locale of the app using the provided context and locale value.[Locales]
  static void updateLanguage({required BuildContext context, required Locales value}) async {
    Logger().i('Change Language : $value');
    return await context.setLocale(value.locale);
  }
}
