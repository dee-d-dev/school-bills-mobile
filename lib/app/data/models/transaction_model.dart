import 'package:json_annotation/json_annotation.dart';

part 'generated/transaction_model.g.dart';

@JsonSerializable(includeIfNull: false)
class TransactionModel {
  final String id;
  final String userId;
  final String billId;
  final String adminId;
  final int amount;
  final String title;
  final String department;
  final String faculty;
  final String reference;
  final String accountNo;
  final String bankName;
  final String matricNo;
  final String status;
  final DateTime paidAt;
  final DateTime createdAt;

  const TransactionModel({
    required this.id,
    required this.userId,
    required this.billId,
    required this.adminId,
    required this.amount,
    required this.title,
    required this.department,
    required this.faculty,
    required this.reference,
    required this.accountNo,
    required this.bankName,
    required this.matricNo,
    required this.status,
    required this.paidAt,
    required this.createdAt,
  });

  factory TransactionModel.fromJson(Map<String, Object?> json) =>
      _$TransactionModelFromJson(json);
}
