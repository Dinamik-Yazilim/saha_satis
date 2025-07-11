import 'package:auto_route/auto_route.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:dinamik10_pos/product/common/widget/custom_appbar.dart';
import 'package:dinamik10_pos/product/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

import '../../../../product/init/language/locale_keys.g.dart';

@RoutePage()
class StockDetailView extends StatelessWidget {
  const StockDetailView({super.key, required this.stok});
  final StockCardModel stok;
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: [GeneralTabRoute(stok: stok), PriceTabRoute(stok: stok), DepotTabRoute(stok: stok)],
      builder: (context, child, controller) {
        return Scaffold(
          appBar: CustomAppBar(
            title: Text(LocaleKeys.stock_stock_detail).tr(),
            leading: AutoLeadingButton(color: context.general.colorScheme.primary),
            bottom: TabBar(
              controller: controller,
              tabs: [
                Tab(text: LocaleKeys.stock_general.tr(), icon: Icon(BootstrapIcons.info_circle_fill)),
                Tab(text: LocaleKeys.stock_price.tr(), icon: Icon(BootstrapIcons.tags_fill)),
                CustomBadgesWidget(
                  isShow: true,
                  child: Tab(text: LocaleKeys.stock_warehouse.tr(), icon: Icon(BootstrapIcons.house_fill)),
                ),
              ],
            ),
          ),
          body: child,
        );
      },
    );
  }
}
