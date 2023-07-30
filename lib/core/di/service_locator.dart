import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:school_bills/app/data/repository/auth_repository_impl.dart';
import 'package:school_bills/app/domain/auth_repository.dart';
import 'package:school_bills/app/view/provider/auth_provider.dart';
import 'package:school_bills/core/di/auth_interceptor.dart';
import 'package:school_bills/core/services/dialog_service/dialog_service.dart';
import 'package:school_bills/core/services/dialog_service/dialog_service_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  final sharesPreference = await SharedPreferences.getInstance();

  const timeout = Duration(minutes: 1);
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'baseUrl',
    receiveTimeout: timeout,
    connectTimeout: timeout,
    sendTimeout: timeout,
    contentType: 'application/json',
  ));

  final interceptor = AuthInterceptor(preferences: sl());
  dio.interceptors.add(interceptor);

  // Feature: Auth
  // Provider
  sl.registerFactory(
      () => AuthProvider(authRepository: sl(), dialogService: sl()));
  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  // Externals
  sl.registerLazySingleton<SharedPreferences>(() => sharesPreference);
  sl.registerLazySingleton<Dio>(() => dio);

  // Services
  sl.registerLazySingleton<DialogService>(() => DialogServiceImpl());
}
