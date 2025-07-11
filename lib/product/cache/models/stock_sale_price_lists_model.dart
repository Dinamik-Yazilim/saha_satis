import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class StockSalePriceListModel extends BaseModel {
  final int? sequenceNo;
  final String? description;
  final bool? vatIncluded;
  final String? startDate; // ISO8601 string
  final String? endDate; // ISO8601 string
  final int? appliedPrice;
  final int? createdBy;
  final String? createdAt; // ISO8601 string
  final int? updatedBy;
  final String? updatedAt; // ISO8601 string

  StockSalePriceListModel({
    super.id, // 'id' field is inherited from BaseModel
    this.sequenceNo,
    this.description,
    this.vatIncluded,
    this.startDate,
    this.endDate,
    this.appliedPrice,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  /// Map'ten StockSalePriceListModel oluşturur.
  factory StockSalePriceListModel.fromMap(Map<String, dynamic> map) {
    return StockSalePriceListModel(
      id: map['id'] as String?,
      sequenceNo: map['sequenceNo'] as int?,
      description: map['description'] as String?,
      vatIncluded: map['vatIncluded'] as bool?, // SQLite stores booleans as 0 or 1
      startDate: map['startDate'] as String?,
      endDate: map['endDate'] as String?,
      appliedPrice: map['appliedPrice'] as int?,
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
      'sequenceNo': sequenceNo,
      'description': description,
      'vatIncluded': vatIncluded == true ? 1 : 0, // Convert bool to int for SQLite
      'startDate': startDate,
      'endDate': endDate,
      'appliedPrice': appliedPrice,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt,
    };
  }

  static String get staticTableName => 'stock_sale_price_lists';

  @override
  String get tableName => staticTableName;

  @override
  StockSalePriceListModel fromMap(Map<String, dynamic> map) {
    return StockSalePriceListModel.fromMap(map);
  }
}
