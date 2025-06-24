import 'package:core/core.dart'; // Assuming BaseModel is in your core package

class CustomerAddressModel extends BaseModel {
  final String? accountCode;
  final int? addressNo;
  final String? street;
  final String? neighborhood;
  final String? avenue;
  final String? district;
  final String? apartmentNo;
  final String? zipCode;
  final String? county;
  final String? city;
  final String? addressCode;
  final String? phoneCountryCode;
  final String? phoneAreaCode;
  final String? phoneNo1;
  final String? phoneNo2;
  final String? representativeCode;
  final String? specialNote;
  final double? visitDay;
  final double? gpsLatitude;
  final double? gpsLongitude;
  final int? visitWeek;
  final int? visitDay2_1;
  final int? visitDay2_2;
  final int? visitDay2_3;
  final int? visitDay2_4;
  final int? visitDay2_5;
  final int? visitDay2_6;
  final int? visitDay2_7;
  final String? eInvoiceAlias;
  final int? createdBy;
  final String? createdAt; // ISO8601 string
  final int? updatedBy;
  final String? updatedAt; // ISO8601 string

  CustomerAddressModel({
    super.id, // 'id' field is inherited from BaseModel
    this.accountCode,
    this.addressNo,
    this.street,
    this.neighborhood,
    this.avenue,
    this.district,
    this.apartmentNo,
    this.zipCode,
    this.county,
    this.city,
    this.addressCode,
    this.phoneCountryCode,
    this.phoneAreaCode,
    this.phoneNo1,
    this.phoneNo2,
    this.representativeCode,
    this.specialNote,
    this.visitDay,
    this.gpsLatitude,
    this.gpsLongitude,
    this.visitWeek,
    this.visitDay2_1,
    this.visitDay2_2,
    this.visitDay2_3,
    this.visitDay2_4,
    this.visitDay2_5,
    this.visitDay2_6,
    this.visitDay2_7,
    this.eInvoiceAlias,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  /// Map'ten CustomerAddressModel oluşturur.
  factory CustomerAddressModel.fromMap(Map<String, dynamic> map) {
    return CustomerAddressModel(
      id: map['id'] as String?,
      accountCode: map['accountCode'] as String?,
      addressNo: map['addressNo'] as int?,
      street: map['street'] as String?,
      neighborhood: map['neighborhood'] as String?,
      avenue: map['avenue'] as String?,
      district: map['district'] as String?,
      apartmentNo: map['apartmentNo'] as String?,
      zipCode: map['zipCode'] as String?,
      county: map['county'] as String?,
      city: map['city'] as String?,
      addressCode: map['addressCode'] as String?,
      phoneCountryCode: map['phoneCountryCode'] as String?,
      phoneAreaCode: map['phoneAreaCode'] as String?,
      phoneNo1: map['phoneNo1'] as String?,
      phoneNo2: map['phoneNo2'] as String?,
      representativeCode: map['representativeCode'] as String?,
      specialNote: map['specialNote'] as String?,
      visitDay: (map['visitDay'] as num?)?.toDouble(),
      gpsLatitude: (map['gpsLatitude'] as num?)?.toDouble(),
      gpsLongitude: (map['gpsLongitude'] as num?)?.toDouble(),
      visitWeek: map['visitWeek'] as int?,
      visitDay2_1: map['visitDay2_1'] as int?,
      visitDay2_2: map['visitDay2_2'] as int?,
      visitDay2_3: map['visitDay2_3'] as int?,
      visitDay2_4: map['visitDay2_4'] as int?,
      visitDay2_5: map['visitDay2_5'] as int?,
      visitDay2_6: map['visitDay2_6'] as int?,
      visitDay2_7: map['visitDay2_7'] as int?,
      eInvoiceAlias: map['eInvoiceAlias'] as String?,
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
      'accountCode': accountCode,
      'addressNo': addressNo,
      'street': street,
      'neighborhood': neighborhood,
      'avenue': avenue,
      'district': district,
      'apartmentNo': apartmentNo,
      'zipCode': zipCode,
      'county': county,
      'city': city,
      'addressCode': addressCode,
      'phoneCountryCode': phoneCountryCode,
      'phoneAreaCode': phoneAreaCode,
      'phoneNo1': phoneNo1,
      'phoneNo2': phoneNo2,
      'representativeCode': representativeCode,
      'specialNote': specialNote,
      'visitDay': visitDay,
      'gpsLatitude': gpsLatitude,
      'gpsLongitude': gpsLongitude,
      'visitWeek': visitWeek,
      'visitDay2_1': visitDay2_1,
      'visitDay2_2': visitDay2_2,
      'visitDay2_3': visitDay2_3,
      'visitDay2_4': visitDay2_4,
      'visitDay2_5': visitDay2_5,
      'visitDay2_6': visitDay2_6,
      'visitDay2_7': visitDay2_7,
      'eInvoiceAlias': eInvoiceAlias,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt,
    };
  }

  static String get staticTableName => 'CARI_HESAP_ADRESLERI';

  @override
  String get tableName => staticTableName;

  @override
  CustomerAddressModel fromMap(Map<String, dynamic> map) {
    return CustomerAddressModel.fromMap(map);
  }
}