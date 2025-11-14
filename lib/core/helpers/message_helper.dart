// import 'package:get/get.dart';
// import '../exported_files/exported_file.dart';
//
//
// class MessageHelper {
//   static final MessageHelper _instance = MessageHelper._internal();
//   MessageHelper._internal();
//   factory MessageHelper() => _instance;
//
//   void showWarning({
//     required String title,
//     required String message,
//   }) {
//     _showSnackBar(
//       title: title,
//       message: message,
//       backgroundColor: Colors.red,
//       icon: Icons.warning_amber_rounded,
//     );
//   }
//
//   void showAlert({
//     required String title,
//     required String message,
//   }) {
//     _showSnackBar(
//       title: title,
//       message: message,
//       backgroundColor: AppColors.primaryColor,
//       icon: Icons.notifications_active_outlined,
//     );
//   }
//
//   void _showSnackBar({
//     required String title,
//     required String message,
//     required Color backgroundColor,
//     required IconData icon,
//   }) {
//     final context = Get.context;
//     if (context == null) return;
//
//     final textTheme = Theme.of(context).textTheme;
//     final screenWidth = ScreenSize.screenWidth;
//     final horizontalPadding = screenWidth * 0.05;
//
//     final snackBar = SnackBar(
//       behavior: SnackBarBehavior.floating,
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       margin: EdgeInsets.only(
//         left: horizontalPadding,
//         right: horizontalPadding,
//         bottom: 20,
//       ),
//       content: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: backgroundColor,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: backgroundColor.withValues(alpha: 0.4),
//               blurRadius: 8,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Icon(icon, color: Colors.white, size: 26),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     title,
//                     style: textTheme.titleMedium?.copyWith(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     message,
//                     style: textTheme.bodyMedium?.copyWith(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       duration: const Duration(seconds: 3),
//     );
//
//     ScaffoldMessenger.of(context).clearSnackBars();
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }
import 'package:get/get.dart';
import '../exported_files/exported_file.dart';

class MessageHelper {
  static final MessageHelper _instance = MessageHelper._internal();
  MessageHelper._internal();
  factory MessageHelper() => _instance;

  void showWarning({
    required String title,
    required String message,
  }) {
    _showSnackBar(
      title: title,
      message: message,
      backgroundColor: Colors.red,
      icon: Icons.warning_amber_rounded,
    );
  }

  void showAlert({
    required String title,
    required String message,
  }) {
    _showSnackBar(
      title: title,
      message: message,
      backgroundColor: AppColors.primary,
      icon: Icons.notifications_active_outlined,
    );
  }

  void _showSnackBar({
    required String title,
    required String message,
    required Color backgroundColor,
    required IconData icon,
  }) {
    final context = Get.context;
    if (context == null) return;

    final textTheme = Theme.of(context).textTheme;

    final screenWidth = ScreenConfig.screenWidth;
    final horizontalPadding = 0.05 * screenWidth;

    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: Colors.transparent,
      margin: EdgeInsets.only(
        left: horizontalPadding.w,
        right: horizontalPadding.w,
        bottom: 20.h,
      ),
      content: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.w),
          boxShadow: [
            BoxShadow(
              color: backgroundColor.withOpacity(0.4),
              blurRadius: 8.w,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 26.w),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    message,
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
