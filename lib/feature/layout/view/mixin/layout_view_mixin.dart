import 'package:auto_route/auto_route.dart';
import 'package:dinamik10_pos/feature/layout/view/layout_view.dart';
import 'package:dinamik10_pos/feature/layout/view_model/layout_view_model.dart';
import 'package:dinamik10_pos/product/state/base/base_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';

import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/state/layout_menu/model/menu_item.dart';

mixin LayoutViewMixin on BaseState<LayoutView> {
  late final LayoutViewModel _layoutViewModel;
  LayoutViewModel get layoutViewModel => _layoutViewModel;
  @override
  void initState() {
    super.initState();
    _layoutViewModel = LayoutViewModel();
  }

  //TODO: Bu liste disaridan gelecek loginden alinacak
  final List<String> _userPermissions = [
    'can_view_purchase',
    'can_view_purchase_invoice',
    'can_view_purchase_delivery_note',
    'can_view_purchase_return',
    'can_view_sale',
    'can_view_sale_invoice',
    'can_view_sale_delivery_note',
    'can_view_reports',
    'can_manage_settings',
    'can_view_card',
    'can_view_stock',
    'can_view_current',
  ];
  static const List<Color> _corporateColors = [
    Color(0xFFf2e8cf),
    Color(0xffF4E285),
    Color(0xff577590),
    Color(0xFFB8C2C9),
    Color(0xffFCAA67),
    Color(0xFFbc4749),
    Color(0xFFa8dadc),
    Color(0xFFC3DD8C),
    Color(0xffe76f51),
  ];
  Color getCardBaseColor(int index) {
    return _corporateColors[index % _corporateColors.length];
  }

  Color getContentColor() {
    return Colors.blueGrey[800]!;
  }

  bool canAccess(MenuItem item) {
    return item.requiredPermissions.any((permission) => _userPermissions.contains(permission));
  }

  void onMenuItemTap(MenuItem item) {
    if (canAccess(item)) {
      if (item.hasRoute) {
        AutoRouter.of(context).push(item.route!);
      } else if (item.isExpandable) {
        context.read<LayoutViewModel>().navigateToSubMenu(item);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Hata: Genişletilebilir öğenin alt menüsü yok veya boş.')));
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Bu menüye erişim yetkiniz bulunmamaktadır.')));
    }
  }

  void onMenuItemLongPress(MenuItem item, LayoutViewModel layoutViewModel) {
    final isCurrentlyFavorite = layoutViewModel.isMenuItemFavorite(item);
    customShowDialogGeneric(
      context,
      alertEnum: AlertEnum.info,
      subTitle:
          isCurrentlyFavorite
              ? LocaleKeys.layout_favoriteDialog_removeContent.tr()
              : LocaleKeys.layout_favoriteDialog_addContent.tr(),
      okButtonTitle: LocaleKeys.general_dialog_yes.tr(),
      okButtonFunction: () async {
        layoutViewModel.toggleFavorite(item);
        customShowDialogGeneric(
          context,
          alertEnum: AlertEnum.success,
          subTitle:
              layoutViewModel.isMenuItemFavorite(item)
                  ? LocaleKeys.layout_favoriteDialog_addedMessage.tr(args: [item.title.tr()])
                  : LocaleKeys.layout_favoriteDialog_removedMessage.tr(args: [item.title.tr()]),
          offTime: 1000,
        );
      },
      cancelButtonTitle: LocaleKeys.general_dialog_no.tr(),
    );
  }

  @override
  void dispose() {
    layoutViewModel.close();
    super.dispose();
  }
}
