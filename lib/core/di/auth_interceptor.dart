import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends InterceptorsWrapper {
  static const authorization = 'Authorization';
  static const requiresAuth = 'requiresAuthentication';

  final SharedPreferences preferences;

  AuthInterceptor({required this.preferences});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final requestRequiresAuth = options.extra.containsKey(requiresAuth)
        ? options.extra[requiresAuth] as bool
        : true;

    if (requestRequiresAuth) {
      final sessionToken = preferences.getString('token');

      if (sessionToken != null) {
        options.headers[authorization] = sessionToken;
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException exception, ErrorInterceptorHandler handler) async {
    if (exception.response?.statusCode == 401 /* unauthorized */) {
      // logout
    }

    super.onError(exception, handler);
  }
}
