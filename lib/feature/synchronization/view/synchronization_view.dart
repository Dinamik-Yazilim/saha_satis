import 'package:dinamik10_pos/feature/synchronization/view/mixin/synchronization_mixin.dart';
import 'package:dinamik10_pos/product/common/widget/custom_appbar.dart';
import 'package:dinamik10_pos/product/state/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

import '../model/sync_item.dart';
import '../model/sync_status_enum.dart';
import '../view_model/synchronization_state.dart';
import '../view_model/synchronization_view_model.dart';

part 'widget/synchronization_dialog_widget.dart';
part 'widget/synchronization_list_widget.dart';

@RoutePage()
class SynchronizationView extends StatefulWidget {
  final bool showAsDialog;
  final PageRouteInfo? redirectToRoute;
  final bool clearExisting;

  const SynchronizationView({super.key, this.showAsDialog = false, this.redirectToRoute, required this.clearExisting});

  @override
  State<SynchronizationView> createState() => _SynchronizationViewState();
}

class _SynchronizationViewState extends BaseState<SynchronizationView> with SynchronizationMixin {
  @override
  Widget build(BuildContext context) {
    return widget.showAsDialog
        ? const _SynchronizationDialogWidget()
        : _SynchronizationListWidget(synchronizationViewModel: synchronizationViewModel);
  }
}
