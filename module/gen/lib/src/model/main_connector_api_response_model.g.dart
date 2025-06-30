// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_connector_api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainApiResponseModel _$MainApiResponseModelFromJson(
        Map<String, dynamic> json) =>
    MainApiResponseModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : ApiData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainApiResponseModelToJson(
        MainApiResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

ApiData _$ApiDataFromJson(Map<String, dynamic> json) => ApiData(
      recordsets: json['recordsets'] as List<dynamic>?,
      output: json['output'] as Map<String, dynamic>?,
      rowsAffected: (json['rowsAffected'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$ApiDataToJson(ApiData instance) => <String, dynamic>{
      'recordsets': instance.recordsets,
      'output': instance.output,
      'rowsAffected': instance.rowsAffected,
    };
