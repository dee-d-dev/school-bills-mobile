import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends InterceptorsWrapper {
  static const authorization = 'Authorization';

  final SharedPreferences preferences;

  AuthInterceptor({required this.preferences});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final sessionToken = preferences.getString('token');
    debugPrint('SESSION TOKEN: $sessionToken');

    if (sessionToken != null) {
      debugPrint('SETTING TOKEN');
      options.headers[authorization] = sessionToken;
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 /* unauthorized */) {
      // logout
    }

    super.onError(err, handler);
  }
}
