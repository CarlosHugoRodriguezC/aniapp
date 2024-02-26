import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const TextStyle baseTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Colors.black,
);

final appTheme = ThemeData(
  colorSchemeSeed: Colors.red,
  brightness: Brightness.light,
  fontFamily: GoogleFonts.roboto().fontFamily,
  textTheme: TextTheme(
    titleLarge: baseTextStyle.copyWith(
      fontSize: 30.sp,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: baseTextStyle.copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: baseTextStyle.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: baseTextStyle.copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: baseTextStyle.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: baseTextStyle.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    ),
    displayLarge: baseTextStyle.copyWith(
      fontSize: 40.sp,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: baseTextStyle.copyWith(
      fontSize: 30.sp,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: baseTextStyle.copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
    ),
    labelLarge: baseTextStyle.copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: baseTextStyle.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: baseTextStyle.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
  ),
);
