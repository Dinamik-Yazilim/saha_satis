import 'package:flutter/foundation.dart';

import '../model/sync_item.dart';  


@immutable
final class SynchronizationState {
  // General synchronization message
  final ValueNotifier<String> overallSyncMessageNotifier;
  // Status of all synchronization steps (for list view)
  final ValueNotifier<List<SyncItem>> syncItemsNotifier;
  // The current step and total step for general progress
  final ValueNotifier<int> currentGlobalStepNotifier;
  final ValueNotifier<int> totalGlobalStepsNotifier;

  const SynchronizationState({
    required this.overallSyncMessageNotifier,
    required this.syncItemsNotifier,
    required this.currentGlobalStepNotifier,
    required this.totalGlobalStepsNotifier,
  });

  // CopyWith method (if you can be updated if additional state areas are added)
  SynchronizationState copyWith({
    ValueNotifier<String>? overallSyncMessageNotifier,
    ValueNotifier<List<SyncItem>>? syncItemsNotifier,
    ValueNotifier<int>? currentGlobalStepNotifier,
    ValueNotifier<int>? totalGlobalStepsNotifier,
  }) {
    return SynchronizationState(
      overallSyncMessageNotifier: overallSyncMessageNotifier ?? this.overallSyncMessageNotifier,
      syncItemsNotifier: syncItemsNotifier ?? this.syncItemsNotifier,
      currentGlobalStepNotifier: currentGlobalStepNotifier ?? this.currentGlobalStepNotifier,
      totalGlobalStepsNotifier: totalGlobalStepsNotifier ?? this.totalGlobalStepsNotifier,
    );
  }
}