import 'package:flutter/material.dart';

enum CustomButtonSize { small, medium, large }

extension CustomButtonSizeExtension on CustomButtonSize {
  double get height {
    switch (this) {
      case CustomButtonSize.small:
        return 40.0;
      case CustomButtonSize.medium:
        return 55.0;
      case CustomButtonSize.large:
        return 70.0;
    }
  }

  double get fontSize {
    switch (this) {
      case CustomButtonSize.small:
        return 14.0;
      case CustomButtonSize.medium:
        return 16.0;
      case CustomButtonSize.large:
        return 18.0;
    }
  }

  TextStyle getTextStyle(BuildContext context, bool hasBorder) {
    final baseColor = hasBorder ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.surface;

    return TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600, color: baseColor);
  }
}
