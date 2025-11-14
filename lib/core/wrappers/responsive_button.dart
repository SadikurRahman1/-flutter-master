// import '../../../../../../core/exported_files/exported_file.dart';
//
// class ResponsiveButton extends StatelessWidget {
//   const ResponsiveButton({
//     super.key,
//     required this.title,
//     required this.onTap,
//     this.height = 50,
//     this.borderRadius = 33,
//     this.backgroundColor,
//     this.gradientColors,
//     this.borderColor,
//     this.borderWidth,
//     this.width,
//     this.titleColor,
//     this.fontWeight,
//     this.fontSize,
//     this.isLoading = false,
//     this.trailingIcon,
//     this.leadingIcon,
//     this.iconColor,
//   }) : assert(
//   (leadingIcon == null || trailingIcon == null),
//   "You cannot provide both leadingIcon and trailingIcon. Use only one.",
//   );
//
//   final String title;
//   final VoidCallback onTap;
//   final double height;
//   final double? width;
//   final double borderRadius;
//   final Color? backgroundColor;
//   final List<Color>? gradientColors;
//   final Color? borderColor;
//   final double? borderWidth;
//   final Color? titleColor;
//   final FontWeight? fontWeight;
//   final double? fontSize;
//   final bool isLoading;
//   final IconData? trailingIcon;
//   final IconData? leadingIcon;
//   final Color? iconColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: isLoading ? null : onTap,
//       child: Container(
//         height: ScreenSize.setHeight(height),
//         width: width ?? double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(ScreenSize.setWidth(borderRadius)),
//           gradient: gradientColors != null
//               ? LinearGradient(
//             colors: gradientColors!,
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           )
//               : null,
//           color: gradientColors == null
//               ? (backgroundColor ?? AppColors.primaryColor)
//               : null,
//           border: Border.all(
//             width: borderWidth ?? 1,
//             color: borderColor ?? AppColors.primaryColor,
//           ),
//         ),
//         alignment: Alignment.center,
//         child: isLoading
//             ? const SizedBox(
//           height: 24,
//           width: 24,
//           child: CircularProgressIndicator(
//             strokeWidth: 2,
//             valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//           ),
//         )
//             : Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (leadingIcon != null)
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   ResponsiveIcon(icon: leadingIcon!, color: iconColor, size: 24),
//                   const ResponsiveSpace(8),
//                 ],
//               ),
//             ResponsiveText(
//               text: title,
//               fontSize: fontSize ?? 18,
//               fontWeight: fontWeight ?? FontWeight.w500,
//               color: titleColor ?? AppColors.whiteColor,
//             ),
//             if (trailingIcon != null)
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const ResponsiveSpace(8),
//                   ResponsiveIcon(
//                     icon: trailingIcon!,
//                     color: iconColor ?? AppColors.whiteColor,
//                     size: 24,
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:master/core/extensions/widget_extensions.dart';

import '../../../../../../core/exported_files/exported_file.dart';

class ResponsiveButton extends StatelessWidget {
  const ResponsiveButton({
    super.key,
    required this.title,
    required this.onTap,
    this.height = 50,
    this.borderRadius = 8,
    this.backgroundColor,
    this.gradientColors,
    this.borderColor,
    this.borderWidth,
    this.width,
    this.titleColor,
    this.fontWeight,
    this.fontSize,
    this.isLoading = false,
    this.trailingIcon,
    this.leadingIcon,
    this.iconColor,
  }) : assert(
  (leadingIcon == null || trailingIcon == null),
  "You cannot provide both leadingIcon and trailingIcon. Use only one.",
  );

  final String title;
  final VoidCallback onTap;
  final double height;
  final double? width;
  final double borderRadius;
  final Color? backgroundColor;
  final List<Color>? gradientColors;
  final Color? borderColor;
  final double? borderWidth;
  final Color? titleColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final bool isLoading;
  final IconData? trailingIcon;
  final IconData? leadingIcon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h, // responsive height
      width: width?.w ?? double.infinity, // responsive width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.w), // responsive radius
        gradient: gradientColors != null
            ? LinearGradient(
          colors: gradientColors!,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
            : null,
        color: gradientColors == null
            ? (backgroundColor ?? AppColors.primary)
            : null,
        border: Border.all(
          width: (borderWidth ?? 1).w, // responsive border width
          color: borderColor ?? AppColors.primary,
        ),
      ),
      alignment: Alignment.center,
      child: isLoading
          ? SizedBox(
        height: 24.h,
        width: 24.w,
        child: const CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      )
          : Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leadingIcon != null) ...[
            ResponsiveIcon(
              icon: leadingIcon!,
              color: iconColor,
              size: 24.sp, // responsive icon size
            ),
            SizedBox(width: 8.w), // responsive spacing
          ],
          ResponsiveText(
            text: title,
            fontSize: (fontSize ?? 18).sp, // responsive font size
            fontWeight: fontWeight ?? FontWeight.w500,
            color: titleColor ?? AppColors.white,
          ),
          if (trailingIcon != null) ...[
            SizedBox(width: 8.w), // responsive spacing
            ResponsiveIcon(
              icon: trailingIcon!,
              color: iconColor ?? AppColors.white,
              size: 24.sp, // responsive icon size
            ),
          ],
        ],
      ),
    ).onTap(isLoading ? null : onTap);
  }
}
