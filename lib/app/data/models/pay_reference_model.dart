import 'package:json_annotation/json_annotation.dart';

part 'generated/pay_reference_model.g.dart';

@JsonSerializable(includeIfNull: false)
class PayReferenceModel {
  final String authorizationUrl;
  final String accessCode;
  final String reference;

  const PayReferenceModel({
    required this.authorizationUrl,
    required this.accessCode,
    required this.reference,
  });

  factory PayReferenceModel.fromJson(Map<String, Object?> json) =>
      _$PayReferenceModelFromJson(json);
}
