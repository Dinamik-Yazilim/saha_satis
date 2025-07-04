import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dinamik10_pos/product/service/interface/sync_get_operation.dart';

import '../../../product/state/base/base_cubit.dart';
import '../model/sync_item.dart';
import '../model/sync_status_enum.dart';
import 'synchronization_state.dart';

class SynchronizationViewModel extends BaseCubit<SynchronizationState> {
  SynchronizationViewModel({required SyncGetOperation syncGetOperation})
    : _syncGetOperation = syncGetOperation,
      super(
        SynchronizationState(
          overallSyncMessageNotifier: ValueNotifier<String>('Senkronizasyon başlatılıyor...'),
          syncItemsNotifier: ValueNotifier<List<SyncItem>>([]),
          currentGlobalStepNotifier: ValueNotifier<int>(0),
          totalGlobalStepsNotifier: ValueNotifier<int>(0),
        ),
      ) {
    _initializeSyncOperations();
  }

  late final SyncGetOperation _syncGetOperation;

  // Method that defines synchronization procedures
  void _initializeSyncOperations() {
    state.syncItemsNotifier.value = [
      // state.syncItemsNotifier access through
      SyncItem(key: 'warehouses', name: 'Depolar', syncFunction: _syncGetOperation.getWareHouses),
      SyncItem(key: 'barcode', name: 'Barkodlar', syncFunction: _syncGetOperation.getBarcodes),
      SyncItem(key: 'cash_boxes', name: 'Kasalar', syncFunction: _syncGetOperation.getCashBoxes),
      SyncItem(key: 'customer_accounts', name: 'Cari Heaplar', syncFunction: _syncGetOperation.getCustomerAccounts),
      SyncItem(
        key: 'customer_addresses',
        name: 'Cari Hesap Adresleri',
        syncFunction: _syncGetOperation.getCustomerAddresses,
      ),
      SyncItem(key: 'payment_plans', name: 'Ödeme Planları', syncFunction: _syncGetOperation.getPaymentPlans),
      SyncItem(
        key: 'personnel_definitions',
        name: 'Cari Personel Tanımları',
        syncFunction: _syncGetOperation.getPersonnelDefinitions,
      ),
      SyncItem(
        key: 'responsibility_centers',
        name: 'Sorumluluk Merkezleri',
        syncFunction: _syncGetOperation.getResponsibilityCenters,
      ),
      SyncItem(
        key: 'stock_sale_price_lists',
        name: 'Stok Satış Fiyat Listeleri',
        syncFunction: _syncGetOperation.getStokSalePriceList,
      ),
      SyncItem(
        key: 'stock_sales_prices',
        name: 'Stok Satış Fiyatları',
        syncFunction: _syncGetOperation.getStokSalePrice,
      ),
      SyncItem(key: 'stocks', name: 'Stoklar', syncFunction: _syncGetOperation.getStocks),
      SyncItem(key: 'bank', name: 'Bankalar', syncFunction: _syncGetOperation.getBanks),
      SyncItem(key: 'payment_orders', name: 'Ödeme Emirleri', syncFunction: _syncGetOperation.getPaymentOrders),
      SyncItem(key: 'projects', name: 'Projeler', syncFunction: _syncGetOperation.getProjects),
      SyncItem(key: 'tax', name: 'Vergiler', syncFunction: _syncGetOperation.getTaxDefinitions),
      /* SyncItem(
        key: 'customer_account_movements',
        name: 'Cari hesap hareketleri',
        syncFunction: _syncGetOperation.getCustomerAccountMovements,
      ), */
      //  SyncItem(key: 'orders', name: 'Siparişler', syncFunction: _syncGetOperation.getOrders),
      // SyncItem(key: 'stock_movements', name: 'Stok Hareketleri', syncFunction: _syncGetOperation.getStokMovements),
    ];
    state.totalGlobalStepsNotifier.value = state.syncItemsNotifier.value.length;
    state.overallSyncMessageNotifier.value = 'Senkronizasyon başlatılıyor...';
  }

  /// General synchronization method.
  Future<bool> startGeneralSync({bool clearExisting = false, Function(bool success)? onSyncComplete}) async {
    state.currentGlobalStepNotifier.value = 0; // Reset your step meter

    bool allSyncSuccess = true;

    try {
      for (int i = 0; i < state.syncItemsNotifier.value.length; i++) {
        final currentSyncItem = state.syncItemsNotifier.value[i];

        state.currentGlobalStepNotifier.value = i + 1;
        currentSyncItem.statusNotifier.value = SyncStatusEnum.inProgress;
        currentSyncItem.messageNotifier.value = 'Senkronizasyon başlatılıyor...';
        state.overallSyncMessageNotifier.value =
            'Adım ${state.currentGlobalStepNotifier.value}/${state.totalGlobalStepsNotifier.value}: ${currentSyncItem.name} senkronize ediliyor...';

        final bool success = await currentSyncItem.syncFunction(
          clearExisting: clearExisting,
          onProgressUpdate: (message) {
            currentSyncItem.messageNotifier.value = message;
            state.overallSyncMessageNotifier.value =
                'Adım ${state.currentGlobalStepNotifier.value}/${state.totalGlobalStepsNotifier.value}: ${currentSyncItem.name} $message';
          },
        );

        if (success) {
          currentSyncItem.statusNotifier.value = SyncStatusEnum.success;
          currentSyncItem.messageNotifier.value = currentSyncItem.messageNotifier.value;
        } else {
          currentSyncItem.statusNotifier.value = SyncStatusEnum.failed;
          currentSyncItem.messageNotifier.value = currentSyncItem.messageNotifier.value;
          allSyncSuccess = false;
        }

        //await Future.delayed(const Duration(milliseconds: 0));
      }

      if (allSyncSuccess) {
        state.overallSyncMessageNotifier.value = 'Tüm senkronizasyon görevleri başarıyla tamamlandı!';
      } else {
        state.overallSyncMessageNotifier.value = 'Bazı senkronizasyon görevleri başarısız oldu.';
      }
      await Future.delayed(const Duration(milliseconds: 100));
      onSyncComplete?.call(allSyncSuccess);
      return allSyncSuccess;
    } catch (e, st) {
      state.overallSyncMessageNotifier.value =
          'Genel senkronizasyon sırasında beklenmedik bir hata oluştu: ${e.toString()}';
      AppLogger.error('An unexpected error occurred during general sync: $e', e, st);
      allSyncSuccess = false;
      await Future.delayed(const Duration(seconds: 2));
      onSyncComplete?.call(allSyncSuccess);
      return false;
    } finally {}
  }
}
