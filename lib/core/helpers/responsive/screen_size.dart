// import 'package:flutter/material.dart';
//
// class ScreenSize {
//   static late MediaQueryData _mediaQueryData;
//   static late double screenWidth;
//   static late double screenHeight;
//   static late double scaleWidth;
//   static late double scaleHeight;
//
//   static const double baseWidth = 375.0;
//   static const double baseHeight = 812.0;
//
//   static void init(BuildContext context) {
//     _mediaQueryData = MediaQuery.of(context);
//     screenWidth = _mediaQueryData.size.width;
//     screenHeight = _mediaQueryData.size.height;
//
//     scaleWidth = screenWidth / baseWidth;
//     scaleHeight = screenHeight / baseHeight;
//
//     debugPrint("Screen Width: $screenWidth, Height: $screenHeight");
//     debugPrint("Scale Width: $scaleWidth, Scale Height: $scaleHeight");
//   }
//
//   static double setWidth(double value) {
//     if (scaleWidth.isNaN || scaleWidth.isInfinite || scaleWidth == 0) {
//       return value;
//     }
//     return value * scaleWidth;
//   }
//
//   static double setHeight(double value) {
//     if (scaleHeight.isNaN || scaleHeight.isInfinite || scaleHeight == 0) {
//       return value;
//     }
//     return value * scaleHeight;
//   }
//
//   static double setSp(double value) {
//     if (scaleWidth.isNaN || scaleWidth.isInfinite || scaleWidth == 0) {
//       return value;
//     }
//     return value * scaleWidth;
//   }
//
//   static Orientation get orientation => _mediaQueryData.orientation;
// }
