import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Config {
  static bool get isWeb => kIsWeb;
  static bool get isAndroid => Platform.isAndroid;
  static bool get isIOS => Platform.isIOS;
  static bool get isMobile => !kIsWeb;

  static double get height => 1.sh;

  static double get width => 1.sw;

  static TextStyle get h1 => GoogleFonts.dmSans(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        height: 1.6,
      );

  static TextStyle get b1 => GoogleFonts.dmSans(
        fontSize: 16.sp,
        height: 1.0,
      );

  static TextStyle get b1b => GoogleFonts.dmSans(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        height: 1.0,
      );

  static TextStyle get b2 => GoogleFonts.dmSans(
        fontSize: 14.sp,
        height: 1.0,
      );

  static EdgeInsets contentPadding({double? h, double? v}) =>
      EdgeInsets.symmetric(horizontal: (h ?? 0).w, vertical: (v ?? 0).h);

  static EdgeInsets contentPaddingLTRB(
          double l, double t, double r, double b) =>
      EdgeInsets.fromLTRB(l.w, t.h, r.w, b.h);

  static double y(double height) => height.h;

  static double x(double width) => width.w;

  static bool get isSmallScreen => 1.sw <= 650;
  static bool get isMediumScreen => 1.sw > 650;
  static bool get isLargeScreen => 1.sw > 850;

  static Widget get hGap5 => const SizedBox(width: 10);
  static Widget get hGap10 => const SizedBox(width: 10);

  static Widget get vGap5 => const SizedBox(height: 5);
  static Widget get vGap10 => const SizedBox(height: 10);
  static Widget get vGap14 => const SizedBox(height: 14);
  static Widget get vGap20 => const SizedBox(height: 20);

  static Widget get mediumVGap => SizedBox(height: 1.sh * 0.05);

  static Size designSize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return switch (size.width) {
      < 650 => const Size(450, 940),
      >= 650 && < 850 => const Size(650, 1140),
      _ => const Size(850, 1340)
    };
  }
}
