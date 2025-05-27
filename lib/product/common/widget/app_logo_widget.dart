import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: ProjectBorderRadius.normal(),
          color: Theme.of(context).colorScheme.primary.withAlpha(100),
        ),
        child: Assets.images.bigLogo.image(package: 'gen'),
      ),
    );
  }
}
