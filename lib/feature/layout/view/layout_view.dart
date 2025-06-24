import 'package:dinamik10_pos/feature/layout/view/mixin/layout_view_mixin.dart';
import 'package:dinamik10_pos/product/common/widget/custom_appbar.dart';
import 'package:dinamik10_pos/product/init/language/locale_keys.g.dart';
import 'package:dinamik10_pos/product/state/base/base_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:kartal/kartal.dart';

import '../../../product/state/layout_menu/model/app_layout_enum.dart';
import '../view_model/layout_view_model.dart';
import '../view_model/layout_state.dart';

import '../../../product/state/layout_menu/model/menu_item.dart';
import 'package:widgets/widgets.dart';

part 'widget/layout_grid_widget.dart';
part 'widget/layout_list_widget.dart';
part 'widget/layout_appbar_widget.dart';

@RoutePage()
class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends BaseState<LayoutView> with LayoutViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => layoutViewModel,
      child: Scaffold(
        appBar: _LayoutAppBarWidget(),
        body: BlocBuilder<LayoutViewModel, LayoutState>(
          builder: (context, layoutState) {
            final currentAppLayout = appLayoutFromString(productViewModel.state.appLayout) ?? AppLayouts.grid;
            if (layoutState.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (layoutState.errorMessage != null) {
              return Center(child: Text('Error: ${layoutState.errorMessage}'));
            }
            final visibleMenuItems =
                layoutState.currentMenuItems.where((item) {
                  return canAccess(item);
                }).toList();

            /// [AppLayouts.grid]
            if (currentAppLayout == AppLayouts.grid) {
              return AdaptMobileView(
                phone: _layoutBodyGrid(
                  visibleMenuItems,
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.2,
                ),
                tablet: _layoutBodyGrid(
                  visibleMenuItems,
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                ),
              );

              /// [AppLayouts.list]
            } else if (currentAppLayout == AppLayouts.list) {
              return ListView.builder(
                padding: ProjectPadding.allNormal(),
                itemCount: visibleMenuItems.length,
                itemBuilder: (context, index) {
                  final item = visibleMenuItems[index];
                  return _LayoutListWidget(menuItem: item, onTapCallback: onMenuItemTap);
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  GridView _layoutBodyGrid(
    List<MenuItem> visibleMenuItems, {
    required int crossAxisCount,
    required double crossAxisSpacing,
    required double mainAxisSpacing,
    required double childAspectRatio,
  }) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: visibleMenuItems.length,
      itemBuilder: (context, index) {
        final item = visibleMenuItems[index];
        return _LayoutGridWidget(
          menuItem: item,
          cardBaseColor: getCardBaseColor(index),
          contentColor: getContentColor(),
          onTap: () {
            if (canAccess(item)) {
              if (item.hasRoute) {
                AutoRouter.of(context).push(item.route!);
              } else if (item.isExpandable) {
                context.read<LayoutViewModel>().navigateToSubMenu(item);
              }
            } else {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Bu menüye erişim yetkiniz bulunmamaktadır.')));
            }
          },
        );
      },
    );
  }
}
