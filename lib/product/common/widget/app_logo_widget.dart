import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = context.general.colorScheme.primary;
    final Color lighterPrimaryColor = Color.lerp(primaryColor, Colors.black, 0.45)!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: ProjectBorderRadius.normal(),
          gradient: LinearGradient(
            colors: [primaryColor, lighterPrimaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(color: primaryColor.withValues(alpha: 0.4), blurRadius: 15, offset: const Offset(0, 8)),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(padding: const ProjectPadding.allMedium(), child: Assets.images.bigLogo.image(package: 'gen')),
      ),
    );
  }
}
