import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class OrderModel extends BaseModel {
  final String? kind;
  final String? type;
  final String? documentSerialNo;
  final String? documentSequenceNo;
  final int? documentLineNo;
  final String? vendorCode;
  final double? unitPrice;
  final double? quantity;
  final String? unitPointer;
  final double? deliveredQuantity;
  final double? amount;
  final double? discount1;
  final double? discount2;
  final double? discount3;
  final double? discount4;
  final double? discount5;
  final double? discount6;
  final double? expense1;
  final double? expense2;
  final double? expense3;
  final double? expense4;
  final String? taxPointer;
  final double? taxAmount;
  final String? description;
  final String? description2;
  final String? warehouseNo;
  final double? currencyRate;
  final double? exchangeRate;
  final String? createdBy;
  final String? createdAt; // ISO8601 string
  final String? updatedBy;
  final String? updatedAt; // ISO8601 string

  OrderModel({
    super.id, // 'id' field is inherited from BaseModel
    this.kind,
    this.type,
    this.documentSerialNo,
    this.documentSequenceNo,
    this.documentLineNo,
    this.vendorCode,
    this.unitPrice,
    this.quantity,
    this.unitPointer,
    this.deliveredQuantity,
    this.amount,
    this.discount1,
    this.discount2,
    this.discount3,
    this.discount4,
    this.discount5,
    this.discount6,
    this.expense1,
    this.expense2,
    this.expense3,
    this.expense4,
    this.taxPointer,
    this.taxAmount,
    this.description,
    this.description2,
    this.warehouseNo,
    this.currencyRate,
    this.exchangeRate,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  /// Map'ten OrderModel oluşturur.
  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as String?,
      kind: map['kind'] as String?,
      type: map['type'] as String?,
      documentSerialNo: map['documentSerialNo'] as String?,
      documentSequenceNo: map['documentSequenceNo'] as String?,
      documentLineNo: map['documentLineNo'] as int?,
      vendorCode: map['vendorCode'] as String?,
      unitPrice: (map['unitPrice'] as num?)?.toDouble(),
      quantity: (map['quantity'] as num?)?.toDouble(),
      unitPointer: map['unitPointer'] as String?,
      deliveredQuantity: (map['deliveredQuantity'] as num?)?.toDouble(),
      amount: (map['amount'] as num?)?.toDouble(),
      discount1: (map['discount1'] as num?)?.toDouble(),
      discount2: (map['discount2'] as num?)?.toDouble(),
      discount3: (map['discount3'] as num?)?.toDouble(),
      discount4: (map['discount4'] as num?)?.toDouble(),
      discount5: (map['discount5'] as num?)?.toDouble(),
      discount6: (map['discount6'] as num?)?.toDouble(),
      expense1: (map['expense1'] as num?)?.toDouble(),
      expense2: (map['expense2'] as num?)?.toDouble(),
      expense3: (map['expense3'] as num?)?.toDouble(),
      expense4: (map['expense4'] as num?)?.toDouble(),
      taxPointer: map['taxPointer'] as String?,
      taxAmount: (map['taxAmount'] as num?)?.toDouble(),
      description: map['description'] as String?,
      description2: map['description2'] as String?,
      warehouseNo: map['warehouseNo'] as String?,
      currencyRate: (map['currencyRate'] as num?)?.toDouble(),
      exchangeRate: (map['exchangeRate'] as num?)?.toDouble(),
      createdBy: map['createdBy'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedBy: map['updatedBy'] as String?,
      updatedAt: map['updatedAt'] as String?,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kind': kind,
      'type': type,
      'documentSerialNo': documentSerialNo,
      'documentSequenceNo': documentSequenceNo,
      'documentLineNo': documentLineNo,
      'vendorCode': vendorCode,
      'unitPrice': unitPrice,
      'quantity': quantity,
      'unitPointer': unitPointer,
      'deliveredQuantity': deliveredQuantity,
      'amount': amount,
      'discount1': discount1,
      'discount2': discount2,
      'discount3': discount3,
      'discount4': discount4,
      'discount5': discount5,
      'discount6': discount6,
      'expense1': expense1,
      'expense2': expense2,
      'expense3': expense3,
      'expense4': expense4,
      'taxPointer': taxPointer,
      'taxAmount': taxAmount,
      'description': description,
      'description2': description2,
      'warehouseNo': warehouseNo,
      'currencyRate': currencyRate,
      'exchangeRate': exchangeRate,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt,
    };
  }

  static String get staticTableName => 'SIPARISLER';

  @override
  String get tableName => staticTableName;

  @override
  OrderModel fromMap(Map<String, dynamic> map) {
    return OrderModel.fromMap(map);
  }
}