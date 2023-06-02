import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/routes/routes.dart';
import '../../../../widgets/app_text.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      context.go(Routes.ONBOARDING);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              SvgPicture.asset(
                "assets/icons/mascot.svg",
                width: 130,
              ).animate()
                  .swap(duration: 2.seconds,
                  delay: 1.seconds,
                  builder: (_, __){
                return AppText(
                  text: "TaskBuddy",
                  size: 26,
                  color: AppColors.starkWhite,
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontWeight: FontWeight.w600,
                ).animate().fadeIn();
              })
            
            // Animate().toggle(
            //   duration: 4.seconds,
            //   builder: (_, value, __) {
            //     return value ? SvgPicture.asset(
            //       "assets/icons/mascot.svg",
            //       width: 130,
            //     ):
            //     const AppText(text: "TaskBuddy");
            //   }
            // )

          ],
        ),
      ),
    );
  }
}
