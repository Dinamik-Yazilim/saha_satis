import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class StockModel extends BaseModel {
  final String? code;
  final String? name;
  final String? shortName;
  final String? foreignName;
  final String? vendorCode;
  final String? unit1Name;
  final double? unit1Multiplier;
  final String? unit2Name;
  final double? unit2Multiplier;
  final String? unit3Name;
  final double? unit3Multiplier;
  final String? unit4Name;
  final double? unit4Multiplier;
  final int? retailTax;
  final int? wholesaleTax;
  final bool? salesBlocked; // Stored as INTEGER (0 or 1) in SQLite
  final bool? orderBlocked; // Stored as INTEGER (0 or 1) in SQLite
  final bool? goodsReceiptBlocked; // Stored as INTEGER (0 or 1) in SQLite
  final String? categoryCode;
  final String? brandCode;
  final String? sizeCode;
  final String? colorCode;
  final String? modelCode;
  final String? seasonCode;
  final String? origin;
  final String? mainGroupCode;
  final bool? detailTracking; // Stored as INTEGER (0 or 1) in SQLite
  final bool? isPassive;
  final int? createdBy;
  final String? createdAt; // ISO8601 string
  final int? updatedBy;
  final String? updatedAt; // ISO8601 string

  StockModel({
    super.id, // 'id' field is inherited from BaseModel
    this.code,
    this.name,
    this.shortName,
    this.foreignName,
    this.vendorCode,
    this.unit1Name,
    this.unit1Multiplier,
    this.unit2Name,
    this.unit2Multiplier,
    this.unit3Name,
    this.unit3Multiplier,
    this.unit4Name,
    this.unit4Multiplier,
    this.retailTax,
    this.wholesaleTax,
    this.salesBlocked,
    this.orderBlocked,
    this.goodsReceiptBlocked,
    this.categoryCode,
    this.brandCode,
    this.sizeCode,
    this.colorCode,
    this.modelCode,
    this.seasonCode,
    this.origin,
    this.mainGroupCode,
    this.detailTracking,
    this.isPassive,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  /// Map'ten StockModel oluşturur.
  factory StockModel.fromMap(Map<String, dynamic> map) {
    return StockModel(
      id: map['id'] as String?,
      code: map['code'] as String?,
      name: map['name'] as String?,
      shortName: map['shortName'] as String?,
      foreignName: map['foreignName'] as String?,
      vendorCode: map['vendorCode'] as String?,
      unit1Name: map['unit1Name'] as String?,
      unit1Multiplier: (map['unit1Multiplier'] as num?)?.toDouble(),
      unit2Name: map['unit2Name'] as String?,
      unit2Multiplier: (map['unit2Multiplier'] as num?)?.toDouble(),
      unit3Name: map['unit3Name'] as String?,
      unit3Multiplier: (map['unit3Multiplier'] as num?)?.toDouble(),
      unit4Name: map['unit4Name'] as String?,
      unit4Multiplier: (map['unit4Multiplier'] as num?)?.toDouble(),
      retailTax: map['retailTax'] as int?,
      wholesaleTax: map['wholesaleTax'] as int?,
      salesBlocked: map['salesBlocked'] == 1, // SQLite stores booleans as 0 or 1
      orderBlocked: map['orderBlocked'] == 1, // SQLite stores booleans as 0 or 1
      goodsReceiptBlocked: map['goodsReceiptBlocked'] == 1, // SQLite stores booleans as 0 or 1
      categoryCode: map['categoryCode'] as String?,
      brandCode: map['brandCode'] as String?,
      sizeCode: map['sizeCode'] as String?,
      colorCode: map['colorCode'] as String?,
      modelCode: map['modelCode'] as String?,
      seasonCode: map['seasonCode'] as String?,
      origin: map['origin'] as String?,
      mainGroupCode: map['mainGroupCode'] as String?,
      detailTracking: map['detailTracking'] == 1, // SQLite stores booleans as 0 or 1
      isPassive: map['isPassive'] == 1, // SQLite stores booleans as 0 or 1
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
      'shortName': shortName,
      'foreignName': foreignName,
      'vendorCode': vendorCode,
      'unit1Name': unit1Name,
      'unit1Multiplier': unit1Multiplier,
      'unit2Name': unit2Name,
      'unit2Multiplier': unit2Multiplier,
      'unit3Name': unit3Name,
      'unit3Multiplier': unit3Multiplier,
      'unit4Name': unit4Name,
      'unit4Multiplier': unit4Multiplier,
      'retailTax': retailTax,
      'wholesaleTax': wholesaleTax,
      'salesBlocked': salesBlocked == true ? 1 : 0, // Convert bool to int for SQLite
      'orderBlocked': orderBlocked == true ? 1 : 0, // Convert bool to int for SQLite
      'goodsReceiptBlocked': goodsReceiptBlocked == true ? 1 : 0, // Convert bool to int for SQLite
      'categoryCode': categoryCode,
      'brandCode': brandCode,
      'sizeCode': sizeCode,
      'colorCode': colorCode,
      'modelCode': modelCode,
      'seasonCode': seasonCode,
      'origin': origin,
      'mainGroupCode': mainGroupCode,
      'detailTracking': detailTracking == true ? 1 : 0, // Convert bool to int for SQLite
      'isPassive': detailTracking == true ? 1 : 0, // Convert bool to int for SQLite
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt,
    };
  }

  static String get staticTableName => 'stocks';

  @override
  String get tableName => staticTableName;

  @override
  StockModel fromMap(Map<String, dynamic> map) {
    return StockModel.fromMap(map);
  }
}
