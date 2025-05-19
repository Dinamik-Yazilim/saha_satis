import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({super.key, required this.title, this.bottom});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [],
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app, color: Theme.of(context).primaryColor)),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(bottom == null ? kToolbarHeight : 125);
}
