
import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';

InputDecoration textFieldDeco([String hintText = "", Widget? suffixIcon]) {
  return InputDecoration(
    suffixIcon: suffixIcon,
    hintText: hintText,
    hintStyle: const TextStyle(
        fontSize: 14,
        color: AppColors.lightGrey
    ),
    filled: true,
    fillColor: AppColors.primaryColor.withOpacity(0.1),
    contentPadding: const EdgeInsets.only(left: 10),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(90.0)),
      borderSide: BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(90.0)),
      borderSide: BorderSide.none,
    ),
  );
}