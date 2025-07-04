// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockCardModel _$StockCardModelFromJson(Map<String, dynamic> json) =>
    StockCardModel(
      id: json['Id'] as String?,
      stockCode: json['StockCode'] as String?,
      stockName: json['StockName'] as String?,
      shortName: json['ShortName'] as String?,
      foreignName: json['ForeignName'] as String?,
      unit1Name: json['Unit1Name'] as String?,
      unit1Multiplier: (json['Unit1Multiplier'] as num?)?.toDouble(),
      unit2Name: json['Unit2Name'] as String?,
      unit2Multiplier: (json['Unit2Multiplier'] as num?)?.toDouble(),
      unit3Name: json['Unit3Name'] as String?,
      unit3Multiplier: (json['Unit3Multiplier'] as num?)?.toDouble(),
      unit4Name: json['Unit4Name'] as String?,
      unit4Multiplier: (json['Unit4Multiplier'] as num?)?.toDouble(),
      retailTaxFKID: (json['RetailTaxFKID'] as num?)?.toInt(),
      wholesaleTaxFKID: (json['WholesaleTaxFKID'] as num?)?.toInt(),
      salesBlocked: const BoolToIntConverter().fromJson(json['SalesBlocked']),
      orderBlocked: const BoolToIntConverter().fromJson(json['OrderBlocked']),
      goodsReceiptBlocked:
          const BoolToIntConverter().fromJson(json['GoodsReceiptBlocked']),
      stockCreatedAt: json['StockCreatedAt'] as String?,
      stockUpdatedAt: json['StockUpdatedAt'] as String?,
      vendorCode: json['VendorCode'] as String?,
      categoryCode: json['CategoryCode'] as String?,
      brandCode: json['BrandCode'] as String?,
      sizeCode: json['SizeCode'] as String?,
      colorCode: json['ColorCode'] as String?,
      modelCode: json['ModelCode'] as String?,
      seasonCode: json['SeasonCode'] as String?,
      origin: json['Origin'] as String?,
      mainGroupCode: json['MainGroupCode'] as String?,
      detailTracking: (json['DetailTracking'] as num?)?.toInt(),
      barcodeID: json['BarcodeID'] as String?,
      barcode: json['Barcode'] as String?,
      barcodeContent: (json['BarcodeContent'] as num?)?.toInt(),
      barcodeType: (json['BarcodeType'] as num?)?.toInt(),
      barcodeUnitPointer: (json['BarcodeUnitPointer'] as num?)?.toInt(),
      sizePointer: (json['SizePointer'] as num?)?.toInt(),
      colorPointer: (json['ColorPointer'] as num?)?.toInt(),
      barcodeCreatedAt: json['BarcodeCreatedAt'] as String?,
      barcodeUpdatedAt: json['BarcodeUpdatedAt'] as String?,
      currentListSequenceNo: (json['CurrentListSequenceNo'] as num?)?.toInt(),
      currentPriceWarehouseNo:
          (json['CurrentPriceWarehouseNo'] as num?)?.toInt(),
      retailTaxPercentage: json['RetailTaxPercentage'] as String?,
      wholesaleTaxPercentage: json['WholesaleTaxPercentage'] as String?,
      retailPriceIncludingTax:
          (json['RetailPriceIncludingTax'] as num?)?.toDouble(),
      retailPriceExcludingTax:
          (json['RetailPriceExcludingTax'] as num?)?.toDouble(),
      wholesalePriceIncludingTax:
          (json['WholesalePriceIncludingTax'] as num?)?.toDouble(),
      wholesalePriceExcludingTax:
          (json['WholesalePriceExcludingTax'] as num?)?.toDouble(),
      priceIncludingTax: (json['PriceIncludingTax'] as num?)?.toDouble(),
      priceExcludingTax: (json['PriceExcludingTax'] as num?)?.toDouble(),
      priceID: json['PriceID'] as String?,
      paymentPlan: (json['PaymentPlan'] as num?)?.toInt(),
      priceCurrency: (json['PriceCurrency'] as num?)?.toInt(),
      priceDiscountCode: json['PriceDiscountCode'] as String?,
      priceCreatedAt: json['PriceCreatedAt'] as String?,
      priceUpdatedAt: json['PriceUpdatedAt'] as String?,
      listVatIncluded: json['ListVatIncluded'],
    );

Map<String, dynamic> _$StockCardModelToJson(StockCardModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'StockCode': instance.stockCode,
      'StockName': instance.stockName,
      'ShortName': instance.shortName,
      'ForeignName': instance.foreignName,
      'Unit1Name': instance.unit1Name,
      'Unit1Multiplier': instance.unit1Multiplier,
      'Unit2Name': instance.unit2Name,
      'Unit2Multiplier': instance.unit2Multiplier,
      'Unit3Name': instance.unit3Name,
      'Unit3Multiplier': instance.unit3Multiplier,
      'Unit4Name': instance.unit4Name,
      'Unit4Multiplier': instance.unit4Multiplier,
      'RetailTaxFKID': instance.retailTaxFKID,
      'WholesaleTaxFKID': instance.wholesaleTaxFKID,
      'SalesBlocked': _$JsonConverterToJson<dynamic, int>(
          instance.salesBlocked, const BoolToIntConverter().toJson),
      'OrderBlocked': _$JsonConverterToJson<dynamic, int>(
          instance.orderBlocked, const BoolToIntConverter().toJson),
      'GoodsReceiptBlocked': _$JsonConverterToJson<dynamic, int>(
          instance.goodsReceiptBlocked, const BoolToIntConverter().toJson),
      'StockCreatedAt': instance.stockCreatedAt,
      'StockUpdatedAt': instance.stockUpdatedAt,
      'VendorCode': instance.vendorCode,
      'CategoryCode': instance.categoryCode,
      'BrandCode': instance.brandCode,
      'SizeCode': instance.sizeCode,
      'ColorCode': instance.colorCode,
      'ModelCode': instance.modelCode,
      'SeasonCode': instance.seasonCode,
      'Origin': instance.origin,
      'MainGroupCode': instance.mainGroupCode,
      'DetailTracking': instance.detailTracking,
      'BarcodeID': instance.barcodeID,
      'Barcode': instance.barcode,
      'BarcodeContent': instance.barcodeContent,
      'BarcodeType': instance.barcodeType,
      'BarcodeUnitPointer': instance.barcodeUnitPointer,
      'SizePointer': instance.sizePointer,
      'ColorPointer': instance.colorPointer,
      'BarcodeCreatedAt': instance.barcodeCreatedAt,
      'BarcodeUpdatedAt': instance.barcodeUpdatedAt,
      'CurrentListSequenceNo': instance.currentListSequenceNo,
      'CurrentPriceWarehouseNo': instance.currentPriceWarehouseNo,
      'RetailTaxPercentage': instance.retailTaxPercentage,
      'WholesaleTaxPercentage': instance.wholesaleTaxPercentage,
      'RetailPriceIncludingTax': instance.retailPriceIncludingTax,
      'RetailPriceExcludingTax': instance.retailPriceExcludingTax,
      'WholesalePriceIncludingTax': instance.wholesalePriceIncludingTax,
      'WholesalePriceExcludingTax': instance.wholesalePriceExcludingTax,
      'PriceIncludingTax': instance.priceIncludingTax,
      'PriceExcludingTax': instance.priceExcludingTax,
      'PriceID': instance.priceID,
      'PaymentPlan': instance.paymentPlan,
      'PriceCurrency': instance.priceCurrency,
      'PriceDiscountCode': instance.priceDiscountCode,
      'PriceCreatedAt': instance.priceCreatedAt,
      'PriceUpdatedAt': instance.priceUpdatedAt,
      'ListVatIncluded': instance.listVatIncluded,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
