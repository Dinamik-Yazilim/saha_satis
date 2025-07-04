import 'package:json_annotation/json_annotation.dart';

part 'sales_price_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class SalesPricesModel {
  String? uniqueId;
  @JsonKey(name: 'Fk_StokID')
  int? fkStockID; // Fk_StokID
  int? listSequenceNo; // listeSiraNo
  double? salesPrice; // satisFiyati
  int? currencyType; // dovizCinsi
  String? lastUpdateDate; // sonGuncellemeTarihi
  String? stockDiscountCode; // stokIskontoKodu
  int? unitPointer; // birimPntr
  String? stockCode; // stokKodu
  int? warehouseNo; // depoNo

  SalesPricesModel({
    this.uniqueId,
    this.fkStockID,
    this.listSequenceNo,
    this.salesPrice,
    this.currencyType,
    this.lastUpdateDate,
    this.stockDiscountCode,
    this.unitPointer,
    this.stockCode,
    this.warehouseNo,
  });

  Map<String, dynamic> toJson() => _$SalesPricesModelToJson(this);

  factory SalesPricesModel.fromJson(Map<String, dynamic> json) => _$SalesPricesModelFromJson(json);

  @override
  String toString() {
    return 'SalesPricesModel(uniqueId: $uniqueId, fkStockID: $fkStockID, listSequenceNo: $listSequenceNo, salesPrice: $salesPrice, currencyType: $currencyType, lastUpdateDate: $lastUpdateDate, stockDiscountCode: $stockDiscountCode, unitPointer: $unitPointer, stockCode: $stockCode, warehouseNo: $warehouseNo)';
  }
}
