import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class StockMovementModel extends BaseModel {
  final String? type;
  final String? kind;
  final String? documentType;
  final String? documentSerialNo;
  final String? documentSequenceNo;
  final int? documentLineNo;
  final String? documentNo;
  final String? documentDate; // ISO8601 string
  final String? stockCode;
  final String? accountCode;
  final String? salespersonCode;
  final double? exchangeRate;
  final double? quantity;
  final double? quantity2;
  final String? unitPointer;
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
  final String? orderUid;
  final String? invoiceUid;
  final String? entryWarehouseNo;
  final String? exitWarehouseNo;
  final String? goodsReceiptShipmentDate; // ISO8601 string
  final String? accountResponsibilityCenter;
  final double? costMain;
  final double? costAlternative;
  final double? costOriginal;
  final String? createdBy;
  final String? createdAt; // ISO8601 string
  final String? updatedBy;
  final String? updatedAt; // ISO8601 string

  StockMovementModel({
    super.id, // 'id' field is inherited from BaseModel
    this.type,
    this.kind,
    this.documentType,
    this.documentSerialNo,
    this.documentSequenceNo,
    this.documentLineNo,
    this.documentNo,
    this.documentDate,
    this.stockCode,
    this.accountCode,
    this.salespersonCode,
    this.exchangeRate,
    this.quantity,
    this.quantity2,
    this.unitPointer,
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
    this.orderUid,
    this.invoiceUid,
    this.entryWarehouseNo,
    this.exitWarehouseNo,
    this.goodsReceiptShipmentDate,
    this.accountResponsibilityCenter,
    this.costMain,
    this.costAlternative,
    this.costOriginal,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  /// Map'ten StockMovementModel oluşturur.
  factory StockMovementModel.fromMap(Map<String, dynamic> map) {
    return StockMovementModel(
      id: map['id'] as String?,
      type: map['type'] as String?,
      kind: map['kind'] as String?,
      documentType: map['documentType'] as String?,
      documentSerialNo: map['documentSerialNo'] as String?,
      documentSequenceNo: map['documentSequenceNo'] as String?,
      documentLineNo: map['documentLineNo'] as int?,
      documentNo: map['documentNo'] as String?,
      documentDate: map['documentDate'] as String?,
      stockCode: map['stockCode'] as String?,
      accountCode: map['accountCode'] as String?,
      salespersonCode: map['salespersonCode'] as String?,
      exchangeRate: (map['exchangeRate'] as num?)?.toDouble(),
      quantity: (map['quantity'] as num?)?.toDouble(),
      quantity2: (map['quantity2'] as num?)?.toDouble(),
      unitPointer: map['unitPointer'] as String?,
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
      orderUid: map['orderUid'] as String?,
      invoiceUid: map['invoiceUid'] as String?,
      entryWarehouseNo: map['entryWarehouseNo'] as String?,
      exitWarehouseNo: map['exitWarehouseNo'] as String?,
      goodsReceiptShipmentDate: map['goodsReceiptShipmentDate'] as String?,
      accountResponsibilityCenter: map['accountResponsibilityCenter'] as String?,
      costMain: (map['costMain'] as num?)?.toDouble(),
      costAlternative: (map['costAlternative'] as num?)?.toDouble(),
      costOriginal: (map['costOriginal'] as num?)?.toDouble(),
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
      'type': type,
      'kind': kind,
      'documentType': documentType,
      'documentSerialNo': documentSerialNo,
      'documentSequenceNo': documentSequenceNo,
      'documentLineNo': documentLineNo,
      'documentNo': documentNo,
      'documentDate': documentDate,
      'stockCode': stockCode,
      'accountCode': accountCode,
      'salespersonCode': salespersonCode,
      'exchangeRate': exchangeRate,
      'quantity': quantity,
      'quantity2': quantity2,
      'unitPointer': unitPointer,
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
      'orderUid': orderUid,
      'invoiceUid': invoiceUid,
      'entryWarehouseNo': entryWarehouseNo,
      'exitWarehouseNo': exitWarehouseNo,
      'goodsReceiptShipmentDate': goodsReceiptShipmentDate,
      'accountResponsibilityCenter': accountResponsibilityCenter,
      'costMain': costMain,
      'costAlternative': costAlternative,
      'costOriginal': costOriginal,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt,
    };
  }

  static String get staticTableName => 'STOK_HAREKETLERI';

  @override
  String get tableName => staticTableName;

  @override
  StockMovementModel fromMap(Map<String, dynamic> map) {
    return StockMovementModel.fromMap(map);
  }
}