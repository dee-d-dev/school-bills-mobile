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

  bool get isStudent => role == 'student';
  String? get adminPosition => (faculty ?? '').isEmpty
      ? 'Department • $department'
      : 'Faculty • $faculty';

  String get fullName => '${firstName.trim()} ${lastName.trim()}';
  String get abbv =>
      '${firstName.trim().split('').first}${lastName.trim().split('').first}';

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
