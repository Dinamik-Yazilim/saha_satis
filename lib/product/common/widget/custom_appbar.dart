import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;
  final bool? isExit;

  const CustomAppBar({super.key, required this.title, this.bottom, this.isExit});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [],
      leading:
          isExit == null || isExit == false
              ? SizedBox()
              : IconButton(
                onPressed: () {},
                icon: Icon(Icons.exit_to_app, color: Theme.of(context).primaryColor, size: 28),
              ),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(bottom == null ? kToolbarHeight : 125);
}
