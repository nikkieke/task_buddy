import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_buddy/core/colors/app_colors.dart';
import 'package:task_buddy/widgets/button.dart';

import '../../../../core/routes/routes.dart';
import '../../../../widgets/app_text.dart';
import '../view_model/create_project_provider.dart';

class CreateProjectScreen extends ConsumerStatefulWidget {
  const CreateProjectScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends ConsumerState<CreateProjectScreen> {
  late CreateProjectProvider provider;


  @override
  Widget build(BuildContext context) {

    provider = ref.watch(createProjectProvider);
    return Scaffold(
      backgroundColor: AppColors.starkWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
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
                      size: 30, color: AppColors.leadBlack,
                      fontWeight: FontWeight.w700,),
                    Icon(Icons.file_open, size: 28,
                      color: AppColors.secondaryColor,),
                  ],
                ),
                const SizedBox(height: 50,),
                const AppText(text: "Title",
                  size: 15, color: AppColors.midGrey,
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
                  size: 15, color: AppColors.midGrey,
                  fontWeight: FontWeight.w700,),
                TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.leadBlack
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
                      size: 15, color: AppColors.midGrey,
                      fontWeight: FontWeight.w700,),
                    TextButton(
                      onPressed: (){
                        provider.pickStartDateTime(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 160,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: AppText(text: provider.startFormatted,
                          size: 15, color: AppColors.starkWhite,fontWeight: FontWeight.w700,),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppText(text: "Set End Date & Time",
                      size: 15, color: AppColors.midGrey,
                      fontWeight: FontWeight.w700,),
                    TextButton(
                      onPressed: () {
                        provider.pickEndDateTime(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 160,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child:  AppText(text: provider.endFormatted,
                          size: 15, color: AppColors.starkWhite,fontWeight: FontWeight.w700,),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30,),
                Align(
                  alignment: Alignment.center,
                  child: Button(
                      text: "Create Project",
                      press: (){}
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }




}
