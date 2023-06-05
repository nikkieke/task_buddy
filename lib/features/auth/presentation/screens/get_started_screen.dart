import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:task_buddy/features/auth/presentation/widgets/sign_up_dialog.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../widgets/app_text.dart';
import '../../../../widgets/button.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  bool isDialogShown = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                        children: [
                          const SizedBox(height: 50,),
                          const AppText(text: 'Get Started!',
                            color: AppColors.starkWhite,size: 28, fontWeight: FontWeight.w700,),
                          const SizedBox(height: 30,),
                          Container(
                            alignment: Alignment.bottomCenter,
                            height: isDialogShown? size.height/2.5: size.height/3.5,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.starkWhite,
                            ),

                            child: const RiveAnimation.asset(
                              "assets/rive_assets/onboarding.riv",
                              artboard: "buddy",
                            ),
                          ),
                          const Spacer(),
                          Button(
                            text: 'Sign Up',
                            press: () {
                                  setState(() {
                                    isDialogShown = true;
                                  });

                            },
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const AppText(text: 'Already have an account?',
                                color: AppColors.starkWhite,size: 16, fontWeight: FontWeight.w700,),
                              TextButton(

                                onPressed: () {

                                },
                                style: TextButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30))
                                    )
                                ),
                                child: const AppText(text: 'Log in',
                                  color: AppColors.secondaryColor,size: 16, fontWeight: FontWeight.w700,),
                              ),
                            ],
                          ),
                        ],
                      ),

              ),
            ),
            AnimatedPositioned(

              child: CustomSignupDialog(),
              duration: const Duration(milliseconds: 400),),
          ],
        ),
      ),
    );
  }
}


