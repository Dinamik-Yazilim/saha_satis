import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserData extends INetworkModel<UserData> with EquatableMixin {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  UserData({this.id, this.email, this.firstName, this.lastName, this.avatar});

  @override
  UserData fromJson(Map<String, dynamic> json) => UserData.fromJson(json);

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserDataToJson(this);

  @override
  List<Object?> get props => [id, email, firstName, lastName, avatar];

  UserData copyWith({int? id, String? email, String? firstName, String? lastName, String? avatar}) {
    return UserData(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
    );
  }
}
