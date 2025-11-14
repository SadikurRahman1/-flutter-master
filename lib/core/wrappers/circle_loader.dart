// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import '../exported_files/exported_file.dart';
//
// class CircleLoader extends StatelessWidget {
//   final Color color;
//   final double size;
//
//   const CircleLoader({
//     super.key,
//     this.color = AppColors.primaryColor,
//     this.size = 50,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SpinKitCircle(
//       color: color,
//       size: ScreenSize.setWidth(size),
//     );
//   }
// }

import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../exported_files/exported_file.dart';

class CircleLoader extends StatelessWidget {
  final Color color;
  final double size;

  const CircleLoader({
    super.key,
    this.color = AppColors.primary,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: color,
      size: size.w,   // 🔥 new responsive system
    );
  }
}
