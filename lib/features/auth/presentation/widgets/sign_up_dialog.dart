import 'package:flutter/material.dart';
import 'package:task_buddy/core/colors/app_colors.dart';

class CustomSignupDialog extends StatelessWidget {
  const CustomSignupDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
          height: size.height/1.5,
          margin:  const EdgeInsets.only(top: 250),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          decoration: const BoxDecoration(
            color: AppColors.starkWhite,
            borderRadius:  BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                SingleChildScrollView(
                    child: Column(
                      children: [

                      ],
                    )
                ),

              ],
            ),
          ),
        );

  }
}



