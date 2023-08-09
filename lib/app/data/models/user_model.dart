import 'package:json_annotation/json_annotation.dart';

part 'generated/user_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UserModel {
  final String id;
  final String? matricNo;
  final String firstName;
  final String lastName;
  final String? faculty;
  final String? department;
  final String role;
  final String email;

  const UserModel({
    required this.id,
    required this.matricNo,
    required this.firstName,
    required this.lastName,
    required this.faculty,
    required this.department,
    required this.role,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
