// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomError _$CustomErrorFromJson(Map<String, dynamic> json) => CustomError(
      message: json['message'] as String,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CustomErrorToJson(CustomError instance) {
  final val = <String, dynamic>{
    'message': instance.message,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  return val;
}
