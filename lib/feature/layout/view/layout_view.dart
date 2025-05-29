import 'package:dinamik10_pos/feature/layout/view/mixin/layout_view_mixin.dart';
import 'package:dinamik10_pos/product/common/widget/custom_appbar.dart';
import 'package:dinamik10_pos/product/state/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

import '../view_model/layout_view_model.dart';
import '../view_model/layout_state.dart';

import '../../../product/state/layout_menu/model/menu_item.dart';
import 'package:widgets/widgets.dart';

part 'widget/menu_item_tile.dart';

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
        appBar: _layoutAppBar(),
        body: BlocBuilder<LayoutViewModel, LayoutState>(
          builder: (context, layoutState) {
            if (layoutState.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (layoutState.errorMessage != null) {
              return Center(child: Text('Hata: ${layoutState.errorMessage}'));
            }

            final visibleMenuItems =
                layoutState.currentMenuItems.where((item) {
                  return canAccess(item);
                }).toList();
            return _layoutBody(visibleMenuItems);
          },
        ),
      ),
    );
  }

  GridView _layoutBody(List<MenuItem> visibleMenuItems) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.2,
      ),
      itemCount: visibleMenuItems.length,
      itemBuilder: (context, index) {
        final item = visibleMenuItems[index];
        return _MenuItemTile(
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

  PreferredSizeWidget _layoutAppBar() {
    const double kToolbarHeight = 56.0;

    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: BlocBuilder<LayoutViewModel, LayoutState>(
        builder: (context, layoutState) {
          final String titleText = layoutState.breadcrumb.isNotEmpty ? layoutState.breadcrumb.last.title : 'Ana Menü';
          final bool showLeadingButton = !layoutState.isOnMainMenu;
          final bool shouldShowExitIcon = layoutState.isOnMainMenu;

          return CustomAppBar(
            title: Text(titleText),
            leading:
                showLeadingButton
                    ? IconButton(
                      icon: Icon(Icons.arrow_back_ios_new, color: Theme.of(context).colorScheme.primary),
                      onPressed: () {
                        context.read<LayoutViewModel>().goBack();
                      },
                    )
                    : const SizedBox.shrink(),
            isExit: shouldShowExitIcon,
          );
        },
      ),
    );
  }
}
