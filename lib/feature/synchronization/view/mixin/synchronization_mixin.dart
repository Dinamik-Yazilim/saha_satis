import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../product/state/base/base_state.dart';
import '../../view_model/synchronization_view_model.dart';
import '../synchronization_view.dart';

mixin SynchronizationMixin on BaseState<SynchronizationView> {
  late final SynchronizationViewModel _synchronizationViewModel;

  SynchronizationViewModel get synchronizationViewModel => _synchronizationViewModel;

  @override
  void initState() {
    super.initState();
    _synchronizationViewModel = context.read<SynchronizationViewModel>();
    syncPopupController();
  }

  // Method that controls popup synchronization
  void syncPopupController() {
    if (widget.showAsDialog) {
      // If it is to be shown as dialogue, start synchronization immediately
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _synchronizationViewModel.startGeneralSync(
          clearExisting: widget.clearExisting,
          onSyncComplete: (success) {
            // Guide when synchronization is completed
            if (widget.redirectToRoute != null) {
              context.router.replace(widget.redirectToRoute!);
            } else {
              // If you don't have a RedirectToRoute, this screen is pop
              context.router.pop();
            }
          },
        );
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
