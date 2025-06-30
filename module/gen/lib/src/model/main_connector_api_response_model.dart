import 'package:equatable/equatable.dart';
import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_connector_api_response_model.g.dart';

@JsonSerializable()
class MainApiResponseModel extends INetworkModel<MainApiResponseModel> with EquatableMixin {
  final bool? success;
  final ApiData? data;

  MainApiResponseModel({this.success, this.data});

  @override
  List<Object?> get props => [success, data];

  @override
  MainApiResponseModel fromJson(Map<String, dynamic> json) => _$MainApiResponseModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MainApiResponseModelToJson(this);
}

@JsonSerializable()
class ApiData with EquatableMixin {
  final List<dynamic>? recordsets;
  final Map<String, dynamic>? output;
  final List<int>? rowsAffected;

  ApiData({this.recordsets, this.output, this.rowsAffected});

  @override
  List<Object?> get props => [recordsets, output, rowsAffected];

  factory ApiData.fromJson(Map<String, dynamic> json) => _$ApiDataFromJson(json);
  Map<String, dynamic> toJson() => _$ApiDataToJson(this);
}
