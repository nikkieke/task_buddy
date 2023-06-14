import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_buddy/core/colors/app_colors.dart';
import 'package:task_buddy/features/auth/presentation/widgets/textfield_decoration.dart';
import 'package:task_buddy/widgets/app_text.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../widgets/button.dart';
import '../view_model/signup_provider.dart';

class CustomSignupDialog extends ConsumerStatefulWidget {
  const CustomSignupDialog({Key? key, required this.pressed}) : super(key: key);
  final VoidCallback pressed;
  @override
  ConsumerState<CustomSignupDialog> createState() => _CustomSignupDialogState();
}

class _CustomSignupDialogState extends ConsumerState<CustomSignupDialog> {
  late SignupProvider provider;

  final _formKey = GlobalKey<FormState>();
  bool hidden = true;
  @override
  Widget build(BuildContext context) {
    provider = ref.watch(signUpProvider);
    var size = MediaQuery.of(context).size;
    return Container(
        height: size.height/1.4,
        width: size.width,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        decoration:  const BoxDecoration(
          color: AppColors.starkWhite,
          borderRadius:  BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
        ),
        child:  Form(
          key: _formKey,
          child: provider.loading?
          const LoadingIndicator(
              indicatorType: Indicator.orbit,
              colors: [AppColors.primaryColor],
              strokeWidth: 2,
              backgroundColor: AppColors.starkWhite,
              pathBackgroundColor: AppColors.starkWhite
          ):
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15, bottom: 10),
                child: AppText(text: 'Full Name', size: 14, color: AppColors.leadBlack,),
              ),
              TextFormField(
                controller: provider.nameCtr,
                decoration: textFieldDeco("Input your full name"),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, bottom: 10, top: 15),
                child: AppText(text: 'Email', size: 14, color: AppColors.leadBlack,),),
              TextFormField(
                controller: provider.emailCtr,
                decoration: textFieldDeco("Input your email"),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 10, top: 15),
                  child: AppText(text: 'Password', size: 14, color: AppColors.leadBlack,)),
              TextFormField(
                controller: provider.passwordCtr,
                obscureText: hidden,
                decoration: textFieldDeco("Input your password",
                  IconButton(
                    icon: Icon(
                      hidden
                          ? Icons.visibility_off
                          :Icons.visibility,

                      color: AppColors.lightGrey,
                    ),
                    onPressed: () {
                      setState(() {
                        hidden = !hidden;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: Button(
                  text: 'Sign Up',
                  press: () {
                    if (_formKey.currentState!.validate()){
                      provider.signup(context);
                    }

                  },
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(vertical: 10),
              //   child: Align(
              //       alignment: Alignment.center,
              //       child: AppText(text: 'OR', size: 18, color: AppColors.leadBlack,)),
              // ),
              //
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     TextButton(
              //       onPressed: (){
              //
              //       },
              //       style: TextButton.styleFrom(
              //           shape: const CircleBorder()
              //       ),
              //       child: SvgPicture.asset(
              //         "assets/icons/google.svg",),
              //     ),
              //     TextButton(
              //       onPressed: (){
              //
              //       },
              //       style: TextButton.styleFrom(
              //           shape: const CircleBorder()
              //       ),
              //       child: SvgPicture.asset(
              //         "assets/icons/twitter.svg",),
              //     ),
              //   ],
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppText(text: 'Already have an account?',
                    color: AppColors.leadBlack,size: 16, fontWeight: FontWeight.w400,),
                  TextButton(

                    onPressed: widget.pressed,
                    style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        )
                    ),
                    child: const AppText(text: 'Log in',
                      color: AppColors.primaryColor,size: 16, fontWeight: FontWeight.w700,),
                  ),
                ],
              ),
            ],
          ),
        )
    );

  }
}










