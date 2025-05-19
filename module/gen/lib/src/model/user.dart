import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'data.dart';
import 'support.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class User extends INetworkModel<User> with EquatableMixin {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<UserData>? data;
  final Support? support;

  User({this.page, this.perPage, this.total, this.totalPages, this.data, this.support});

  @override
  User fromJson(Map<String, dynamic> json) => User.fromJson(json);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [page, perPage, total, totalPages, data, support];

  User copyWith({int? page, int? perPage, int? total, int? totalPages, List<UserData>? data, Support? support}) {
    return User(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      totalPages: totalPages ?? this.totalPages,
      data: data ?? this.data,
      support: support ?? this.support,
    );
  }
}
