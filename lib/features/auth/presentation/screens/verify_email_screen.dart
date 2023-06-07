import 'package:flutter/material.dart';
import 'package:task_buddy/core/colors/app_colors.dart';

import '../../../../widgets/app_text.dart';
import '../../../../widgets/button.dart';
import '../widgets/textfield_decoration.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 300,
            decoration: const BoxDecoration(
              color: AppColors.starkWhite,
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppText(text: 'Let\'s verify your email!',
                  color: AppColors.primaryColor,size: 28, fontWeight: FontWeight.w700, textAlign: TextAlign.center,),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  decoration: textFieldDeco("Input your email"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Button(
                  text: 'Verify',
                  press: () {
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
