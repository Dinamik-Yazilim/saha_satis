import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class CustomerAccountMovementModel extends BaseModel {
  final int? companyNo;
  final int? branchNo;
  final int? documentType;
  final String? documentSerialNo;
  final int? documentSequenceNo;
  final int? documentLineNo;
  final int? type;
  final int? kind;
  final String? documentNo;
  final String? documentDate; // ISO8601 string
  final String? description;
  final String? vendorCode;
  final int? accountKind;
  final String? code;
  final String? turnoverAccountCode;
  final double? exchangeRate;
  final String? responsibilityCenterCode;
  final String? cashServiceCode;
  final double? quantity;
  final double? amount;
  final double? subtotal;
  final int? dueDate; // ISO8601 string
  final double? invoiceDiscount1;
  final double? invoiceDiscount2;
  final double? invoiceDiscount3;
  final double? invoiceDiscount4;
  final double? invoiceDiscount5;
  final double? invoiceDiscount6;
  final double? invoiceExpense1;
  final double? invoiceExpense2;
  final double? invoiceExpense3;
  final double? invoiceExpense4;
  final double? tax1;
  final double? tax2;
  final double? tax3;
  final double? tax4;
  final double? tax5;
  final double? tax6;
  final double? tax7;
  final double? tax8;
  final double? tax9;
  final double? tax10;
  final double? tax11;
  final double? tax12;
  final double? tax13;
  final double? tax14;
  final double? tax15;
  final double? tax16;
  final double? tax17;
  final double? tax18;
  final double? tax19;
  final double? tax20;
  final int? createdBy;
  final String? createdAt; // ISO8601 string
  final int? updatedBy;
  final String? updatedAt; // ISO8601 string

  CustomerAccountMovementModel({
    super.id, // 'id' field is inherited from BaseModel
    this.companyNo,
    this.branchNo,
    this.documentType,
    this.documentSerialNo,
    this.documentSequenceNo,
    this.documentLineNo,
    this.type,
    this.kind,
    this.documentNo,
    this.documentDate,
    this.description,
    this.vendorCode,
    this.accountKind,
    this.code,
    this.turnoverAccountCode,
    this.exchangeRate,
    this.responsibilityCenterCode,
    this.cashServiceCode,
    this.quantity,
    this.amount,
    this.subtotal,
    this.dueDate,
    this.invoiceDiscount1,
    this.invoiceDiscount2,
    this.invoiceDiscount3,
    this.invoiceDiscount4,
    this.invoiceDiscount5,
    this.invoiceDiscount6,
    this.invoiceExpense1,
    this.invoiceExpense2,
    this.invoiceExpense3,
    this.invoiceExpense4,
    this.tax1,
    this.tax2,
    this.tax3,
    this.tax4,
    this.tax5,
    this.tax6,
    this.tax7,
    this.tax8,
    this.tax9,
    this.tax10,
    this.tax11,
    this.tax12,
    this.tax13,
    this.tax14,
    this.tax15,
    this.tax16,
    this.tax17,
    this.tax18,
    this.tax19,
    this.tax20,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  /// Map'ten CustomerAccountMovementModel oluşturur.
  factory CustomerAccountMovementModel.fromMap(Map<String, dynamic> map) {
    return CustomerAccountMovementModel(
      id: map['id'] as String?,
      companyNo: map['companyNo'] as int?,
      branchNo: map['branchNo'] as int?,
      documentType: map['documentType'] as int?,
      documentSerialNo: map['documentSerialNo'] as String?,
      documentSequenceNo: map['documentSequenceNo'] as int?,
      documentLineNo: map['documentLineNo'] as int?,
      type: map['type'] as int?,
      kind: map['kind'] as int?,
      documentNo: map['documentNo'] as String?,
      documentDate: map['documentDate'] as String?,
      description: map['description'] as String?,
      vendorCode: map['vendorCode'] as String?,
      accountKind: map['accountKind'] as int?,
      code: map['code'] as String?,
      turnoverAccountCode: map['turnoverAccountCode'] as String?,
      exchangeRate: (map['exchangeRate'] as num?)?.toDouble(),
      responsibilityCenterCode: map['responsibilityCenterCode'] as String?,
      cashServiceCode: map['cashServiceCode'] as String?,
      quantity: (map['quantity'] as num?)?.toDouble(),
      amount: (map['amount'] as num?)?.toDouble(),
      subtotal: (map['subtotal'] as num?)?.toDouble(),
      dueDate: map['dueDate'] as int?,
      invoiceDiscount1: (map['invoiceDiscount1'] as num?)?.toDouble(),
      invoiceDiscount2: (map['invoiceDiscount2'] as num?)?.toDouble(),
      invoiceDiscount3: (map['invoiceDiscount3'] as num?)?.toDouble(),
      invoiceDiscount4: (map['invoiceDiscount4'] as num?)?.toDouble(),
      invoiceDiscount5: (map['invoiceDiscount5'] as num?)?.toDouble(),
      invoiceDiscount6: (map['invoiceDiscount6'] as num?)?.toDouble(),
      invoiceExpense1: (map['invoiceExpense1'] as num?)?.toDouble(),
      invoiceExpense2: (map['invoiceExpense2'] as num?)?.toDouble(),
      invoiceExpense3: (map['invoiceExpense3'] as num?)?.toDouble(),
      invoiceExpense4: (map['invoiceExpense4'] as num?)?.toDouble(),
      tax1: (map['tax1'] as num?)?.toDouble(),
      tax2: (map['tax2'] as num?)?.toDouble(),
      tax3: (map['tax3'] as num?)?.toDouble(),
      tax4: (map['tax4'] as num?)?.toDouble(),
      tax5: (map['tax5'] as num?)?.toDouble(),
      tax6: (map['tax6'] as num?)?.toDouble(),
      tax7: (map['tax7'] as num?)?.toDouble(),
      tax8: (map['tax8'] as num?)?.toDouble(),
      tax9: (map['tax9'] as num?)?.toDouble(),
      tax10: (map['tax10'] as num?)?.toDouble(),
      tax11: (map['tax11'] as num?)?.toDouble(),
      tax12: (map['tax12'] as num?)?.toDouble(),
      tax13: (map['tax13'] as num?)?.toDouble(),
      tax14: (map['tax14'] as num?)?.toDouble(),
      tax15: (map['tax15'] as num?)?.toDouble(),
      tax16: (map['tax16'] as num?)?.toDouble(),
      tax17: (map['tax17'] as num?)?.toDouble(),
      tax18: (map['tax18'] as num?)?.toDouble(),
      tax19: (map['tax19'] as num?)?.toDouble(),
      tax20: (map['tax20'] as num?)?.toDouble(),
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
      'companyNo': companyNo,
      'branchNo': branchNo,
      'documentType': documentType,
      'documentSerialNo': documentSerialNo,
      'documentSequenceNo': documentSequenceNo,
      'documentLineNo': documentLineNo,
      'type': type,
      'kind': kind,
      'documentNo': documentNo,
      'documentDate': documentDate,
      'description': description,
      'vendorCode': vendorCode,
      'accountKind': accountKind,
      'code': code,
      'turnoverAccountCode': turnoverAccountCode,
      'exchangeRate': exchangeRate,
      'responsibilityCenterCode': responsibilityCenterCode,
      'cashServiceCode': cashServiceCode,
      'quantity': quantity,
      'amount': amount,
      'subtotal': subtotal,
      'dueDate': dueDate,
      'invoiceDiscount1': invoiceDiscount1,
      'invoiceDiscount2': invoiceDiscount2,
      'invoiceDiscount3': invoiceDiscount3,
      'invoiceDiscount4': invoiceDiscount4,
      'invoiceDiscount5': invoiceDiscount5,
      'invoiceDiscount6': invoiceDiscount6,
      'invoiceExpense1': invoiceExpense1,
      'invoiceExpense2': invoiceExpense2,
      'invoiceExpense3': invoiceExpense3,
      'invoiceExpense4': invoiceExpense4,
      'tax1': tax1,
      'tax2': tax2,
      'tax3': tax3,
      'tax4': tax4,
      'tax5': tax5,
      'tax6': tax6,
      'tax7': tax7,
      'tax8': tax8,
      'tax9': tax9,
      'tax10': tax10,
      'tax11': tax11,
      'tax12': tax12,
      'tax13': tax13,
      'tax14': tax14,
      'tax15': tax15,
      'tax16': tax16,
      'tax17': tax17,
      'tax18': tax18,
      'tax19': tax19,
      'tax20': tax20,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt,
    };
  }

  static String get staticTableName => 'customer_account_movements';

  @override
  String get tableName => staticTableName;

  @override
  CustomerAccountMovementModel fromMap(Map<String, dynamic> map) {
    return CustomerAccountMovementModel.fromMap(map);
  }
}
