import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class CustomerAccountModel extends BaseModel {
  final String? code;
  final String? title1;
  final String? title2;
  final String? taxOfficeName;
  final String? taxOfficeNo;
  final String? representativeCode;
  final String? email;
  final String? mobilePhone;
  final String? taxOfficeCode;
  final String? naceCode1;
  final String? naceCode2;
  final String? companyType;
  final int? createdBy;
  final String? createdAt; // ISO8601 string
  final int? updatedBy;
  final String? updatedAt; // ISO8601 string

  CustomerAccountModel({
    super.id, // 'id' field is inherited from BaseModel
    this.code,
    this.title1,
    this.title2,
    this.taxOfficeName,
    this.taxOfficeNo,
    this.representativeCode,
    this.email,
    this.mobilePhone,
    this.taxOfficeCode,
    this.naceCode1,
    this.naceCode2,
    this.companyType,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  /// Map'ten CustomerAccountModel oluşturur.
  factory CustomerAccountModel.fromMap(Map<String, dynamic> map) {
    return CustomerAccountModel(
      id: map['id'] as String?,
      code: map['code'] as String?,
      title1: map['title1'] as String?,
      title2: map['title2'] as String?,
      taxOfficeName: map['taxOfficeName'] as String?,
      taxOfficeNo: map['taxOfficeNo'] as String?,
      representativeCode: map['representativeCode'] as String?,
      email: map['email'] as String?,
      mobilePhone: map['mobilePhone'] as String?,
      taxOfficeCode: map['taxOfficeCode'] as String?,
      naceCode1: map['naceCode1'] as String?,
      naceCode2: map['naceCode2'] as String?,
      companyType: map['companyType'] as String?,
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
      'title1': title1,
      'title2': title2,
      'taxOfficeName': taxOfficeName,
      'taxOfficeNo': taxOfficeNo,
      'representativeCode': representativeCode,
      'email': email,
      'mobilePhone': mobilePhone,
      'taxOfficeCode': taxOfficeCode,
      'naceCode1': naceCode1,
      'naceCode2': naceCode2,
      'companyType': companyType,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt,
    };
  }

  static String get staticTableName => 'CARI_HESAPLAR';

  @override
  String get tableName => staticTableName;

  @override
  CustomerAccountModel fromMap(Map<String, dynamic> map) {
    return CustomerAccountModel.fromMap(map);
  }
}