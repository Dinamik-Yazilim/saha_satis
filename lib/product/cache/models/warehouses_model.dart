import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class WarehouseModel extends BaseModel {
  final int? no;
  final String? name;
  final int? type;
  final int? createdBy;
  final String? createdAt; // ISO8601 string
  final int? updatedBy;
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
      no: map['no'] as int?,
      name: map['name'] as String?,
      type: map['type'] as int?,
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
      'name': name,
      'type': type,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt,
    };
  }

  static String get staticTableName => 'warehouses';

  @override
  String get tableName => staticTableName;

  @override
  WarehouseModel fromMap(Map<String, dynamic> map) {
    return WarehouseModel.fromMap(map);
  }
}
