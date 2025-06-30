import 'package:flutter/material.dart';

abstract class SyncGetOperation {
  Future<bool> getBanks({bool clearExisting = false, ValueChanged<String>? onProgressUpdate});
  Future<bool> getBarcodes({bool clearExisting = false, ValueChanged<String>? onProgressUpdate});
  Future<bool> getCashBoxes({bool clearExisting = false, ValueChanged<String>? onProgressUpdate});
  Future<bool> getCustomerAccountMovements({bool clearExisting = false, ValueChanged<String>? onProgressUpdate});
  Future<bool> getCustomerAccounts({bool clearExisting = false, ValueChanged<String>? onProgressUpdate});
  Future<bool> getCustomerAddresses({bool clearExisting = false, ValueChanged<String>? onProgressUpdate});
  Future<bool> getOrders({bool clearExisting = false, ValueChanged<String>? onProgressUpdate});
  Future<bool> getPaymentOrders({bool clearExisting = false, ValueChanged<String>? onProgressUpdate});
  Future<bool> getPaymentPlans({bool clearExisting = false, ValueChanged<String>? onProgressUpdate});
  Future<bool> getPersonnelDefinitions({bool clearExisting = false, ValueChanged<String>? onProgressUpdate});
  Future<bool> getProjects({bool clearExisting = false, ValueChanged<String>? onProgressUpdate});
  Future<bool> getResponsibilityCenters({bool clearExisting = false, ValueChanged<String>? onProgressUpdate});
  Future<bool> getStokMovements({bool clearExisting = false, ValueChanged<String>? onProgressUpdate});
  Future<bool> getStokSalePriceList({bool clearExisting = false, ValueChanged<String>? onProgressUpdate});
  Future<bool> getStokSalePrice({bool clearExisting = false, ValueChanged<String>? onProgressUpdate});
  Future<bool> getStocks({bool clearExisting = false, ValueChanged<String>? onProgressUpdate});
  Future<bool> getWareHouses({bool clearExisting = false, ValueChanged<String>? onProgressUpdate});
}
