import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppTextStyles {
  static TextStyle regular(
      {double fontSize = 12.5,
        Color? color}) {
    return TextStyle(
        fontSize: fontSize.sp,
        color: color);
  }

  static TextStyle medium(
      {double fontSize = 14, Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
        fontSize: fontSize.sp,
        color: color);
  }

  static TextStyle semiBold(
      {double fontSize = 18, Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
        fontSize: fontSize.sp,
        color: color);
  }

  static TextStyle bold(
      {double fontSize = 20, Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
        fontSize: fontSize.sp,
        color: color);
  }
}
