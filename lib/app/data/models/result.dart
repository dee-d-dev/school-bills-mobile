import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/result.g.dart';
part 'generated/result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T value) = _SuccessResult;
  const factory Result.error(CustomError error) = _ErrorResult;
}

@JsonSerializable(includeIfNull: false)
class CustomError {
  final String message;
  final String? status;

  const CustomError({
    required this.message,
    required this.status,
  });

  factory CustomError.message(String msg) =>
      CustomError(message: msg, status: null);

  factory CustomError.fromJson(Map<String, Object?> json) =>
      _$CustomErrorFromJson(json);
}
