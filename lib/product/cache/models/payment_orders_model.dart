import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class PaymentOrderModel extends BaseModel {
  final int? companyNo;
  final int? branchNo;
  final int? type;
  final String? referenceNo;
  final String? bankNo;
  final String? debtor;
  final String? dueDate; // ISO8601 string
  final double? amount;
  final int? currency;
  final double? paidAmount;
  final int? ownerAccountKind;
  final String? ownerAccountCode;
  final int? ownerAccountGroupNo;
  final int? locationAccountKind;
  final String? locationAccountCode;
  final int? locationAccountGroupNo;
  final String? firstDocumentSerial;
  final int? firstDocumentSequenceNo;
  final int? firstDocumentLineNo;
  final int? lastPosition;
  final int? createdBy;
  final String? createdAt; // ISO8601 string
  final int? updatedBy;
  final String? updatedAt; // ISO8601 string

  PaymentOrderModel({
    super.id, // 'id' field is inherited from BaseModel
    this.companyNo,
    this.branchNo,
    this.type,
    this.referenceNo,
    this.bankNo,
    this.debtor,
    this.dueDate,
    this.amount,
    this.currency,
    this.paidAmount,
    this.ownerAccountKind,
    this.ownerAccountCode,
    this.ownerAccountGroupNo,
    this.locationAccountKind,
    this.locationAccountCode,
    this.locationAccountGroupNo,
    this.firstDocumentSerial,
    this.firstDocumentSequenceNo,
    this.firstDocumentLineNo,
    this.lastPosition,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  /// Map'ten PaymentOrderModel oluşturur.
  factory PaymentOrderModel.fromMap(Map<String, dynamic> map) {
    return PaymentOrderModel(
      id: map['id'] as String?,
      companyNo: map['companyNo'] as int?,
      branchNo: map['branchNo'] as int?,
      type: map['type'] as int?,
      referenceNo: map['referenceNo'] as String?,
      bankNo: map['bankNo'] as String?,
      debtor: map['debtor'] as String?,
      dueDate: map['dueDate'] as String?,
      amount: (map['amount'] as num?)?.toDouble(),
      currency: map['currency'] as int?,
      paidAmount: (map['paidAmount'] as num?)?.toDouble(),
      ownerAccountKind: map['ownerAccountKind'] as int?,
      ownerAccountCode: map['ownerAccountCode'] as String?,
      ownerAccountGroupNo: map['ownerAccountGroupNo'] as int?,
      locationAccountKind: map['locationAccountKind'] as int?,
      locationAccountCode: map['locationAccountCode'] as String?,
      locationAccountGroupNo: map['locationAccountGroupNo'] as int?,
      firstDocumentSerial: map['firstDocumentSerial'] as String?,
      firstDocumentSequenceNo: map['firstDocumentSequenceNo'] as int?,
      firstDocumentLineNo: map['firstDocumentLineNo'] as int?,
      lastPosition: map['lastPosition'] as int?,
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
      'type': type,
      'referenceNo': referenceNo,
      'bankNo': bankNo,
      'debtor': debtor,
      'dueDate': dueDate,
      'amount': amount,
      'currency': currency,
      'paidAmount': paidAmount,
      'ownerAccountKind': ownerAccountKind,
      'ownerAccountCode': ownerAccountCode,
      'ownerAccountGroupNo': ownerAccountGroupNo,
      'locationAccountKind': locationAccountKind,
      'locationAccountCode': locationAccountCode,
      'locationAccountGroupNo': locationAccountGroupNo,
      'firstDocumentSerial': firstDocumentSerial,
      'firstDocumentSequenceNo': firstDocumentSequenceNo,
      'firstDocumentLineNo': firstDocumentLineNo,
      'lastPosition': lastPosition,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt,
    };
  }

  static String get staticTableName => 'payment_orders';

  @override
  String get tableName => staticTableName;

  @override
  PaymentOrderModel fromMap(Map<String, dynamic> map) {
    return PaymentOrderModel.fromMap(map);
  }
}
