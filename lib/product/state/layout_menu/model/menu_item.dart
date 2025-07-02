import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuItem {
  final String id;
  final String? microId;
  final String title;
  final IconData? icon;
  final List<String> requiredPermissions;
  final List<MenuItem>? children;
  final PageRouteInfo? route;
  bool isFavorite;

  MenuItem({
    required this.id,
    required this.title,
    this.microId,
    this.icon,
    required this.requiredPermissions,
    this.children,
    this.route,
    this.isFavorite = false,
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

  MenuItem copyWith({
    String? id,
    ValueGetter<String?>? microId,
    String? title,
    ValueGetter<IconData?>? icon,
    List<String>? requiredPermissions,
    ValueGetter<List<MenuItem>?>? children,
    ValueGetter<PageRouteInfo?>? route,
    bool? isFavorite,
  }) {
    return MenuItem(
      id: id ?? this.id,
      microId: microId != null ? microId() : this.microId,
      title: title ?? this.title,
      icon: icon != null ? icon() : this.icon,
      requiredPermissions: requiredPermissions ?? this.requiredPermissions,
      children: children != null ? children() : this.children,
      route: route != null ? route() : this.route,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
