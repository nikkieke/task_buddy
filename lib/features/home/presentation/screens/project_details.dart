import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_buddy/core/colors/app_colors.dart';

import '../../../../core/routes/routes.dart';
import '../../../../widgets/app_text.dart';
import '../view_model/project_details_provider.dart';
import '../widgets/dialog_box_widget.dart';
import '../widgets/task_tile_widget.dart';

class ProjectDetailsScreen extends ConsumerStatefulWidget {
  const ProjectDetailsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends ConsumerState<ProjectDetailsScreen> {
  late ProjectDetailsProvider provider;


  @override
  Widget build(BuildContext context) {
    provider = ref.watch(projectDetailsProvider);
    return Scaffold(
      backgroundColor: AppColors.starkWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
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
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 90,
                  width: 270,
                  decoration:  const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          AppColors.primaryColor,
                          AppColors.secondaryColor
                        ]),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(text: "24 : 06 : 22 : 59",
                        size: 28, color: AppColors.starkWhite,
                        fontWeight: FontWeight.w700,),
                      AppText(text: "DAYS : HOURS : MINUTES : SECONDS",
                        size: 10, color: AppColors.starkWhite,
                        fontWeight: FontWeight.w700,),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              const AppText(text: "Tasks",
                size: 20, color: AppColors.leadBlack,
                fontWeight: FontWeight.w700,),
              const SizedBox(height: 30,),
              TaskTileWidget(
                provider: provider,
                taskName: 'Finish app',
                onChanged: provider.completedToggle,
              ),

            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.starkWhite,
        foregroundColor: AppColors.primaryColor,
        onPressed: (){
          showDialog(
              context: context,
              builder: (context){
            return DialogBox(controller: provider.newTaskCtr,);
          }
          );
    },

    child: const Icon(Icons.add),
      ),
    );
  }
}





