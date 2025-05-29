import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class MenuItem {
  final String id;
  final String title;
  final IconData? icon;
  final List<String> requiredPermissions;
  final List<MenuItem>? children;
  final PageRouteInfo? route;

  MenuItem({
    required this.id,
    required this.title,
    this.icon,
    required this.requiredPermissions,
    this.children,
    this.route,
  }) : assert(
         (children != null && children.isNotEmpty && route == null) ||
             (children == null && route != null) ||
             (children == null && route == null),
         'MenuItem must have either children or a route, but not both. Or it can be a non-navigable title.',
       );

  // Check whether a menu item is expandable
  bool get isExpandable => children != null && children!.isNotEmpty;
  // Checks if a menu element has a route
  bool get hasRoute => route != null;
}
