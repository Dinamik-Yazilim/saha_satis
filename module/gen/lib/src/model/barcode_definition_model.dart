import 'package:json_annotation/json_annotation.dart';
part 'barcode_definition_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class BarcodeDefinitionsModel {
  String? uniqueId;
  @JsonKey(name: 'Fk_StokID')
  int? fkStockID; // Fk_StokID
  String? barcode; // barkod
  int? barcodeContent; // barkodIcerigi
  int? barcodeType; // barkodTipi
  String? lastUpdateDate; // sonGuncellemeTarihi
  String? sizeBreakdown; // bedenKirilimi
  String? colorBreakdown; // renkKirilimi
  int? unitPointer; // birimPntr
  int? sent; // gonderildi
  String? stockCode; // stokKodu

  BarcodeDefinitionsModel({
    this.uniqueId,
    this.fkStockID,
    this.barcode,
    this.barcodeContent,
    this.barcodeType,
    this.lastUpdateDate,
    this.sizeBreakdown,
    this.colorBreakdown,
    this.unitPointer,
    this.sent,
    this.stockCode,
  });

  Map<String, dynamic> toJson() => _$BarcodeDefinitionsModelToJson(this);

  factory BarcodeDefinitionsModel.fromJson(Map<String, dynamic> json) => _$BarcodeDefinitionsModelFromJson(json);

  @override
  String toString() {
    return 'BarcodeDefinitionsModel(uniqueId: $uniqueId, fkStockID: $fkStockID, barcode: $barcode, barcodeContent: $barcodeContent, barcodeType: $barcodeType, lastUpdateDate: $lastUpdateDate, sizeBreakdown: $sizeBreakdown, colorBreakdown: $colorBreakdown, unitPointer: $unitPointer, sent: $sent, stockCode: $stockCode)';
  }
}
