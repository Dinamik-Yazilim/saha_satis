import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class StockSalesPriceModel extends BaseModel {
  final String? stockCode;
  final int? listSequenceNo;
  final int? warehouseSequenceNo;
  final int? paymentPlan;
  final int? unitPointer;
  final double? price;
  final int? currency;
  final String? discountCode;
  final int? createdBy;
  final String? createdAt; // ISO8601 string
  final int? updatedBy;
  final String? updatedAt; // ISO8601 string

  StockSalesPriceModel({
    super.id, // 'id' field is inherited from BaseModel
    this.stockCode,
    this.listSequenceNo,
    this.warehouseSequenceNo,
    this.paymentPlan,
    this.unitPointer,
    this.price,
    this.currency,
    this.discountCode,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  /// Creates a [StockSalesPriceModel] from a Map.
  factory StockSalesPriceModel.fromMap(Map<String, dynamic> map) {
    return StockSalesPriceModel(
      id: map['id'] as String?,
      stockCode: map['stockCode'] as String?,
      listSequenceNo: map['listSequenceNo'] as int?,
      warehouseSequenceNo: map['warehouseSequenceNo'] as int?,
      paymentPlan: map['paymentPlan'] as int?,
      unitPointer: map['unitPointer'] as int?,
      price: (map['price'] as num?)?.toDouble(), // Safely cast to double
      currency: map['currency'] as int?,
      discountCode: map['discountCode'] as String?,
      createdBy: map['createdBy'] as int?,
      createdAt: map['createdAt'] as String?,
      updatedBy: map['updatedBy'] as int?,
      updatedAt: map['updatedAt'] as String?,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'stockCode': stockCode,
      'listSequenceNo': listSequenceNo,
      'warehouseSequenceNo': warehouseSequenceNo,
      'paymentPlan': paymentPlan,
      'unitPointer': unitPointer,
      'price': price,
      'currency': currency,
      'discountCode': discountCode,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt,
    };
  }

  static String get staticTableName => 'stock_sales_prices';

  @override
  String get tableName => staticTableName;

  @override
  StockSalesPriceModel fromMap(Map<String, dynamic> map) {
    return StockSalesPriceModel.fromMap(map);
  }
}
