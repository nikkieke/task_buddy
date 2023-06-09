import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../widgets/app_text.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key, required this.text, required this.pressed,
  });
  final String text;
  final VoidCallback pressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: pressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 92,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child:  AppText(text: text,color: AppColors.starkWhite,size: 15,fontWeight: FontWeight.w800,),
      ),
    );
  }
}
