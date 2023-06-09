import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_buddy/core/colors/app_colors.dart';

import '../../../../core/routes/routes.dart';
import '../../../../widgets/app_text.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({Key? key}) : super(key: key);

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  DateTime dateTime = DateTime(2023, 12, 24, 5, 30);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.starkWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: (){
                  context.go(Routes.HOME);
                },
                icon: const Icon(Icons.arrow_back, size: 35,),
                color: AppColors.leadBlack,
                style: IconButton.styleFrom(
                    shape: const CircleBorder()
                ),
              ),
              const SizedBox(height: 30,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text: "New Project",
                    size: 30,color:AppColors.leadBlack,
                    fontWeight: FontWeight.w700,),
              Icon(Icons.file_open, size: 28,color: AppColors.secondaryColor,),
      ],
              ),
              const SizedBox(height: 50,),
              const AppText(text: "Title",
                size: 15,color:AppColors.leadBlack,
                fontWeight: FontWeight.w700,),
              TextFormField(
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 2),
                  focusedBorder: UnderlineInputBorder(borderSide:
                  BorderSide(width: 0.7, color: AppColors.primaryColor))


                ),
              ),
              const SizedBox(height: 20,),
              const AppText(text: "Description",
                size: 15,color:AppColors.leadBlack,
                fontWeight: FontWeight.w700,),
              TextFormField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
                decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.only(bottom: 2),
                    focusedBorder: UnderlineInputBorder(borderSide:
                    BorderSide(width: 0.7, color: AppColors.primaryColor))


                ),
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText(text: "Set Start Date & Time",
                    size: 15,color:AppColors.leadBlack,
                    fontWeight: FontWeight.w700,),
                  TextButton(
                    onPressed: () {

                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: const AppText(text: "1/2/2023 5:30pm",
                        size: 15,color:AppColors.starkWhite,),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText(text: "Set End Date & Time",
                    size: 15,color:AppColors.leadBlack,
                    fontWeight: FontWeight.w700,),
                  TextButton(
                    onPressed: () {

                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: const AppText(text: "1/2/2023 5:30pm",
                        size: 15,color:AppColors.starkWhite,),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
