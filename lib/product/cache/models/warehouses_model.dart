import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class WarehouseModel extends BaseModel {
  final String? no;
  final String? name;
  final String? type;
  final String? createdBy;
  final String? createdAt; // ISO8601 string
  final String? updatedBy;
  final String? updatedAt; // ISO8601 string

  WarehouseModel({
    super.id, // 'id' field is inherited from BaseModel
    this.no,
    this.name,
    this.type,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  /// Creates a [WarehouseModel] from a Map.
  factory WarehouseModel.fromMap(Map<String, dynamic> map) {
    return WarehouseModel(
      id: map['id'] as String?,
      no: map['no'] as String?,
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
      'no': no,
      'name': name,
      'type': type,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt,
    };
  }

  static String get staticTableName => 'DEPOLAR';

  @override
  String get tableName => staticTableName;

  @override
  WarehouseModel fromMap(Map<String, dynamic> map) {
    return WarehouseModel.fromMap(map);
  }
}
