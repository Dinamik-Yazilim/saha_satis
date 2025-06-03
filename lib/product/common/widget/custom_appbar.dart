import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final PreferredSizeWidget? bottom;
  final bool? isExit;
  final Widget? leading;

  const CustomAppBar({super.key, required this.title, this.bottom, this.isExit, this.leading});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: [],
      leading:
          isExit == null || isExit == false
              ? leading ?? SizedBox()
              : IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.exit_to_app,
                  color: context.general.colorScheme.error,
                  size: CustomResponsiveHelper.isMobileOrTablet(context) ? 28 : 40,
                ),
              ),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(bottom == null ? kToolbarHeight : 125);
}
