import 'package:flutter/material.dart';
class AppColors {

  AppColors.internal();

  // ⚪️ Basic Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  // 🟢 Success & 🛑 Error
  static const Color success = Color(0xFF4CAF50); // green
  static const Color danger = Color(0xFFF44336); // red
  static const Color warning = Color(0xFFFFC107); // amber / yellow


  // 🔵 Primary / Secondary
  static const Color primary = Color(0xFF1976D2); // blue
  static const Color primaryLight = Color(0xFF63A4FF);
  static const Color primaryDark = Color(0xFF004BA0);

  static const Color secondary = Color(0xFFFF5722); // deep orange
  static const Color secondaryLight = Color(0xFFFF8A50);
  static const Color secondaryDark = Color(0xFFBF360C);

  // ⚪️ Grayscale
  static const Color gray = Color(0xFF6B6B6B);
  static const Color lightGray = Color(0xFFBDBDBD);
  static const Color extraLightGray = Color(0xFFE0E0E0);
  static const Color darkGray = Color(0xFF424242);

  // 🟠 Others
  static const Color orange = Color(0xFFFF9800);
  static const Color pink = Color(0xFFE91E63);
  static const Color purple = Color(0xFF9C27B0);
  static const Color teal = Color(0xFF009688);
  static const Color blueGray = Color(0xFF607D8B);

  // 🌟 Background / Surface Colors
  static const Color scaffoldBackground = Color(0xFFF5F5F5);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color shadowColor = Color(0x33000000); // 20% black for shadow

  // 📝 Text Colors
  static const Color primaryText = Color(0xFF212121);
  static const Color secondaryText = Color(0xFF757575);
  static const Color disabledText = Color(0xFFBDBDBD);

  // 🔔 Notification / Accent
  static const Color info = Color(0xFF2196F3); // blue
  static const Color accent = Color(0xFFFF4081);
}
