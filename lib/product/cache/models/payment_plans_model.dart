import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class PaymentPlanModel extends BaseModel {
  final int? no;
  final String? code;
  final String? name;
  final String? subtotal;
  final int? createdBy;
  final String? createdAt; // ISO8601 string
  final int? updatedBy;
  final String? updatedAt; // ISO8601 string

  PaymentPlanModel({
    super.id, // 'id' field is inherited from BaseModel
    this.no,
    this.code,
    this.name,
    this.subtotal,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  /// Map'ten PaymentPlanModel oluşturur.
  factory PaymentPlanModel.fromMap(Map<String, dynamic> map) {
    return PaymentPlanModel(
      id: map['id'] as String?,
      no: map['no'] as int?,
      code: map['code'] as String?,
      name: map['name'] as String?,
      subtotal: map['subtotal'] as String?,
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
      'no': no,
      'code': code,
      'name': name,
      'subtotal': subtotal,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt,
    };
  }

  static String get staticTableName => 'payment_plans';

  @override
  String get tableName => staticTableName;

  @override
  PaymentPlanModel fromMap(Map<String, dynamic> map) {
    return PaymentPlanModel.fromMap(map);
  }
}
