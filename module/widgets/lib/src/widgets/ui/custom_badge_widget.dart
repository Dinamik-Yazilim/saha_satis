import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class CustomBadgesWidget extends StatelessWidget {
  const CustomBadgesWidget({super.key, required this.isShow, required this.child, this.badgeContent});

  final bool? isShow;
  final Widget child;
  final Widget? badgeContent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return badges.Badge(
      showBadge: isShow ?? false == true,
      ignorePointer: false,
      badgeContent: badgeContent ?? Icon(Icons.wifi, color: Colors.green, size: 20),
      position: badges.BadgePosition.topEnd(top: 5, end: 5),
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.square,
        badgeColor: colorScheme.primary.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(5),
        //   borderSide: BorderSide(color: colorScheme.onSecondary, width: 1),
        elevation: 10,
      ),
      child: SizedBox(width: double.infinity, child: child),
    );
  }
}
