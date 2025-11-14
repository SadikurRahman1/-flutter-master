import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:master/core/themes/app_themes/app_themes.dart';
import '../core/app_routes/app_pages.dart';
import '../core/app_routes/app_routes.dart';
import '../../../../../../core/exported_files/exported_file.dart';

class Master extends StatelessWidget {
  const Master({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenConfig.init(context);
    return GetMaterialApp(
      initialRoute: AppRoutes.splashSC,
      getPages: AppPages.appPages(),
      theme: AppThemes.lightThemeData,
      debugShowCheckedModeBanner: false,
    );
  }
}
