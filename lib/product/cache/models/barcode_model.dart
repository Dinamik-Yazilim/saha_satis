import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class BarcodeModel extends BaseModel {
  final String? code;
  final String? stockCode;
  final int? barcodeType;
  final int? content;
  final int? unitPointer;
  final int? sizePointer;
  final int? colorPointer;
  final int? createdBy;
  final String? createdAt; // ISO8601 string
  final int? updatedBy;
  final String? updatedAt; // ISO8601 string

  BarcodeModel({
    super.id, // 'id' field is inherited from BaseModel
    this.code,
    this.stockCode,
    this.barcodeType,
    this.content,
    this.unitPointer,
    this.sizePointer,
    this.colorPointer,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  /// Map'ten BarcodeModel oluşturur.
  factory BarcodeModel.fromMap(Map<String, dynamic> map) {
    return BarcodeModel(
      id: map['id'] as String?,
      code: map['code'] as String?,
      stockCode: map['stockCode'] as String?,
      barcodeType: map['barcodeType'] as int?,
      content: map['content'] as int?,
      unitPointer: map['unitPointer'] as int?,
      sizePointer: map['sizePointer'] as int?,
      colorPointer: map['colorPointer'] as int?,
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
      'stockCode': stockCode,
      'barcodeType': barcodeType,
      'content': content,
      'unitPointer': unitPointer,
      'sizePointer': sizePointer,
      'colorPointer': colorPointer,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt,
    };
  }

  static String get staticTableName => 'barcodes';

  @override
  String get tableName => staticTableName;

  @override
  BarcodeModel fromMap(Map<String, dynamic> map) {
    return BarcodeModel.fromMap(map);
  }
}
