// gen/lib/src/model/current_account_model.dart

import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'current_account_model.g.dart';

@JsonSerializable()
class CurrentAccountModel extends Equatable {
  // customer_accounts tablosundan gelen alanlar
  final String? id;
  @JsonKey(fromJson: _codeFromJson) // code için yine string dönüşümü
  final String? code;
  @JsonKey(name: 'name') // SQL alias: title1 AS name
  final String? title1;
  @JsonKey(name: 'name2') // SQL alias: title2 AS name2
  final String? title2;
  final String? taxOfficeName;
  final String? taxOfficeNo;
  final String? representativeCode; // Cari hesabın temsilci kodu
  final String? email;
  final String? mobilePhone;
  final String? taxOfficeCode;
  final String? naceCode1;
  final String? naceCode2;
  final int? companyType;
  final int? createdBy;
  final String? createdAt; // Eğer tarih string formatında geliyorsa
  final int? updatedBy;
  final String? updatedAt; // Eğer tarih string formatında geliyorsa

  // customer_addresses tablosundan gelen alanlar (doğrudan CurrentAccountModel içinde)
  @JsonKey(name: 'adId')
  final String? adId; // Adres ID'si
  final String? accountCode; // Adresin ait olduğu cari hesap kodu
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
  @JsonKey(name: 'representativeCode_address') // SQL alias: CAD.representativeCode AS representativeCode_address
  final String? adRepresentativeCode; // Adrese özel temsilci kodu
  final String? specialNote;
  final int? visitDay;
  @JsonKey(fromJson: _toDouble, toJson: _doubleToJson) // GPS için güvenli dönüşüm
  final double? gpsLatitude;
  @JsonKey(fromJson: _toDouble, toJson: _doubleToJson) // GPS için güvenli dönüşüm
  final double? gpsLongitude;
  final int? visitWeek;
  final int? visitDay2_1;
  final int? visitDay2_2;
  final int? visitDay2_3;
  final int? visitDay2_4;
  final int? visitDay2_5;
  final int? visitDay2_6;
  final int? visitDay2_7;
  final String? einvoiceAlias;
  @JsonKey(name: 'adCreatedBy')
  final int? adCreatedBy;
  @JsonKey(name: 'adCreatedAt')
  final String? adCreatedAt; // Eğer tarih string formatında geliyorsa
  @JsonKey(name: 'adUpdatedBy')
  final int? adUpdatedBy;
  @JsonKey(name: 'adUpdatedAt')
  final String? adUpdatedAt; // Eğer tarih string formatında geliyorsa

  const CurrentAccountModel({
    this.id,
    this.code,
    this.title1, // name yerine title1 kullandım, çakışma olmasın
    this.title2, // name2 yerine title2 kullandım
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
    // Adres alanları
    this.adId,
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
    this.adRepresentativeCode, // Adres temsilci kodu
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
    this.einvoiceAlias,
    this.adCreatedBy,
    this.adCreatedAt,
    this.adUpdatedBy,
    this.adUpdatedAt,
  });

  factory CurrentAccountModel.fromJson(Map<String, dynamic> json) => _$CurrentAccountModelFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentAccountModelToJson(this);

  // Gelen değeri String'e dönüştüren yardımcı metod
  static String? _codeFromJson(dynamic value) {
    if (value == null) {
      return null;
    }
    return value.toString();
  }

  // double dönüşümü için yardımcı metodlar
  static double? _toDouble(dynamic value) {
    if (value == null) {
      return null;
    }
    if (value is int) {
      return value.toDouble();
    }
    if (value is double) {
      return value;
    }
    if (value is String) {
      return double.tryParse(value);
    }
    return null; // Desteklenmeyen tip
  }

  static dynamic _doubleToJson(double? value) {
    return value; // toJson için ekstra dönüşüme gerek yok
  }

  @override
  List<Object?> get props => [
    id, code, title1, title2, taxOfficeName, taxOfficeNo, representativeCode,
    email, mobilePhone, taxOfficeCode, naceCode1, naceCode2, companyType,
    createdBy, createdAt, updatedBy, updatedAt,
    // Adres alanları props'a eklendi
    adId, accountCode, addressNo, street, neighborhood, avenue, district,
    apartmentNo, zipCode, county, city, addressCode, phoneCountryCode,
    phoneAreaCode, phoneNo1, phoneNo2, adRepresentativeCode, specialNote,
    visitDay, gpsLatitude, gpsLongitude, visitWeek,
    visitDay2_1, visitDay2_2, visitDay2_3, visitDay2_4, visitDay2_5, visitDay2_6, visitDay2_7,
    einvoiceAlias, adCreatedBy, adCreatedAt, adUpdatedBy, adUpdatedAt,
  ];

  
}
