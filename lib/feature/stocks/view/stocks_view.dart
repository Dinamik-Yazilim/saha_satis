import 'package:auto_route/auto_route.dart';
import 'package:dinamik10_pos/product/common/widget/custom_appbar.dart';
import 'package:dinamik10_pos/product/init/language/locale_keys.g.dart';
import 'package:dinamik10_pos/product/router/app_router.dart';
import 'package:dinamik10_pos/product/state/base/base_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

import '../../../product/common/widget/loading_list_widget.dart';
import '../../../product/common/widget/row_test_widget.dart';
import '../view_model/stock_state.dart';
import '../view_model/stock_view_model.dart';
import 'mixin/stock_view_mixin.dart';
import 'widget/stock_search_and_find_widget.dart';
part 'widget/stock_card_list.dart';

@RoutePage()
class StocksView extends StatefulWidget {
  const StocksView({super.key});

  @override
  State<StocksView> createState() => _StocksViewState();
}

class _StocksViewState extends BaseState<StocksView> with StockViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => stockViewModel,
      child: Scaffold(
        appBar: CustomAppBar(title: Text(LocaleKeys.menu_stock).tr()),
        body: Container(
          decoration: BoxDecoration(
            color: context.general.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          padding: ProjectPadding.allSmall(),
          child: Column(
            children: [
              StockSearchAndFindWidget(searchController: searchController),
              SizedBox(height: 8),
              Expanded(child: _StockCardList()),
            ],
          ),
        ),
      ),
    );
  }
}
