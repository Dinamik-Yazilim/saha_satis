import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class AppBarBottomWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBottomWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(padding: ProjectPadding.allLarge(), child: child),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(20 + 75.0);
}
