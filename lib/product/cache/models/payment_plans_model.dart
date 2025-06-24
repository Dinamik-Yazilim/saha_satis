import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class PaymentPlanModel extends BaseModel {
  final String? no;
  final String? code;
  final String? name;
  final double? subtotal;
  final String? createdBy;
  final String? createdAt; // ISO8601 string
  final String? updatedBy;
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
      no: map['no'] as String?,
      code: map['code'] as String?,
      name: map['name'] as String?,
      subtotal: (map['subtotal'] as num?)?.toDouble(),
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

  static String get staticTableName => 'ODEME_PLANLARI';

  @override
  String get tableName => staticTableName;

  @override
  PaymentPlanModel fromMap(Map<String, dynamic> map) {
    return PaymentPlanModel.fromMap(map);
  }
}