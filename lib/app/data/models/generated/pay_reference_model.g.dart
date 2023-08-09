// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../pay_reference_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayReferenceModel _$PayReferenceModelFromJson(Map<String, dynamic> json) =>
    PayReferenceModel(
      authorizationUrl: json['authorization_url'] as String,
      accessCode: json['access_code'] as String,
      reference: json['reference'] as String,
    );

Map<String, dynamic> _$PayReferenceModelToJson(PayReferenceModel instance) =>
    <String, dynamic>{
      'authorization_url': instance.authorizationUrl,
      'access_code': instance.accessCode,
      'reference': instance.reference,
    };
