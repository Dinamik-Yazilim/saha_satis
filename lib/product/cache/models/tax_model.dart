import 'package:core/core.dart';

class TaxModel extends BaseModel {
  final int? vatNo;
  final int? vatRate;

  TaxModel({super.id, this.vatNo, this.vatRate});
  static String get staticTableName => 'taxes';

  @override
  String get tableName => staticTableName;

  @override
  factory TaxModel.fromMap(Map<String, dynamic> map) {
    return TaxModel(id: map['id'] as int?, vatNo: map['vatNo'] as int?, vatRate: map['vatRate'] as int?);
  }
  @override
  Map<String, dynamic> toMap() {
    return {'id': id, 'vatNo': vatNo, 'vatRate': vatRate};
  }

  @override
  TaxModel fromMap(Map<String, dynamic> map) {
    return TaxModel.fromMap(map);
  }
}
