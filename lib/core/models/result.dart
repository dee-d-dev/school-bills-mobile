import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T value) = _SuccessResult;
  const factory Result.error(CustomError error) = _ErrorResult;
}

class CustomError {
  final int code;
  final String message;

  const CustomError({
    required this.code,
    required this.message,
  });

  const CustomError.message(this.message, {this.code = -1});
}
