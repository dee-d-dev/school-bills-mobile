// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      billId: json['bill_id'] as String,
      adminId: json['admin_id'] as String,
      amount: json['amount'] as int,
      title: json['title'] as String,
      department: json['department'] as String,
      faculty: json['faculty'] as String,
      reference: json['reference'] as String,
      accountNo: json['account_no'] as String,
      bankName: json['bank_name'] as String,
      matricNo: json['matric_no'] as String,
      status: json['status'] as String,
      paidAt: DateTime.parse(json['paid_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'bill_id': instance.billId,
      'admin_id': instance.adminId,
      'amount': instance.amount,
      'title': instance.title,
      'department': instance.department,
      'faculty': instance.faculty,
      'reference': instance.reference,
      'account_no': instance.accountNo,
      'bank_name': instance.bankName,
      'matric_no': instance.matricNo,
      'status': instance.status,
      'paid_at': instance.paidAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };
