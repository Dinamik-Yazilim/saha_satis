import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class ProjectModel extends BaseModel {
  final String? code;
  final String? name;
  final String? customerCode;
  final String? ownerCode;
  final String? documentCode;
  final String? sectorCode;
  final String? groupCode;
  final int? status;
  final String? description;
  final String? mainProjectCode;
  final int? plannedDuration;
  final String? plannedStartDate; // ISO8601 string
  final String? plannedEndDate; // ISO8601 string
  final String? actualStartDate; // ISO8601 string
  final String? actualEndDate; // ISO8601 string
  final String? startDelayReason;
  final String? endDelayReason;
  final int? createdBy;
  final String? createdAt; // ISO8601 string
  final int? updatedBy;
  final String? updatedAt; // ISO8601 string

  ProjectModel({
    super.id, // 'id' field is inherited from BaseModel
    this.code,
    this.name,
    this.customerCode,
    this.ownerCode,
    this.documentCode,
    this.sectorCode,
    this.groupCode,
    this.status,
    this.description,
    this.mainProjectCode,
    this.plannedDuration,
    this.plannedStartDate,
    this.plannedEndDate,
    this.actualStartDate,
    this.actualEndDate,
    this.startDelayReason,
    this.endDelayReason,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  /// Creates a [ProjectModel] from a Map.
  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      id: map['id'] as String?,
      code: map['code'] as String?,
      name: map['name'] as String?,
      customerCode: map['customerCode'] as String?,
      ownerCode: map['ownerCode'] as String?,
      documentCode: map['documentCode'] as String?,
      sectorCode: map['sectorCode'] as String?,
      groupCode: map['groupCode'] as String?,
      status: map['status'] as int?,
      description: map['description'] as String?,
      mainProjectCode: map['mainProjectCode'] as String?,
      plannedDuration: map['plannedDuration'] as int?,
      plannedStartDate: map['plannedStartDate'] as String?,
      plannedEndDate: map['plannedEndDate'] as String?,
      actualStartDate: map['actualStartDate'] as String?,
      actualEndDate: map['actualEndDate'] as String?,
      startDelayReason: map['startDelayReason'] as String?,
      endDelayReason: map['endDelayReason'] as String?,
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
      'customerCode': customerCode,
      'ownerCode': ownerCode,
      'documentCode': documentCode,
      'sectorCode': sectorCode,
      'groupCode': groupCode,
      'status': status,
      'description': description,
      'mainProjectCode': mainProjectCode,
      'plannedDuration': plannedDuration,
      'plannedStartDate': plannedStartDate,
      'plannedEndDate': plannedEndDate,
      'actualStartDate': actualStartDate,
      'actualEndDate': actualEndDate,
      'startDelayReason': startDelayReason,
      'endDelayReason': endDelayReason,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt,
    };
  }

  static String get staticTableName => 'projects';

  @override
  String get tableName => staticTableName;

  @override
  ProjectModel fromMap(Map<String, dynamic> map) {
    return ProjectModel.fromMap(map);
  }
}
