import 'package:flutter/material.dart';

class AppColors {
  static const Color lightPri = Color(0xffF2F8FF);
  static const Color skyBlue = Color(0xff00C6FB);
  static const Color grey = Color(0xffD3D3D3);
  static const Color grey2 = Color(0xff949494);
  static const Color ash = Color(0xff4F4F4F);
  static const Color purple = Color(0xff9F56D4);
  static const Color darkPurple = Color(0xff0C0C26);

  static const MaterialColor materialColor = MaterialColor(
    0xff000a4a,
    <int, Color>{
      50: Color(0xff666c92), //10%
      100: Color(0xff4d5480), //20%
      200: Color(0xff333b6e), //30%
      300: Color(0xff1a235c), //40%
      400: Color(0xff000a4a), //50%
      500: Color(0xff000943), //60%
      600: Color(0xff00083b), //70%
      700: Color(0xff000734), //80%
      800: Color(0xff00062c), //90%
      900: Color(0xff000525), //100%
    },
  );
}
