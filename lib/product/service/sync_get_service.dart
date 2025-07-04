import 'package:core/core.dart';
import 'package:dinamik10_pos/product/cache/models/bank_model.dart';
import 'package:dinamik10_pos/product/cache/models/barcode_model.dart';
import 'package:dinamik10_pos/product/cache/models/customer_account_movements_model.dart';
import 'package:dinamik10_pos/product/cache/models/customer_accounts_model.dart';
import 'package:dinamik10_pos/product/cache/models/customer_addresses_model.dart';
import 'package:dinamik10_pos/product/cache/models/orders_model.dart';
import 'package:dinamik10_pos/product/cache/models/payment_orders_model.dart';
import 'package:dinamik10_pos/product/cache/models/payment_plans_model.dart';
import 'package:dinamik10_pos/product/cache/models/personnel_definitions_model.dart';
import 'package:dinamik10_pos/product/cache/models/responsibility_centers_model.dart';
import 'package:dinamik10_pos/product/cache/models/stock_movements_model.dart';
import 'package:dinamik10_pos/product/cache/models/stock_sale_price_lists_model.dart';
import 'package:dinamik10_pos/product/cache/models/stocks_model.dart';
import 'package:dinamik10_pos/product/cache/models/tax_model.dart';
import 'package:dinamik10_pos/product/cache/models/warehouses_model.dart';
import 'package:dinamik10_pos/product/service/interface/sync_get_operation.dart';
import 'package:flutter/foundation.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';
import 'package:get_it/get_it.dart'; // GetIt'i import ediyoruz

import '../cache/models/cashboxes_model.dart';
import '../cache/models/projects_model.dart';
import '../cache/models/stock_sales_prices_model.dart';
import '../state/view_model/product_view_model.dart';
import 'global_micro_sync_query/micro_sync_query.dart';

class SyncGetService extends SyncGetOperation {
  final int _fetchLimit = 10000; // Fetch limit for each API call
  final INetworkManager<EmptyModel> _networkManager;

  late final ProductViewModel _productViewModel;

  SyncGetService(INetworkManager<EmptyModel> networkManager) : _networkManager = networkManager {
    _productViewModel = GetIt.I<ProductViewModel>();
  }

  @override
  Future<bool> getBanks({bool clearExisting = false, ValueChanged<String>? onProgressUpdate}) async {
    return await _syncAndSave<BankModel>(
      tableName: BankModel.staticTableName,
      queryTemplate: GlobalMicroSyncQuery.banksSyncQueryTemplate,
      fromMapFactory: BankModel.fromMap,
      logPrefix: 'Banks',
      clearExisting: clearExisting,
      syncKey: 'bank',
      onProgressUpdate: onProgressUpdate,
    );
  }

  @override
  Future<bool> getBarcodes({bool clearExisting = false, ValueChanged<String>? onProgressUpdate}) async {
    return await _syncAndSave<BarcodeModel>(
      tableName: BarcodeModel.staticTableName,
      queryTemplate: GlobalMicroSyncQuery.barcodeSyncQueryTemplate,
      fromMapFactory: BarcodeModel.fromMap,
      logPrefix: 'Barcodes',
      clearExisting: clearExisting,
      syncKey: 'barcode',
      onProgressUpdate: onProgressUpdate,
    );
  }

  @override
  Future<bool> getCashBoxes({bool clearExisting = false, ValueChanged<String>? onProgressUpdate}) async {
    return await _syncAndSave<CashboxModel>(
      tableName: CashboxModel.staticTableName,
      queryTemplate: GlobalMicroSyncQuery.cashboxesSyncQueryTemplate,
      fromMapFactory: CashboxModel.fromMap,
      logPrefix: 'CashBoxes',
      clearExisting: clearExisting,
      syncKey: 'cashBox',
      onProgressUpdate: onProgressUpdate,
    );
  }

  @override
  Future<bool> getCustomerAccountMovements({bool clearExisting = false, ValueChanged<String>? onProgressUpdate}) async {
    return await _syncAndSave<CustomerAccountMovementModel>(
      tableName: CustomerAccountMovementModel.staticTableName,
      queryTemplate: GlobalMicroSyncQuery.customerAccountMovementsSyncQueryTemplate,
      fromMapFactory: CustomerAccountMovementModel.fromMap,
      logPrefix: 'CustomerAccountMovements',
      clearExisting: clearExisting,
      syncKey: 'customerAccountMovement',
      onProgressUpdate: onProgressUpdate,
    );
  }

  @override
  Future<bool> getCustomerAccounts({bool clearExisting = false, ValueChanged<String>? onProgressUpdate}) async {
    return await _syncAndSave<CustomerAccountModel>(
      tableName: CustomerAccountModel.staticTableName,
      queryTemplate: GlobalMicroSyncQuery.customerAccountsSyncQueryTemplate,
      fromMapFactory: CustomerAccountModel.fromMap,
      logPrefix: 'CustomerAccountModel',
      clearExisting: clearExisting,
      syncKey: 'customerAccountModel',
      onProgressUpdate: onProgressUpdate,
    );
  }

  @override
  Future<bool> getCustomerAddresses({bool clearExisting = false, ValueChanged<String>? onProgressUpdate}) async {
    return await _syncAndSave<CustomerAddressModel>(
      tableName: CustomerAddressModel.staticTableName,
      queryTemplate: GlobalMicroSyncQuery.customerAddressesSyncQueryTemplate,
      fromMapFactory: CustomerAddressModel.fromMap,
      logPrefix: 'CustomerAddressModel',
      clearExisting: clearExisting,
      syncKey: 'customerAddressModel',
      onProgressUpdate: onProgressUpdate,
    );
  }

  @override
  Future<bool> getOrders({bool clearExisting = false, ValueChanged<String>? onProgressUpdate}) async {
    return await _syncAndSave<OrderModel>(
      tableName: OrderModel.staticTableName,
      queryTemplate: GlobalMicroSyncQuery.ordersSyncQueryTemplate,
      fromMapFactory: OrderModel.fromMap,
      logPrefix: 'OrderModel',
      clearExisting: clearExisting,
      syncKey: 'orderModel',
      onProgressUpdate: onProgressUpdate,
    );
  }

  @override
  Future<bool> getPaymentOrders({bool clearExisting = false, ValueChanged<String>? onProgressUpdate}) async {
    return await _syncAndSave<PaymentOrderModel>(
      tableName: PaymentOrderModel.staticTableName,
      queryTemplate: GlobalMicroSyncQuery.paymentOrdersSyncQueryTemplate,
      fromMapFactory: PaymentOrderModel.fromMap,
      logPrefix: 'PaymentOrderModel',
      clearExisting: clearExisting,
      syncKey: 'paymentOrderModel',
      onProgressUpdate: onProgressUpdate,
    );
  }

  @override
  Future<bool> getPaymentPlans({bool clearExisting = false, ValueChanged<String>? onProgressUpdate}) async {
    return await _syncAndSave<PaymentPlanModel>(
      tableName: PaymentPlanModel.staticTableName,
      queryTemplate: GlobalMicroSyncQuery.paymentPlansSyncQueryTemplate,
      fromMapFactory: PaymentPlanModel.fromMap,
      logPrefix: 'PaymentPlanModel',
      clearExisting: clearExisting,
      syncKey: 'paymentPlanModel',
      onProgressUpdate: onProgressUpdate,
    );
  }

  @override
  Future<bool> getPersonnelDefinitions({bool clearExisting = false, ValueChanged<String>? onProgressUpdate}) async {
    return await _syncAndSave<PersonnelDefinitionModel>(
      tableName: PersonnelDefinitionModel.staticTableName,
      queryTemplate: GlobalMicroSyncQuery.personnelDefinitionsSyncQueryTemplate,
      fromMapFactory: PersonnelDefinitionModel.fromMap,
      logPrefix: 'PersonnelDefinitionModel',
      clearExisting: clearExisting,
      syncKey: 'personnelDefinitionModel',
      onProgressUpdate: onProgressUpdate,
    );
  }

  @override
  Future<bool> getProjects({bool clearExisting = false, ValueChanged<String>? onProgressUpdate}) async {
    return await _syncAndSave<ProjectModel>(
      tableName: ProjectModel.staticTableName,
      queryTemplate: GlobalMicroSyncQuery.projectsSyncQueryTemplate,
      fromMapFactory: ProjectModel.fromMap,
      logPrefix: 'ProjectModel',
      clearExisting: clearExisting,
      syncKey: 'projectModel',
      onProgressUpdate: onProgressUpdate,
    );
  }

  @override
  Future<bool> getResponsibilityCenters({bool clearExisting = false, ValueChanged<String>? onProgressUpdate}) async {
    return await _syncAndSave<ResponsibilityCenterModel>(
      tableName: ResponsibilityCenterModel.staticTableName,
      queryTemplate: GlobalMicroSyncQuery.responsibilityCentersSyncQueryTemplate,
      fromMapFactory: ResponsibilityCenterModel.fromMap,
      logPrefix: 'ResponsibilityCenterModel',
      clearExisting: clearExisting,
      syncKey: 'responsibilityCenterModel',
      onProgressUpdate: onProgressUpdate,
    );
  }

  @override
  Future<bool> getStokMovements({bool clearExisting = false, ValueChanged<String>? onProgressUpdate}) async {
    return await _syncAndSave<StockMovementModel>(
      tableName: StockMovementModel.staticTableName,
      queryTemplate: GlobalMicroSyncQuery.stockMovementsSyncQueryTemplate,
      fromMapFactory: StockMovementModel.fromMap,
      logPrefix: 'StockMovementModel',
      clearExisting: clearExisting,
      syncKey: 'stockMovementModel',
      onProgressUpdate: onProgressUpdate,
    );
  }

  @override
  Future<bool> getStokSalePriceList({bool clearExisting = false, ValueChanged<String>? onProgressUpdate}) async {
    return await _syncAndSave<StockSalePriceListModel>(
      tableName: StockSalePriceListModel.staticTableName,
      queryTemplate: GlobalMicroSyncQuery.stockSalePriceListsSyncQueryTemplate,
      fromMapFactory: StockSalePriceListModel.fromMap,
      logPrefix: 'StockSalePriceListModel',
      clearExisting: clearExisting,
      syncKey: 'stockSalePriceListModel',
      onProgressUpdate: onProgressUpdate,
    );
  }

  @override
  Future<bool> getStokSalePrice({bool clearExisting = false, ValueChanged<String>? onProgressUpdate}) async {
    return await _syncAndSave<StockSalesPriceModel>(
      tableName: StockSalesPriceModel.staticTableName,
      queryTemplate: GlobalMicroSyncQuery.stockSalesPricesSyncQueryTemplate,
      fromMapFactory: StockSalesPriceModel.fromMap,
      logPrefix: 'StockSalesPriceModel',
      clearExisting: clearExisting,
      syncKey: 'stockSalesPriceModel',
      onProgressUpdate: onProgressUpdate,
    );
  }

  @override
  Future<bool> getStocks({bool clearExisting = false, ValueChanged<String>? onProgressUpdate}) async {
    return await _syncAndSave<StockModel>(
      tableName: StockModel.staticTableName,
      queryTemplate: GlobalMicroSyncQuery.stocksSyncQueryTemplate,
      fromMapFactory: StockModel.fromMap,
      logPrefix: 'StockModel',
      clearExisting: clearExisting,
      syncKey: 'stockModel',
      onProgressUpdate: onProgressUpdate,
    );
  }

  @override
  Future<bool> getWareHouses({bool clearExisting = false, ValueChanged<String>? onProgressUpdate}) async {
    return await _syncAndSave<WarehouseModel>(
      tableName: WarehouseModel.staticTableName,
      queryTemplate: GlobalMicroSyncQuery.warehousesSyncQueryTemplate,
      fromMapFactory: WarehouseModel.fromMap,
      logPrefix: 'WarehouseModel',
      clearExisting: clearExisting,
      syncKey: 'warehouseModel',
      onProgressUpdate: onProgressUpdate,
    );
  }

  @override
  Future<bool> getTaxDefinitions({bool clearExisting = false, ValueChanged<String>? onProgressUpdate}) async {
    return await _syncAndSave<TaxModel>(
      tableName: TaxModel.staticTableName,
      queryTemplate: GlobalMicroSyncQuery.taxesSyncQueryTemplate,
      fromMapFactory: TaxModel.fromMap,
      logPrefix: 'TaxModel',
      clearExisting: clearExisting,
      syncKey: 'taxModel',
      onProgressUpdate: onProgressUpdate,
    );
  }

  /// Generic method to synchronize data for a given model type.
  /// This method encapsulates the common logic for fetching and saving data in batches.
  Future<bool> _syncAndSave<T extends BaseModel>({
    required String tableName,
    required String queryTemplate,
    required T Function(Map<String, dynamic> map) fromMapFactory,
    required String logPrefix,
    bool clearExisting = false,
    required String syncKey,
    ValueChanged<String>? onProgressUpdate,
  }) async {
    final repository = GenericRepository<T>(tableName: tableName, fromMapFactory: fromMapFactory);
    const int batchSaveSize = 100;

    int totalCount = 0;
    int currentOffset = 0;
    bool initialFetch = true;

    String lastUpDate = clearExisting ? '1900-01-01 00:00:00.000' : await _productViewModel.getLastSyncDateFor(syncKey);

    onProgressUpdate?.call('Senkronizasyon başlatılıyor...');
    AppLogger.info('$logPrefix: Sync starting with lastUpDate: $lastUpDate (Clear existing: $clearExisting).');

    try {
      if (clearExisting) {
        await repository.deleteAll();
        onProgressUpdate?.call('Mevcut veriler temizleniyor...');
        AppLogger.info('$logPrefix: Existing data cleared.');
      }

      while (true) {
        onProgressUpdate?.call('Veriler çekiliyor (${currentOffset + 1}/${totalCount == 0 ? '?' : totalCount})...');
        AppLogger.info('$logPrefix: Fetching offset: $currentOffset, limit: $_fetchLimit');

        final response = await _networkManager.send<MainApiResponseModel, MainApiResponseModel>(
          '/mssql',
          options: Options(headers: {'clientId': 'dinamikbarkod', 'clientPass': 'dampex56'}),
          parseModel: MainApiResponseModel(),
          method: RequestType.GET,
          data: GlobalMicroSyncQuery.createQueryPayload(
            queryTemplate: queryTemplate,
            lastUpDate: lastUpDate,
            offset: currentOffset,
            fetchNext: _fetchLimit,
          ),
        );

        final resData = response.data;
        if (response.error != null) {
          onProgressUpdate?.call('API hatası: ${response.error!.description}');
          AppLogger.error('$logPrefix: API error ${response.error}');
          return false;
        }

        if (resData?.success != true || resData?.data == null) {
          onProgressUpdate?.call('Veri hatası veya başarısız yanıt.');
          AppLogger.error('$logPrefix: Invalid API response: ${resData?.toJson()}');
          return false;
        }

        final recordsets = resData!.data!.recordsets;
        if (recordsets == null || recordsets.isEmpty || resData.data!.rowsAffected!.first == 0) {
          if (initialFetch) {
            onProgressUpdate?.call('Yeni veri bulunamadı.');
            AppLogger.info('$logPrefix: No records found on initial fetch.');
          } else {
            onProgressUpdate?.call('Tüm veriler çekildi.');
            AppLogger.info('$logPrefix: All records fetched.');
          }
          await _productViewModel.updateLastSyncDateFor(syncKey);
          return true;
        }

        final firstRecordSet = recordsets.first;

        if (initialFetch) {
          if (firstRecordSet is List && firstRecordSet.isNotEmpty) {
            final firstItem = firstRecordSet.first;
            if (firstItem is Map<String, dynamic> && firstItem.containsKey('totalCountForSync')) {
              totalCount = firstItem['totalCountForSync'] ?? 0;
              initialFetch = false;
              onProgressUpdate?.call('Senkronize edilecek toplam $totalCount kayıt var.');
              AppLogger.info('$logPrefix: Total count: $totalCount');

              if (totalCount == 0) {
                await _productViewModel.updateLastSyncDateFor(syncKey);
                return true;
              }
            } else {
              onProgressUpdate?.call('API yanıt formatı beklenmedik (count).');
              AppLogger.error('$logPrefix: totalCountForSync bulunamadı.');
              return false;
            }
          } else {
            onProgressUpdate?.call('API yanıt formatı beklenmedik (boş kayıt).');
            AppLogger.error('$logPrefix: İlk kayıt kümesi boş veya geçersiz.');
            return false;
          }
        }

        final List<T> items = _parseRecordSet<T>(firstRecordSet, fromMapFactory, logPrefix);
        if (items.isEmpty && currentOffset < totalCount) {
          onProgressUpdate?.call('API boş kayıt döndürdü, sorun olabilir.');
          AppLogger.warning('$logPrefix: Kayıt listesi boş döndü.');
          return false;
        }

        await _saveInBatches(repository, items, batchSaveSize);
        currentOffset += items.length;

        onProgressUpdate?.call('${items.length} kayıt kaydedildi. Toplam: $currentOffset/$totalCount');
        AppLogger.info('$logPrefix: ${items.length} kayıt kaydedildi. Offset: $currentOffset');

        if (currentOffset >= totalCount) {
          onProgressUpdate?.call('Senkronizasyon başarıyla tamamlandı!');
          AppLogger.info('$logPrefix: Senkronizasyon tamamlandı. Toplam: $totalCount');
          await _productViewModel.updateLastSyncDateFor(syncKey);
          return true;
        }
      }
    } catch (e, st) {
      onProgressUpdate?.call('Beklenmedik hata: ${e.toString()}');
      AppLogger.error('$logPrefix: Hata oluştu: $e\n$st');
      return false;
    }
  }

  List<T> _parseRecordSet<T>(dynamic recordSet, T Function(Map<String, dynamic>) fromMapFactory, String logPrefix) {
    if (recordSet is! List) return [];

    return recordSet.whereType<Map<String, dynamic>>().map((map) => fromMapFactory(map)).toList();
  }

  Future<void> _saveInBatches<T extends BaseModel>(
    GenericRepository<T> repository,
    List<T> items,
    int batchSize,
  ) async {
    for (var i = 0; i < items.length; i += batchSize) {
      final batch = items.skip(i).take(batchSize).toList();
      await repository.saveAll(batch);
    }
  }
}
