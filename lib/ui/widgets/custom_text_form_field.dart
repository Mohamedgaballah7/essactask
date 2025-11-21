

import 'package:flutter/material.dart';
import 'package:task2/utils/app_colors.dart';
import 'package:task2/utils/app_styles.dart';
typedef OnValidator=String? Function(String?)?;
class CustomTextFormField extends StatelessWidget {
  Color? borderColor;
  String hintName;
  TextStyle? textStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  OnValidator validator;
  final Function(String)? onChanged;
  TextEditingController controller;
  bool obscureText;
  TextInputType keyboardType;
  String obscuringCharacter;
  int? maxLines;
  CustomTextFormField({
    super.key,
    required this.hintName,
    this.borderColor,
    this.textStyle,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.validator,
    this.onChanged,
    this.obscureText=false,
    this.keyboardType=TextInputType.text,
    this.obscuringCharacter='.',
    this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.01,
        horizontal: width * 0.02,
      ),
      child: TextFormField(
        style: textStyle ?? Theme.of(context).textTheme.labelMedium,
        cursorErrorColor: AppColors.redColor,
        obscureText: obscureText,
        cursorColor: borderColor ?? Theme.of(context).primaryColorLight,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,

          hint: Text(hintName, style: textStyle ?? Theme.of(context).textTheme.labelMedium),
          border: builtOutlineInputBorder(
            borderColor: borderColor ?? Theme.of(context).primaryColorLight,
            width: width * 0.04,
          ),
          enabledBorder: builtOutlineInputBorder(
            borderColor: borderColor ?? Theme.of(context).primaryColorLight,
            width: width * 0.04,
          ),
          focusedBorder: builtOutlineInputBorder(
            borderColor: borderColor ?? Theme.of(context).primaryColorLight,
            width: width * 0.04,
          ),
          errorBorder: builtOutlineInputBorder(
            borderColor: AppColors.redColor,
            width: width * 0.04,
          ),
          focusedErrorBorder:builtOutlineInputBorder(
            borderColor: AppColors.redColor,
            width: width * 0.04,
          ),
          errorStyle: AppStyles.medium14Primary.copyWith(color: AppColors.redColor),
        ),
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscuringCharacter: obscuringCharacter,
        maxLines: maxLines??1,
      ),
    );
  }

  OutlineInputBorder builtOutlineInputBorder({
    required Color borderColor,
    required double width,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(width),
      borderSide: BorderSide(width: 1.5, color: borderColor),
    );
  }
}
