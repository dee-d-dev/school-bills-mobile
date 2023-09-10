import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:school_bills/app/data/models/result.dart';
import 'package:school_bills/core/services/network_service/network_service.dart';

final class NetworkServiceImpl implements NetworkService {
  final Dio dio;

  NetworkServiceImpl({required this.dio});

  @override
  Future<Response> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio
        .get(
          path,
          data: json.encode(data),
          queryParameters: queryParameters,
        )
        .onError<DioException>(
          (error, stackTrace) =>
              throw CustomError.fromJson(error.response?.data),
        );
  }

  @override
  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio
        .post(
          path,
          data: json.encode(data),
          queryParameters: queryParameters,
        )
        .onError<DioException>(
          (error, stackTrace) =>
              throw CustomError.fromJson(error.response?.data),
        );
  }

  String getErrorMessage(DioException error) {
    final message = error.message ?? 'An error occured';
    return switch (error.type) {
      DioExceptionType.badResponse => 'Bad response: $message',
      DioExceptionType.connectionError => 'Connection error: $message',
      DioExceptionType.badCertificate => 'Bad certificate: $message',
      DioExceptionType.cancel => 'Cancelled: $message',
      DioExceptionType.connectionTimeout => 'Connection timeout: $message',
      DioExceptionType.receiveTimeout => 'Recieve timeout: $message',
      DioExceptionType.sendTimeout => 'Send timeout: $message',
      DioExceptionType.unknown => 'Unknown: $message',
    };
  }
}