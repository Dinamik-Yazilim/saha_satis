import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class PersonnelDefinitionModel extends BaseModel {
  final String? personnelCode;
  final String? firstName;
  final String? lastName;
  final String? type;
  final String? currencyType;
  final String? userNo;
  final String? warehouseNo;
  final String? mobilePhone;
  final String? email;
  final String? calendarCode;
  final String? identityNo;
  final String? createdBy;
  final String? createdAt; // ISO8601 string
  final String? updatedBy;
  final String? updatedAt; // ISO8601 string

  PersonnelDefinitionModel({
    super.id, // 'id' field is inherited from BaseModel
    this.personnelCode,
    this.firstName,
    this.lastName,
    this.type,
    this.currencyType,
    this.userNo,
    this.warehouseNo,
    this.mobilePhone,
    this.email,
    this.calendarCode,
    this.identityNo,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  /// Map'ten PersonnelDefinitionModel oluşturur.
  factory PersonnelDefinitionModel.fromMap(Map<String, dynamic> map) {
    return PersonnelDefinitionModel(
      id: map['id'] as String?,
      personnelCode: map['personnelCode'] as String?,
      firstName: map['firstName'] as String?,
      lastName: map['lastName'] as String?,
      type: map['type'] as String?,
      currencyType: map['currencyType'] as String?,
      userNo: map['userNo'] as String?,
      warehouseNo: map['warehouseNo'] as String?,
      mobilePhone: map['mobilePhone'] as String?,
      email: map['email'] as String?,
      calendarCode: map['calendarCode'] as String?,
      identityNo: map['identityNo'] as String?,
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
      'personnelCode': personnelCode,
      'firstName': firstName,
      'lastName': lastName,
      'type': type,
      'currencyType': currencyType,
      'userNo': userNo,
      'warehouseNo': warehouseNo,
      'mobilePhone': mobilePhone,
      'email': email,
      'calendarCode': calendarCode,
      'identityNo': identityNo,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt,
    };
  }

  static String get staticTableName => 'CARI_PERSONEL_TANIMLARI';

  @override
  String get tableName => staticTableName;

  @override
  PersonnelDefinitionModel fromMap(Map<String, dynamic> map) {
    return PersonnelDefinitionModel.fromMap(map);
  }
}