import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class StockSalePriceListModel extends BaseModel {
  final String? sequenceNo;
  final String? description;
  final bool? vatIncluded;
  final String? startDate; // ISO8601 string
  final String? endDate; // ISO8601 string
  final String? appliedPrice;
  final String? createdBy;
  final String? createdAt; // ISO8601 string
  final String? updatedBy;
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

  /// Creates a [StockSalePriceListModel] from a Map.
  factory StockSalePriceListModel.fromMap(Map<String, dynamic> map) {
    return StockSalePriceListModel(
      id: map['id'] as String?,
      sequenceNo: map['sequenceNo'] as String?,
      description: map['description'] as String?,
      vatIncluded: map['vatIncluded'] == 1, // SQLite stores booleans as 0 or 1
      startDate: map['startDate'] as String?,
      endDate: map['endDate'] as String?,
      appliedPrice: map['appliedPrice'] as String?,
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

  static String get staticTableName => 'STOK_SATIS_FIYAT_LISTE_TANIMLARI';

  @override
  String get tableName => staticTableName;

  @override
  StockSalePriceListModel fromMap(Map<String, dynamic> map) {
    return StockSalePriceListModel.fromMap(map);
  }
}
