
import 'package:flutter/material.dart';

import '../core/colors/app_colors.dart';
import 'app_text.dart';

class Button extends StatelessWidget {
  const Button({
    super.key, required this.text, required this.press,
  });

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))
          )
      ),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 250,
        decoration: const BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        child:  AppText(text: text,
          color: AppColors.leadBlack,size: 18, fontWeight: FontWeight.w400,),
      ),
    );
  }
}
