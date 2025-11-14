//
// import '../../../../../../core/exported_files/exported_file.dart';
// import 'responsive_input_field.dart';
// import 'responsive_space.dart';
// import 'responsive_text.dart';
//
// class ResponsiveDropdown extends StatelessWidget {
//   const ResponsiveDropdown({
//     super.key,
//     required this.headerTitle,
//     this.prefixIcon,
//     this.suffixIcon,
//     required this.hintText,
//     required this.controller,
//     this.validator,
//     this.isObscureText,
//     this.maxLines,
//     this.optionalInputField = false,
//     this.fillColor,
//     this.isDatePicker = false,
//     this.isDropdown = false,
//     this.dropdownItems,
//     this.selectedValueNotifier,
//   });
//
//   final String headerTitle;
//   final String hintText;
//   final IconData? prefixIcon;
//   final IconData? suffixIcon;
//   final TextEditingController controller;
//   final String? Function(String?)? validator;
//   final bool? isObscureText;
//   final int? maxLines;
//   final bool optionalInputField;
//   final Color? fillColor;
//   final bool isDatePicker;
//
//   final bool isDropdown;
//   final List<String>? dropdownItems;
//   final ValueNotifier<String?>? selectedValueNotifier;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ResponsiveText(
//               text: headerTitle,
//               fontSize: ScreenSize.setSp(16),
//               fontWeight: FontWeight.w500,
//               color: AppColors.primaryTxtColor,
//             ),
//             if (optionalInputField)
//               Row(
//                 children: [
//                   ResponsiveSpace(ScreenSize.setWidth(8)),
//                   ResponsiveText(
//                     text: "(Optional)",
//                     fontSize: ScreenSize.setSp(14),
//                     fontWeight: FontWeight.w500,
//                     color: AppColors.secondaryTxtColor,
//                   ),
//                 ],
//               ),
//           ],
//         ),
//         ResponsiveSpace(ScreenSize.setHeight(8)),
//
//         if (isDropdown && dropdownItems != null && selectedValueNotifier != null)
//           ValueListenableBuilder<String?>(
//             valueListenable: selectedValueNotifier!,
//             builder: (context, selectedValue, _) {
//               return DropdownButtonFormField<String>(
//                 dropdownColor: AppColors.primarySCBgColor,
//                 initialValue: selectedValue,
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.symmetric(
//                     vertical: ScreenSize.setHeight(16),
//                     horizontal: ScreenSize.setWidth(12),
//                   ),
//                   border: _buildOutlineInputBorder(),
//                   enabledBorder: _buildOutlineInputBorder(),
//                   focusedBorder: _buildOutlineInputBorder(),
//                   errorBorder: _buildOutlineInputBorder(),
//                   focusedErrorBorder: _buildOutlineInputBorder(),
//                   filled: true,
//                   fillColor: fillColor ?? const Color(0xFFE5D4BE),
//                 ),
//                 icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF6B6B6B)),
//                 hint: ResponsiveText(
//                   text: hintText,
//                   fontSize: ScreenSize.setSp(14),
//                   color: const Color(0xFF6B6B6B),
//                 ),
//                 items: dropdownItems!
//                     .map(
//                       (item) => DropdownMenuItem<String>(
//                         value: item,
//                         child: ResponsiveText(
//                           text: item,
//                           fontSize: ScreenSize.setSp(14),
//                           color: const Color(0xFF6B6B6B),
//                         ),
//                       ),
//                     )
//                     .toList(),
//                 onChanged: (val) {
//                   selectedValueNotifier!.value = val;
//                   controller.text = val ?? "";
//                 },
//               );
//             },
//           )
//         else
//           GestureDetector(
//             onTap: isDatePicker
//                 ? () async {
//                     FocusScope.of(context).unfocus();
//                     final DateTime? pickedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime(2000),
//                       firstDate: DateTime(1900),
//                       lastDate: DateTime.now(),
//                     );
//                     if (pickedDate != null) {
//                       controller.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
//                     }
//                   }
//                 : null,
//             child: AbsorbPointer(
//               absorbing: isDatePicker,
//               child: ResponsiveInputField(
//                 fillColor: fillColor ?? const Color(0xFFE5D4BE),
//                 borderColor: const Color(0xFFB3A28A),
//                 borderWidth: 1,
//                 prefixIcon: prefixIcon != null
//                     ? Icon(prefixIcon, color: const Color(0xFF6B6B6B))
//                     : null,
//                 hintText: hintText,
//                 suffixIcon: suffixIcon != null
//                     ? Icon(suffixIcon, color: const Color(0xFF6B6B6B))
//                     : null,
//                 controller: controller,
//                 validator: validator,
//                 obscureText: isObscureText ?? false,
//                 maxLines: maxLines,
//               ),
//             ),
//           ),
//
//         ResponsiveSpace(ScreenSize.setHeight(16)),
//       ],
//     );
//   }
//
//   OutlineInputBorder _buildOutlineInputBorder() {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(ScreenSize.setWidth(8)),
//       borderSide: BorderSide(color: const Color(0xFFB3A28A), width: ScreenSize.setWidth(1)),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../../../../../core/exported_files/exported_file.dart';
import 'responsive_input_field.dart';
import 'responsive_space.dart';
import 'responsive_text.dart';

class ResponsiveDropdown extends StatelessWidget {
  const ResponsiveDropdown({
    super.key,
    required this.headerTitle,
    this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    required this.controller,
    this.validator,
    this.isObscureText,
    this.maxLines,
    this.optionalInputField = false,
    this.fillColor,
    this.isDatePicker = false,
    this.isDropdown = false,
    this.dropdownItems,
    this.selectedValueNotifier,
  });

  final String headerTitle;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? isObscureText;
  final int? maxLines;
  final bool optionalInputField;
  final Color? fillColor;
  final bool isDatePicker;

  final bool isDropdown;
  final List<String>? dropdownItems;
  final ValueNotifier<String?>? selectedValueNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResponsiveText(
              text: headerTitle,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryText,
            ),
            if (optionalInputField)
              Row(
                children: [
                  ResponsiveSpace(8.w),
                  ResponsiveText(
                    text: "(Optional)",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryText,
                  ),
                ],
              ),
          ],
        ),
        ResponsiveSpace(8.h),

        if (isDropdown && dropdownItems != null && selectedValueNotifier != null)
          ValueListenableBuilder<String?>(
            valueListenable: selectedValueNotifier!,
            builder: (context, selectedValue, _) {
              return DropdownButtonFormField<String>(
                dropdownColor: AppColors.scaffoldBackground,
                initialValue: selectedValue,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 12.w,
                  ),
                  border: _buildOutlineInputBorder(),
                  enabledBorder: _buildOutlineInputBorder(),
                  focusedBorder: _buildOutlineInputBorder(),
                  errorBorder: _buildOutlineInputBorder(),
                  focusedErrorBorder: _buildOutlineInputBorder(),
                  filled: true,
                  fillColor: fillColor ?? const Color(0xFFE5D4BE),
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: const Color(0xFF6B6B6B),
                  size: 24.w,
                ),
                hint: ResponsiveText(
                  text: hintText,
                  fontSize: 14.sp,
                  color: const Color(0xFF6B6B6B),
                ),
                items: dropdownItems!
                    .map(
                      (item) => DropdownMenuItem<String>(
                    value: item,
                    child: ResponsiveText(
                      text: item,
                      fontSize: 14.sp,
                      color: const Color(0xFF6B6B6B),
                    ),
                  ),
                )
                    .toList(),
                onChanged: (val) {
                  selectedValueNotifier!.value = val;
                  controller.text = val ?? "";
                },
              );
            },
          )
        else
          GestureDetector(
            onTap: isDatePicker
                ? () async {
              FocusScope.of(context).unfocus();
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime(2000),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                controller.text =
                "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
              }
            }
                : null,
            child: AbsorbPointer(
              absorbing: isDatePicker,
              child: ResponsiveInputField(
                fillColor: fillColor ?? const Color(0xFFE5D4BE),
                borderColor: const Color(0xFFB3A28A),
                borderWidth: 1.w,
                prefixIcon: prefixIcon != null
                    ? Icon(prefixIcon, color: const Color(0xFF6B6B6B), size: 24.w)
                    : null,
                hintText: hintText,
                suffixIcon: suffixIcon != null
                    ? Icon(suffixIcon, color: const Color(0xFF6B6B6B), size: 24.w)
                    : null,
                controller: controller,
                validator: validator,
                obscureText: isObscureText ?? false,
                maxLines: maxLines,
              ),
            ),
          ),

        ResponsiveSpace(16.h),
      ],
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.w),
      borderSide: BorderSide(color: const Color(0xFFB3A28A), width: 1.w),
    );
  }
}
