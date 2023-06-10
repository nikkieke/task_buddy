import 'package:flutter/material.dart';
import 'package:task_buddy/core/colors/app_colors.dart';

import '../../../../widgets/button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.starkWhite,
      content: SizedBox(
        height: 190,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
            onPressed: () {

      },
        icon: const Icon(Icons.arrow_back, size: 20,),
        color: AppColors.leadBlack,
        style: IconButton.styleFrom(
            shape: const CircleBorder()
        ),
            ),
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.leadBlack, width: 0.7)
                ),
                hintText: "Add New Task",
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: AppColors.midGrey,
                )
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
                child: Button(text: 'Save', press: () {  },))
          ],
        ),
      ),
    );
  }
}
