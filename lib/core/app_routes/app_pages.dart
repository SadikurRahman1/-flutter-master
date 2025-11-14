import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../exported_files/exported_file.dart';

class AppPages {
  static List<GetPage<dynamic>> appPages() {
    return [
      // _getPages(
      //   name: AppRoutesNames.splashSC,
      //   page: const SplashScreen(),
      //   binding: SplashBinding(),
      // ),

    ];
  }

  static GetPage<dynamic> _getPages({
    required String name,
    required Widget page,
    Bindings? binding,
  }) => GetPage(name: name, page: () => page, binding: binding);
}
