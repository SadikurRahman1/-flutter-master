
import '../../exported_files/exported_file.dart';


class AppThemes {
  AppThemes._internal();

  static ThemeData _lightThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackground
    );
  }
  static ThemeData get lightThemeData => _lightThemeData();
}
