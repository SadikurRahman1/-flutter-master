import 'package:flutter/material.dart';

/// 💥 Super Responsive Extension System
/// Usage:
/// 100.w , 50.h , 16.sp

class ScreenConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;

  static const double baseWidth = 375.0;
  static const double baseHeight = 812.0;

  static double scaleWidth = 1.0;
  static double scaleHeight = 1.0;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    scaleWidth = screenWidth / baseWidth;
    scaleHeight = screenHeight / baseHeight;

    /// ⚠️ Desktop Safe Scaling (auto handled)
    if (scaleWidth > 2.0) scaleWidth = 2.0;
    if (scaleHeight > 2.0) scaleHeight = 2.0;
  }
}

/// 🟦 width extension (100.w)
extension ResponsiveWidth on num {
  double get w => this * ScreenConfig.scaleWidth;
}

/// 🟩 height extension (100.h)
extension ResponsiveHeight on num {
  double get h => this * ScreenConfig.scaleHeight;
}

/// 🟧 font-size extension (16.sp)
extension ResponsiveFont on num {
  double get sp => this * ScreenConfig.scaleWidth;
}

/// 🟪 padding + margin helper (EdgeInsets)
extension ResponsiveInsets on num {
  EdgeInsets get p => EdgeInsets.all(this.w);
  EdgeInsets get px => EdgeInsets.symmetric(horizontal: this.w);
  EdgeInsets get py => EdgeInsets.symmetric(vertical: this.h);

  EdgeInsets get p8 => EdgeInsets.all(8.w);
  EdgeInsets get p16 => EdgeInsets.all(16.w);
}



/*
@override
Widget build(BuildContext context) {
  ScreenConfig.init(context);

  return MaterialApp(
    home: HomeScreen(),
  );
}

 */