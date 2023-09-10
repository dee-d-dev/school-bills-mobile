import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:school_bills/app/data/repository/auth_repository_impl.dart';
import 'package:school_bills/app/domain/auth_repository.dart';
import 'package:school_bills/app/view/provider/auth_provider.dart';
import 'package:school_bills/core/services/network_service/interceptor.dart';
import 'package:school_bills/core/services/dialog_service/dialog_service.dart';
import 'package:school_bills/core/services/dialog_service/dialog_service_impl.dart';
import 'package:school_bills/core/services/network_service/network_service.dart';
import 'package:school_bills/core/services/network_service/network_service_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  final sharedPreference = await SharedPreferences.getInstance();

  const timeout = Duration(minutes: 1);
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://clownfish-app-5uixy.ondigitalocean.app',
    receiveTimeout: timeout,
    connectTimeout: timeout,
    sendTimeout: timeout,
    contentType: 'application/json',
  ));

  // Feature: Auth
  // Provider
  sl.registerFactory(
      () => AuthProvider(authRepository: sl(), dialogService: sl()));
  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        networkService: sl(),
        preferences: sl(),
      ));

  // Externals
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreference);
  sl.registerLazySingleton<Dio>(() => dio);

  // Services
  sl.registerLazySingleton<DialogService>(() => DialogServiceImpl());
  final interceptor = AuthInterceptor(preferences: sl());
  dio.interceptors.add(interceptor);
  sl.registerLazySingleton<NetworkService>(() => NetworkServiceImpl(
        dio: sl(),
      ));
}
