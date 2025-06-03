import 'package:flutter/widgets.dart';
import 'package:responsive_framework/responsive_framework.dart';

final class CustomResponsiveHelper {
  static bool isMobileOrTablet(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile ? true : false;
  }
}
