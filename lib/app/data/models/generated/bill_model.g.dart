// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../bill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillModel _$BillModelFromJson(Map<String, dynamic> json) => BillModel(
      id: json['id'] as String,
      adminId: json['admin_id'] as String,
      amount: (json['amount'] as num).toDouble(),
      title: json['title'] as String,
      accountNo: json['account_no'] as String,
      bankName: json['bank_name'] as String,
      faculty: json['faculty'] as String?,
      department: json['department'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$BillModelToJson(BillModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'admin_id': instance.adminId,
    'amount': instance.amount,
    'title': instance.title,
    'account_no': instance.accountNo,
    'bank_name': instance.bankName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('faculty', instance.faculty);
  writeNotNull('department', instance.department);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  return val;
}
