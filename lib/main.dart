import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_bills/core/di/service_locator.dart';
import 'package:school_bills/core/routes/router.dart';
import 'package:school_bills/core/utils/app_aware.dart';
import 'package:school_bills/core/utils/config.dart';
import 'package:school_bills/core/utils/themes.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      Paint.enableDithering = true;
      await initServiceLocator();
      if (kReleaseMode) {
        debugPrint = (String? message, {int? wrapWidth}) {};
      }

      runApp(const ProviderScope(child: MainApp()));
    },
    (error, stack) {
      debugPrint('$error: $stack');
    },
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Config.designSize(context),
      minTextAdapt: true,
      builder: (context, child) {
        return AppAware(
          child: MaterialApp.router(
            title: 'School Bills',
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            themeMode: AppTheme.themeMode(context),
            routerConfig: AppRoute.router,
            builder: (BuildContext context, Widget? child) {
              final mediaQueryData = MediaQuery.of(context);
              final scale = mediaQueryData.textScaleFactor.clamp(0.5, 1.0);
              return MediaQuery(
                data: mediaQueryData.copyWith(
                  textScaleFactor: scale,
                ),
                child: child!,
              );
            },
          ),
        );
      },
    );
  }
}
