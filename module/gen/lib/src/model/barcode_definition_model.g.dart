// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_definition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarcodeDefinitionsModel _$BarcodeDefinitionsModelFromJson(
        Map<String, dynamic> json) =>
    BarcodeDefinitionsModel(
      uniqueId: json['UniqueId'] as String?,
      fkStockID: (json['Fk_StokID'] as num?)?.toInt(),
      barcode: json['Barcode'] as String?,
      barcodeContent: (json['BarcodeContent'] as num?)?.toInt(),
      barcodeType: (json['BarcodeType'] as num?)?.toInt(),
      lastUpdateDate: json['LastUpdateDate'] as String?,
      sizeBreakdown: json['SizeBreakdown'] as String?,
      colorBreakdown: json['ColorBreakdown'] as String?,
      unitPointer: (json['UnitPointer'] as num?)?.toInt(),
      sent: (json['Sent'] as num?)?.toInt(),
      stockCode: json['StockCode'] as String?,
    );

Map<String, dynamic> _$BarcodeDefinitionsModelToJson(
        BarcodeDefinitionsModel instance) =>
    <String, dynamic>{
      'UniqueId': instance.uniqueId,
      'Fk_StokID': instance.fkStockID,
      'Barcode': instance.barcode,
      'BarcodeContent': instance.barcodeContent,
      'BarcodeType': instance.barcodeType,
      'LastUpdateDate': instance.lastUpdateDate,
      'SizeBreakdown': instance.sizeBreakdown,
      'ColorBreakdown': instance.colorBreakdown,
      'UnitPointer': instance.unitPointer,
      'Sent': instance.sent,
      'StockCode': instance.stockCode,
    };
