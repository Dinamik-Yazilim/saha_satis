// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesPricesModel _$SalesPricesModelFromJson(Map<String, dynamic> json) =>
    SalesPricesModel(
      uniqueId: json['UniqueId'] as String?,
      fkStockID: (json['Fk_StokID'] as num?)?.toInt(),
      listSequenceNo: (json['ListSequenceNo'] as num?)?.toInt(),
      salesPrice: (json['SalesPrice'] as num?)?.toDouble(),
      currencyType: (json['CurrencyType'] as num?)?.toInt(),
      lastUpdateDate: json['LastUpdateDate'] as String?,
      stockDiscountCode: json['StockDiscountCode'] as String?,
      unitPointer: (json['UnitPointer'] as num?)?.toInt(),
      stockCode: json['StockCode'] as String?,
      warehouseNo: (json['WarehouseNo'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SalesPricesModelToJson(SalesPricesModel instance) =>
    <String, dynamic>{
      'UniqueId': instance.uniqueId,
      'Fk_StokID': instance.fkStockID,
      'ListSequenceNo': instance.listSequenceNo,
      'SalesPrice': instance.salesPrice,
      'CurrencyType': instance.currencyType,
      'LastUpdateDate': instance.lastUpdateDate,
      'StockDiscountCode': instance.stockDiscountCode,
      'UnitPointer': instance.unitPointer,
      'StockCode': instance.stockCode,
      'WarehouseNo': instance.warehouseNo,
    };
