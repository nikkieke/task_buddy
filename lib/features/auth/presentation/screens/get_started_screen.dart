import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:task_buddy/features/auth/presentation/widgets/sign_up_dialog.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../widgets/app_text.dart';
import '../../../../widgets/button.dart';
import '../widgets/log_in_dialog.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  bool isSignupDialogShown = false;
  bool isLoginDialogShown = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                          isSignupDialogShown? Container(): isLoginDialogShown?Container()
                          :const AppText(text: 'Get Started!',
                            color: AppColors.starkWhite,size: 28, fontWeight: FontWeight.w700,),
                          const SizedBox(height: 30,),
                          Container(
                            alignment: Alignment.bottomCenter,
                            height: isSignupDialogShown? size.height/6:
                                    isLoginDialogShown? size.height/4.5: size.height/2.5,
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
                                    isSignupDialogShown = true;
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
                                  setState(() {
                                    isLoginDialogShown = true;
                                  });
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
              bottom: isSignupDialogShown? -size.height/20:-size.height/1.4,
              duration: const Duration(milliseconds: 400),
              child: CustomSignupDialog(pressed: () {
                setState(() {
                  isSignupDialogShown = false;
                  isLoginDialogShown = true;

                });

              },)),
            AnimatedPositioned(
                bottom: isLoginDialogShown? -size.height/20:-size.height/1.4,
                duration: const Duration(milliseconds: 400),
                child: CustomLoginDialog(pressed: () {
                  setState(() {
                    isSignupDialogShown = true;
                    isLoginDialogShown = false;

                  });
                },)),

            isSignupDialogShown?
                  TextButton(
              style: TextButton.styleFrom(
                shape: const CircleBorder()
                ),
              onPressed: () {
                setState(() {
                  isSignupDialogShown = false;
                  isLoginDialogShown = false;
                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.starkWhite,
                ),
                child: const Icon(Icons.arrow_back_sharp,
                  size: 30,
                  color: AppColors.primaryColor,
                ),
              ),
            )
                  :Container(),
            isLoginDialogShown?
                TextButton(
              style: TextButton.styleFrom(
                  shape: const CircleBorder()
              ),
              onPressed: () {
                setState(() {
                  isLoginDialogShown = false;
                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.starkWhite,
                ),
                child: const Icon(Icons.arrow_back_sharp,
                  size: 30,
                  color: AppColors.primaryColor,
                ),
              ),
            )
                :Container()

          ],
        ),
      ),
    );
  }
}


