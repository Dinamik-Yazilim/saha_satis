import 'package:dinamik10_pos/product/init/language/locale_keys.g.dart';
import 'package:dinamik10_pos/product/router/app_router.dart';
import 'package:flutter/material.dart';
import '../model/menu_item.dart';

class MenuRepository {
  // The place where we define the entire menu structure of the application
  static final List<MenuItem> _allMenuItems = [
    MenuItem(
      id: 'alis_evraklari',
      title: LocaleKeys.menu_purchase_documents,
      icon: Icons.receipt_long,
      requiredPermissions: ['can_view_purchase'],
      children: [
        MenuItem(
          id: 'alis_faturasi',
          title: LocaleKeys.menu_purchase_invoice,
          icon: Icons.description,
          route: const SettingRoute(),
          requiredPermissions: ['can_view_purchase_invoice'],
        ),
        MenuItem(
          id: 'alis_irsaliyesi',
          title: LocaleKeys.menu_sales_delivery_note,
          icon: Icons.delivery_dining,
          route: const SettingRoute(),
          requiredPermissions: ['can_view_purchase_delivery_note'],
        ),
        MenuItem(
          id: 'alis_iadesi',
          title: LocaleKeys.menu_purchase_return,
          icon: Icons.assignment_return,
          route: const SettingRoute(),
          requiredPermissions: ['can_view_purchase_return'],
        ),
      ],
    ),
    MenuItem(
      id: 'satis_evraklari',
      title: LocaleKeys.menu_sales_documents,
      icon: Icons.point_of_sale,
      requiredPermissions: ['can_view_sale'],
      children: [
        MenuItem(
          id: 'satis_faturasi',
          title: LocaleKeys.menu_sales_invoice,
          icon: Icons.receipt_long,
          route: const SettingRoute(),
          requiredPermissions: ['can_view_sale_invoice'],
        ),
        MenuItem(
          id: 'satis_irsaliyesi',
          title: LocaleKeys.menu_sales_delivery_note,
          icon: Icons.local_shipping,
          route: const SettingRoute(),
          requiredPermissions: ['can_view_sale_delivery_note'],
        ),
      ],
    ),
    MenuItem(
      id: 'raporlar',
      title: LocaleKeys.menu_reports,
      icon: Icons.bar_chart,
      route: const HomeRoute(),
      requiredPermissions: ['can_view_reports'],
    ),
    MenuItem(
      id: 'ayarlar',
      title: LocaleKeys.menu_settings,
      icon: Icons.settings,
      route: const SettingRoute(),
      requiredPermissions: ['can_manage_settings'],
    ),
  ];

  // Method that returns the main menu elements
  static List<MenuItem> getMainMenuItems() {
    // Returns the main menu items with Children or directly route.
    return _allMenuItems;
  }

  // The method of finding a menu element according to ID (in -depth search)
  static MenuItem? findMenuItemById(String id) {
    // A recursive search function
    MenuItem? searchInList(List<MenuItem> items) {
      for (var item in items) {
        if (item.id == id) {
          return item;
        }
        if (item.children != null) {
          final foundInChild = searchInList(item.children!);
          if (foundInChild != null) {
            return foundInChild;
          }
        }
      }
      return null;
    }

    return searchInList(_allMenuItems);
  }
}
