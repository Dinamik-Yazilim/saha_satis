import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class BankModel extends BaseModel {
  final String? code;
  final String? name;
  final int? createdBy;
  final String? createdAt; // ISO8601 string
  final int? updatedBy;
  final String? updatedAt; // ISO8601 string

  BankModel({super.id, this.code, this.name, this.createdBy, this.createdAt, this.updatedBy, this.updatedAt});

  /// Map'ten BankModel oluşturur.
  factory BankModel.fromMap(Map<String, dynamic> map) {
    return BankModel(
      id: map['id'] as String?,
      code: map['code'] as String?,
      name: map['name'] as String?,
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
      'code': code,
      'name': name,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt,
    };
  }

  static String get staticTableName => 'banks';

  @override
  String get tableName => staticTableName;

  @override
  BankModel fromMap(Map<String, dynamic> map) {
    return BankModel.fromMap(map);
  }
}
