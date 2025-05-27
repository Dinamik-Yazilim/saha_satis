import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_color_scheme.dart';
import 'custom_theme.dart';

/// Custom light theme for project design
final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.urbanist().fontFamily,
    colorScheme: CustomColorScheme.lightColorScheme,
    floatingActionButtonTheme: floatingActionButtonThemeData,
    appBarTheme: appBarTheme,
    progressIndicatorTheme: progressIndicatorThemeData,
  );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData => const FloatingActionButtonThemeData();

  @override
  AppBarTheme get appBarTheme => AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      color: CustomColorScheme.lightColorScheme.primary,
    ),
    iconTheme: IconThemeData(color: CustomColorScheme.lightColorScheme.onPrimary),
    centerTitle: true,
  );

  @override
  ProgressIndicatorThemeData get progressIndicatorThemeData => ProgressIndicatorThemeData(
    color: CustomColorScheme.darkColorScheme.onPrimary,
    circularTrackColor: CustomColorScheme.darkColorScheme.secondary,
    strokeWidth: 4,
  );
}
