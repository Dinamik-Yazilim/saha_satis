import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class CashboxModel extends BaseModel {
  final String? code;
  final String? name;
  final String? type;
  final String? createdBy;
  final String? createdAt; // ISO8601 string
  final String? updatedBy;
  final String? updatedAt; // ISO8601 string

  CashboxModel({
    super.id, // 'id' field is inherited from BaseModel
    this.code,
    this.name,
    this.type,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  /// Map'ten CashboxModel oluşturur.
  factory CashboxModel.fromMap(Map<String, dynamic> map) {
    return CashboxModel(
      id: map['id'] as String?,
      code: map['code'] as String?,
      name: map['name'] as String?,
      type: map['type'] as String?,
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
      'code': code,
      'name': name,
      'type': type,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt,
    };
  }

  static String get staticTableName => 'KASALAR';

  @override
  String get tableName => staticTableName;

  @override
  CashboxModel fromMap(Map<String, dynamic> map) {
    return CashboxModel.fromMap(map);
  }
}
