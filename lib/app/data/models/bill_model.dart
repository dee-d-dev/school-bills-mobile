import 'package:json_annotation/json_annotation.dart';

part 'generated/bill_model.g.dart';

@JsonSerializable(includeIfNull: false)
class BillModel {
  final String id;
  final String adminId;
  final double amount;
  final String title;
  final String accountNo;
  final String bankName;
  final String? faculty;
  final String? department;

  const BillModel({
    required this.id,
    required this.adminId,
    required this.amount,
    required this.title,
    required this.accountNo,
    required this.bankName,
    required this.faculty,
    required this.department,
  });

  factory BillModel.fromJson(Map<String, Object?> json) =>
      _$BillModelFromJson(json);
}
