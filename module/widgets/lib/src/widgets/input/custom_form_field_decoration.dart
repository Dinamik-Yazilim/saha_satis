import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../utility/project_border.dart';

InputDecoration customFormFieldDecoration(
  BuildContext context, {
  required String labelText,
  Widget? suffixIcon,
  Widget? prefixIcon,
  Color? fillColor,
}) {
  final theme = Theme.of(context);
  final textTheme = theme.textTheme;
  final colorScheme = theme.colorScheme;

  final borderRadius = ProjectBorderRadius.large();

  OutlineInputBorder border(Color color, {double width = 1.0}) {
    return OutlineInputBorder(borderRadius: borderRadius, borderSide: BorderSide(color: color, width: width));
  }

  return InputDecoration(
    filled: true,
    fillColor: colorScheme.surface,
    labelText: labelText,
    labelStyle: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    enabledBorder: border(colorScheme.outlineVariant),
    focusedBorder: border(colorScheme.primary, width: 1.5),
    errorBorder: border(colorScheme.error),
    focusedErrorBorder: border(colorScheme.error, width: 1.5),
    contentPadding: EdgeInsets.symmetric(vertical: ResponsiveBreakpoints.of(context).isMobile ? 15 : 25),
  );
}
