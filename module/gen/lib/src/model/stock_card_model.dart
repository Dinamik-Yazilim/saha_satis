import 'package:json_annotation/json_annotation.dart';

part 'stock_card_model.g.dart';

// BoolToIntConverter'ı tanımladığınızdan emin olun
class BoolToIntConverter implements JsonConverter<int, dynamic> {
  const BoolToIntConverter();

  @override
  int fromJson(dynamic json) {
    if (json is bool) {
      return json ? 1 : 0;
    } else if (json is int) {
      return json;
    }
    return 0; // Varsayılan değer veya hata durumu
  }

  @override
  dynamic toJson(int object) => object;
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class StockCardModel {
  // stocks tablosundan gelen ana bilgiler
  String? id; // stocks.id
  String? stockCode; // stocks.code
  String? stockName; // stocks.name
  String? shortName; // stocks.shortName
  String? foreignName; // stocks.foreignName
  String? unit1Name; // stocks.unit1Name
  double? unit1Multiplier; // stocks.unit1Multiplier
  String? unit2Name; // stocks.unit2Name
  double? unit2Multiplier; // stocks.unit2Multiplier
  String? unit3Name; // stocks.unit3Name
  double? unit3Multiplier; // stocks.unit3Multiplier
  String? unit4Name; // stocks.unit4Name
  double? unit4Multiplier; // stocks.unit4Multiplier
  int? retailTaxFKID; // stocks.retailTax
  int? wholesaleTaxFKID; // stocks.wholesaleTax
  @BoolToIntConverter()
  int? salesBlocked; // stocks.salesBlocked
  @BoolToIntConverter()
  int? orderBlocked; // stocks.orderBlocked
  @BoolToIntConverter()
  int? goodsReceiptBlocked; // stocks.goodsReceiptBlocked
  String? stockCreatedAt; // stocks.createdAt
  String? stockUpdatedAt; // stocks.updatedAt
  String? vendorCode; // stocks.vendorCode
  String? categoryCode; // stocks.categoryCode
  String? brandCode; // stocks.brandCode
  String? sizeCode; // stocks.sizeCode
  String? colorCode; // stocks.colorCode
  String? modelCode; // stocks.modelCode
  String? seasonCode; // stocks.seasonCode
  String? origin; // stocks.origin
  String? mainGroupCode; // stocks.mainGroupCode
  int? detailTracking; // stocks.detailTracking

  // Barcode (barcodes tablosundan gelen ve SQL tarafından tekilleştirilmiş bilgiler)
  // SQL sorgunuz tek bir kaydı döndürdüğü için, bu alanlar doğrudan StokKartiModel'de yer alacak.
  // Birden fazla barkod ihtiyacı olursa List<BarcodeModel> yapısı düşünülmelidir.
  String? barcodeID; // barcodes.id
  String? barcode; // barcodes.code
  int? barcodeContent; // barcodes.content
  int? barcodeType; // barcodes.barcodeType
  int? barcodeUnitPointer; // barcodes.unitPointer
  int? sizePointer; // barcodes.sizePointer
  int? colorPointer; // barcodes.colorPointer
  String? barcodeCreatedAt; // barcodes.createdAt
  String? barcodeUpdatedAt; // barcodes.updatedAt

  // Fiyat Bilgileri (stock_sales_prices, stock_sale_price_lists ve taxes tablolarından birleştirilmiş)
  // Bu alanlar SQL'deki final SELECT çıktısıyla uyumlu olacak.
  int? currentListSequenceNo; // SQL'deki ListSequenceNo (son birleşen)
  int? currentPriceWarehouseNo; // SQL'deki PriceWarehouseNo (son birleşen)
  String? retailTaxPercentage; // taxes.vatRate (perakende için)
  String? wholesaleTaxPercentage; // taxes.vatRate (toptan için)f
  double? retailPriceIncludingTax; // SQL'den gelen final perakende fiyat
  double? retailPriceExcludingTax; // SQL'den gelen final perakende fiyat
  double? wholesalePriceIncludingTax; // SQL'den gelen final toptan fiyat
  double? wholesalePriceExcludingTax; // SQL'den gelen final toptan fiyat
  double? priceIncludingTax; // SQL'den gelen final fiyat (vergi dahil)
  double? priceExcludingTax; // SQL'den gelen final fiyat (vergi hariç)

  // stock_sales_prices tablosundan doğrudan çekilecek ek fiyat detayları (SF1 veya SF2'den, hangisi aktifse)
  String? priceID; // stock_sales_prices.id
  int? paymentPlan; // stock_sales_prices.paymentPlan
  int? priceCurrency; // stock_sales_prices.currency
  String? priceDiscountCode; // stock_sales_prices.discountCode
  String? priceCreatedAt; // stock_sales_prices.createdAt
  String? priceUpdatedAt; // stock_sales_prices.updatedAt
  dynamic listVatIncluded; // stock_sale_price_lists.vatIncluded (aktif liste için)

  StockCardModel({
    this.id,
    this.stockCode,
    this.stockName,
    this.shortName,
    this.foreignName,
    this.unit1Name,
    this.unit1Multiplier,
    this.unit2Name,
    this.unit2Multiplier,
    this.unit3Name,
    this.unit3Multiplier,
    this.unit4Name,
    this.unit4Multiplier,
    this.retailTaxFKID,
    this.wholesaleTaxFKID,
    this.salesBlocked,
    this.orderBlocked,
    this.goodsReceiptBlocked,
    this.stockCreatedAt,
    this.stockUpdatedAt,
    this.vendorCode,
    this.categoryCode,
    this.brandCode,
    this.sizeCode,
    this.colorCode,
    this.modelCode,
    this.seasonCode,
    this.origin,
    this.mainGroupCode,
    this.detailTracking,
    this.barcodeID,
    this.barcode,
    this.barcodeContent,
    this.barcodeType,
    this.barcodeUnitPointer,
    this.sizePointer,
    this.colorPointer,
    this.barcodeCreatedAt,
    this.barcodeUpdatedAt,
    this.currentListSequenceNo,
    this.currentPriceWarehouseNo,
    this.retailTaxPercentage,
    this.wholesaleTaxPercentage,
    this.retailPriceIncludingTax,
    this.retailPriceExcludingTax,
    this.wholesalePriceIncludingTax,
    this.wholesalePriceExcludingTax,
    this.priceIncludingTax,
    this.priceExcludingTax,
    this.priceID,
    this.paymentPlan,
    this.priceCurrency,
    this.priceDiscountCode,
    this.priceCreatedAt,
    this.priceUpdatedAt,
    this.listVatIncluded,
  });

  Map<String, dynamic> toJson() => _$StockCardModelToJson(this);

  factory StockCardModel.fromJson(Map<String, dynamic> json) => _$StockCardModelFromJson(json);

  @override
  String toString() {
    return 'StockCardModel(id: $id, stockCode: $stockCode, stockName: $stockName, shortName: $shortName, foreignName: $foreignName, unit1Name: $unit1Name, unit1Multiplier: $unit1Multiplier, unit2Name: $unit2Name, unit2Multiplier: $unit2Multiplier, unit3Name: $unit3Name, unit3Multiplier: $unit3Multiplier, unit4Name: $unit4Name, unit4Multiplier: $unit4Multiplier, retailTaxFKID: $retailTaxFKID, wholesaleTaxFKID: $wholesaleTaxFKID, salesBlocked: $salesBlocked, orderBlocked: $orderBlocked, goodsReceiptBlocked: $goodsReceiptBlocked, stockCreatedAt: $stockCreatedAt, stockUpdatedAt: $stockUpdatedAt, vendorCode: $vendorCode, categoryCode: $categoryCode, brandCode: $brandCode, sizeCode: $sizeCode, colorCode: $colorCode, modelCode: $modelCode, seasonCode: $seasonCode, origin: $origin, mainGroupCode: $mainGroupCode, detailTracking: $detailTracking, barcodeID: $barcodeID, barcode: $barcode, barcodeContent: $barcodeContent, barcodeType: $barcodeType, barcodeUnitPointer: $barcodeUnitPointer, sizePointer: $sizePointer, colorPointer: $colorPointer, barcodeCreatedAt: $barcodeCreatedAt, barcodeUpdatedAt: $barcodeUpdatedAt, currentListSequenceNo: $currentListSequenceNo, currentPriceWarehouseNo: $currentPriceWarehouseNo, retailTaxPercentage: $retailTaxPercentage, wholesaleTaxPercentage: $wholesaleTaxPercentage, retailPriceIncludingTax: $retailPriceIncludingTax, retailPriceExcludingTax: $retailPriceExcludingTax, wholesalePriceIncludingTax: $wholesalePriceIncludingTax, wholesalePriceExcludingTax: $wholesalePriceExcludingTax, priceIncludingTax: $priceIncludingTax, priceExcludingTax: $priceExcludingTax, priceID: $priceID, paymentPlan: $paymentPlan, priceCurrency: $priceCurrency, priceDiscountCode: $priceDiscountCode, priceCreatedAt: $priceCreatedAt, priceUpdatedAt: $priceUpdatedAt, listVatIncluded: $listVatIncluded)';
  }
}
