// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      matricNo: json['matric_no'] as String?,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      faculty: json['faculty'] as String?,
      department: json['department'] as String?,
      role: json['role'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('matric_no', instance.matricNo);
  val['first_name'] = instance.firstName;
  val['last_name'] = instance.lastName;
  writeNotNull('faculty', instance.faculty);
  writeNotNull('department', instance.department);
  val['role'] = instance.role;
  val['email'] = instance.email;
  return val;
}
