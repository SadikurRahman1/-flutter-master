// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../../../../../core/exported_files/exported_file.dart';
//
//
// class ResponsiveInputField extends StatefulWidget {
//   final TextEditingController? controller;
//   final String? hintText;
//   final String? labelText;
//
//   final bool obscureText;
//   final bool isNumber;
//   final bool isReadOnly;
//   final bool autoFocus;
//   final int? maxLines;
//   final int? maxLength;
//   final TextInputType? keyboardType;
//   final TextInputAction? textInputAction;
//   final FocusNode? focusNode;
//
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//
//   final String? Function(String?)? validator;
//   final void Function(String)? onChanged;
//   final void Function(String)? onFieldSubmitted;
//   final void Function()? onTap;
//
//   final Color? fillColor;
//   final Color? borderColor;
//   final Color? focusedBorderColor;
//   final Color? errorBorderColor;
//   final double? borderRadius;
//   final double? borderWidth;
//
//   final TextStyle? textStyle;
//   final TextStyle? hintStyle;
//   final TextStyle? labelStyle;
//
//   const ResponsiveInputField({
//     super.key,
//     this.controller,
//     this.hintText,
//     this.labelText,
//     this.obscureText = false,
//     this.isNumber = false,
//     this.isReadOnly = false,
//     this.autoFocus = false,
//     this.maxLines = 1,
//     this.maxLength,
//     this.keyboardType,
//     this.textInputAction,
//     this.focusNode,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.validator,
//     this.onChanged,
//     this.onFieldSubmitted,
//     this.onTap,
//     this.fillColor,
//     this.borderColor,
//     this.focusedBorderColor,
//     this.errorBorderColor,
//     this.borderRadius,
//     this.borderWidth,
//     this.textStyle,
//     this.hintStyle,
//     this.labelStyle,
//   });
//
//   @override
//   State<ResponsiveInputField> createState() => _RInputFieldState();
// }
//
// class _RInputFieldState extends State<ResponsiveInputField> {
//   late final ValueNotifier<bool> _obscureNotifier;
//
//   @override
//   void initState() {
//     super.initState();
//     _obscureNotifier = ValueNotifier(widget.obscureText);
//   }
//
//   @override
//   void dispose() {
//     _obscureNotifier.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<bool>(
//       valueListenable: _obscureNotifier,
//       builder: (context, isObscure, _) {
//         return TextFormField(
//           controller: widget.controller,
//           obscureText: isObscure,
//           readOnly: widget.isReadOnly,
//           autofocus: widget.autoFocus,
//           maxLines: widget.obscureText ? 1 : widget.maxLines,
//           maxLength: widget.maxLength,
//           textInputAction: widget.textInputAction,
//           focusNode: widget.focusNode,
//           validator: widget.validator,
//           onChanged: widget.onChanged,
//           onFieldSubmitted: widget.onFieldSubmitted,
//           onTap: widget.onTap,
//
//           keyboardType: widget.isNumber
//               ? TextInputType.number
//               : widget.keyboardType ?? TextInputType.text,
//
//           inputFormatters:
//           widget.isNumber ? [FilteringTextInputFormatter.digitsOnly] : null,
//
//           style: widget.textStyle ??
//               GoogleFonts.poppins(
//                 fontSize: ScreenSize.setSp(14),
//                 color: const Color(0xFF6B6B6B),
//                 fontWeight: FontWeight.w400,
//               ),
//
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(
//               vertical: ScreenSize.setHeight(16),
//               horizontal: ScreenSize.setWidth(12),
//             ),
//             hintText: widget.hintText,
//             labelText: widget.labelText,
//             hintStyle: widget.hintStyle ??
//                 GoogleFonts.poppins(
//                   fontSize: ScreenSize.setSp(14),
//                   color: const Color(0xFF6B6B6B),
//                   fontWeight: FontWeight.w400,
//                 ),
//             labelStyle: widget.labelStyle ??
//                 GoogleFonts.poppins(
//                   fontSize: ScreenSize.setSp(14),
//                   color: Colors.grey.shade700,
//                 ),
//             border: _outlineInputBorder(
//                 widget.borderColor ?? Colors.grey.withValues(alpha: 0.3)),
//             enabledBorder: _outlineInputBorder(
//                 widget.borderColor ?? Colors.grey.withValues(alpha: 0.3)),
//             focusedBorder: _outlineInputBorder(
//                 widget.focusedBorderColor ?? const Color(0xFFD1D1D1)),
//             errorBorder: _outlineInputBorder(
//                 widget.errorBorderColor ?? Colors.red),
//             disabledBorder:
//             _outlineInputBorder(Colors.grey.withValues(alpha: 0.2)),
//             prefixIcon: widget.prefixIcon,
//             suffixIcon: widget.obscureText
//                 ? IconButton(
//               icon: Icon(
//                 isObscure ? Icons.visibility_off : Icons.visibility,
//                 color: const Color(0xFF6B6B6B),
//               ),
//               onPressed: () {
//                 _obscureNotifier.value = !_obscureNotifier.value;
//               },
//             )
//                 : widget.suffixIcon,
//             filled: true,
//             fillColor: widget.fillColor ?? Colors.white,
//           ),
//         );
//       },
//     );
//   }
//
//   OutlineInputBorder _outlineInputBorder(Color color) {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(
//           ScreenSize.setWidth(widget.borderRadius ?? 8)),
//       borderSide: BorderSide(
//           width: widget.borderWidth ?? ScreenSize.setWidth(0.7), color: color),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/exported_files/exported_file.dart';

class ResponsiveInputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;

  final bool obscureText;
  final bool isNumber;
  final bool isReadOnly;
  final bool autoFocus;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;

  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final double? borderRadius;
  final double? borderWidth;

  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;

  const ResponsiveInputField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.isNumber = false,
    this.isReadOnly = false,
    this.autoFocus = false,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.borderRadius,
    this.borderWidth,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
  });

  @override
  State<ResponsiveInputField> createState() => _RInputFieldState();
}

class _RInputFieldState extends State<ResponsiveInputField> {
  late final ValueNotifier<bool> _obscureNotifier;

  @override
  void initState() {
    super.initState();
    _obscureNotifier = ValueNotifier(widget.obscureText);
  }

  @override
  void dispose() {
    _obscureNotifier.dispose();
    super.dispose();
  }

  // Default responsive TextStyle
  TextStyle _defaultStyle({Color? color, double? size, FontWeight? weight}) {
    return GoogleFonts.poppins(
      fontSize: (size ?? 14).sp,
      color: color ?? const Color(0xFF6B6B6B),
      fontWeight: weight ?? FontWeight.w400,
    );
  }

  OutlineInputBorder _outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular((widget.borderRadius ?? 8).w),
      borderSide: BorderSide(
        width: (widget.borderWidth ?? 0.7).w,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureNotifier,
      builder: (context, isObscure, _) {
        return TextFormField(
          controller: widget.controller,
          obscureText: isObscure,
          readOnly: widget.isReadOnly,
          autofocus: widget.autoFocus,
          maxLines: widget.obscureText ? 1 : widget.maxLines,
          maxLength: widget.maxLength,
          textInputAction: widget.textInputAction,
          focusNode: widget.focusNode,
          validator: widget.validator,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          onTap: widget.onTap,
          keyboardType: widget.isNumber
              ? TextInputType.number
              : widget.keyboardType ?? TextInputType.text,
          inputFormatters: widget.isNumber
              ? [FilteringTextInputFormatter.digitsOnly]
              : null,
          style: widget.textStyle ?? _defaultStyle(),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 16.h,
              horizontal: 12.w,
            ),
            hintText: widget.hintText,
            labelText: widget.labelText,
            hintStyle: widget.hintStyle ?? _defaultStyle(),
            labelStyle: widget.labelStyle ?? _defaultStyle(color: Colors.grey.shade700),
            border: _outlineInputBorder(
                widget.borderColor ?? Colors.grey.withOpacity(0.3)),
            enabledBorder: _outlineInputBorder(
                widget.borderColor ?? Colors.grey.withOpacity(0.3)),
            focusedBorder: _outlineInputBorder(
                widget.focusedBorderColor ?? const Color(0xFFD1D1D1)),
            errorBorder: _outlineInputBorder(
                widget.errorBorderColor ?? Colors.red),
            disabledBorder:
            _outlineInputBorder(Colors.grey.withOpacity(0.2)),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.obscureText
                ? IconButton(
              icon: Icon(
                isObscure ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xFF6B6B6B),
                size: 20.w,
              ),
              onPressed: () => _obscureNotifier.value = !isObscure,
            )
                : widget.suffixIcon,
            filled: true,
            fillColor: widget.fillColor ?? Colors.white,
          ),
        );
      },
    );
  }
}
