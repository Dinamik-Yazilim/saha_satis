import 'package:flutter/material.dart';

/// Project locale enum for operation and configuration
enum Locales {
  ///Turkish locale
  tr(Locale('tr', 'TR'), 'Türkçe'),

  /// English locale
  en(Locale('en', 'US'), 'English');

  /// Locale value
  final Locale locale;
  final String name;
  const Locales(this.locale, this.name);
}
