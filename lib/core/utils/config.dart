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
        fontSize: 34.sp,
        fontWeight: FontWeight.w700,
        height: 1.6,
      );

  static TextStyle get h2 => GoogleFonts.dmSans(
        fontSize: 30.sp,
        fontWeight: FontWeight.w700,
        height: 1.6,
      );

  static TextStyle get h3 => GoogleFonts.dmSans(
        fontSize: 26.sp,
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

  static TextStyle get b2b => GoogleFonts.dmSans(
        fontSize: 14.sp,
        height: 1.0,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get b3 => GoogleFonts.dmSans(
        fontSize: 12.sp,
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

  static Widget get hGap5 => SizedBox(width: 5.w);
  static Widget get hGap10 => SizedBox(width: 10.w);
  static Widget get hGap15 => SizedBox(width: 15.w);
  static Widget get hGap20 => SizedBox(width: 20.w);
  static Widget get hGap30 => SizedBox(width: 30.w);

  static Widget get vGap5 => SizedBox(height: 5.h);
  static Widget get vGap10 => SizedBox(height: 10.h);
  static Widget get vGap15 => SizedBox(height: 15.h);
  static Widget get vGap20 => SizedBox(height: 20.h);
  static Widget get vGap30 => SizedBox(height: 30.h);

  static Widget get mediumVGap => SizedBox(height: 1.sh * 0.05);

  static Size designSize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return switch (size.width) {
      < 650 => const Size(393, 852),
      >= 650 && < 850 => const Size(650, 1140),
      _ => const Size(850, 1340)
    };
  }
}
