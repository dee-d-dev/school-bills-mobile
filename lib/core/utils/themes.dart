import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_bills/core/utils/config.dart';

enum ThemeOptions {
  light,
  dark,
  system,
}

class AppTheme {
  static var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  static ThemeData lightTheme() => FlexThemeData.light(
        scheme: FlexScheme.purpleM3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.dmSans().fontFamily,
        textTheme: Config.textTheme,
      );

  static ThemeData darkTheme() => FlexThemeData.dark(
        scheme: FlexScheme.purpleM3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.dmSans().fontFamily,
        textTheme: Config.textTheme,
      );

  static ThemeMode themeMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;

  static ThemeData themeOptions(ThemeOptions option) {
    switch (option) {
      case ThemeOptions.light:
        return lightTheme();
      case ThemeOptions.dark:
        return darkTheme();
      case ThemeOptions.system:
        return brightness == Brightness.light ? lightTheme() : darkTheme();
    }
  }
}
