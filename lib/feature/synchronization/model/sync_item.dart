import 'package:flutter/material.dart';

import 'sync_status_enum.dart';

class SyncItem {
  final String key;
  final String name;
  final Future<bool> Function({bool clearExisting, ValueChanged<String>? onProgressUpdate}) syncFunction;

  // ValueNotifier for each item's own status and message
  final ValueNotifier<SyncStatusEnum> statusNotifier;
  final ValueNotifier<String> messageNotifier;

  SyncItem({
    required this.key,
    required this.name,
    required this.syncFunction,
    SyncStatusEnum initialStatus = SyncStatusEnum.pending,
    String initialMessage = 'Senkronizasyon bekleniyor',
  }) : statusNotifier = ValueNotifier(initialStatus),
       messageNotifier = ValueNotifier(initialMessage);

  // The auxiliary method that rotates icon according to the situation
  IconData get statusIcon {
    switch (statusNotifier.value) {
      case SyncStatusEnum.pending:
        return Icons.watch_later_outlined;
      case SyncStatusEnum.inProgress:
        return Icons.cached;
      case SyncStatusEnum.success:
        return Icons.check_circle_outline;
      case SyncStatusEnum.failed:
        return Icons.error_outline;
    }
  }

  // The auxiliary method that rotates icon color according to the situation
  Color get statusIconColor {
    switch (statusNotifier.value) {
      case SyncStatusEnum.pending:
        return Colors.grey;
      case SyncStatusEnum.inProgress:
        return Colors.blue;
      case SyncStatusEnum.success:
        return Colors.green;
      case SyncStatusEnum.failed:
        return Colors.red;
    }
  }
}
