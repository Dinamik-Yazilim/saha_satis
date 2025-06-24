import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class PaymentOrderModel extends BaseModel {
  final String? companyNo;
  final String? branchNo;
  final String? type;
  final String? referenceNo;
  final String? bankNo;
  final String? debtor;
  final String? dueDate; // ISO8601 string
  final double? amount;
  final String? currency;
  final double? paidAmount;
  final String? ownerAccountKind;
  final String? ownerAccountCode;
  final String? ownerAccountGroupNo;
  final String? locationAccountKind;
  final String? locationAccountCode;
  final String? locationAccountGroupNo;
  final String? firstDocumentSerial;
  final String? firstDocumentSequenceNo;
  final int? firstDocumentLineNo;
  final String? lastPosition;
  final String? createdBy;
  final String? createdAt; // ISO8601 string
  final String? updatedBy;
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
      companyNo: map['companyNo'] as String?,
      branchNo: map['branchNo'] as String?,
      type: map['type'] as String?,
      referenceNo: map['referenceNo'] as String?,
      bankNo: map['bankNo'] as String?,
      debtor: map['debtor'] as String?,
      dueDate: map['dueDate'] as String?,
      amount: (map['amount'] as num?)?.toDouble(),
      currency: map['currency'] as String?,
      paidAmount: (map['paidAmount'] as num?)?.toDouble(),
      ownerAccountKind: map['ownerAccountKind'] as String?,
      ownerAccountCode: map['ownerAccountCode'] as String?,
      ownerAccountGroupNo: map['ownerAccountGroupNo'] as String?,
      locationAccountKind: map['locationAccountKind'] as String?,
      locationAccountCode: map['locationAccountCode'] as String?,
      locationAccountGroupNo: map['locationAccountGroupNo'] as String?,
      firstDocumentSerial: map['firstDocumentSerial'] as String?,
      firstDocumentSequenceNo: map['firstDocumentSequenceNo'] as String?,
      firstDocumentLineNo: map['firstDocumentLineNo'] as int?,
      lastPosition: map['lastPosition'] as String?,
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

  static String get staticTableName => 'ODEME_EMIRLERI';

  @override
  String get tableName => staticTableName;

  @override
  PaymentOrderModel fromMap(Map<String, dynamic> map) {
    return PaymentOrderModel.fromMap(map);
  }
}