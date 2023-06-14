import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:task_buddy/core/colors/app_colors.dart';

import '../../../../core/routes/routes.dart';
import '../../../../widgets/app_text.dart';
import '../view_model/project_details_provider.dart';
import '../widgets/dialog_box_widget.dart';
import '../widgets/task_tile_widget.dart';

class ProjectDetailsScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic> project;

  const ProjectDetailsScreen( this.project, {Key? key}) : super(key: key);

  @override
  ConsumerState<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends ConsumerState<ProjectDetailsScreen> {
  late ProjectDetailsProvider provider;

  @override
  void didChangeDependencies() {
    provider = ref.watch(projectDetailsProvider);
    provider.getTaskList(widget.project['id']);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    provider = ref.watch(projectDetailsProvider);
    return provider.haveData ?
      Scaffold(
      backgroundColor: AppColors.starkWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: ()async {
                  context.go(Routes.HOME);
                },
                icon: const Icon(Icons.arrow_back, size: 35,),
                color: AppColors.leadBlack,
                style: IconButton.styleFrom(
                    shape: const CircleBorder()
                ),
              ),
              const SizedBox(height: 30,),
              // Align(
              //   alignment: Alignment.center,
              //   child: Container(
              //     height: 90,
              //     width: 270,
              //     decoration:  const BoxDecoration(
              //       gradient: LinearGradient(
              //           colors: [
              //             AppColors.primaryColor,
              //             AppColors.secondaryColor
              //           ]),
              //       borderRadius: BorderRadius.all(Radius.circular(20)),
              //     ),
              //     child: const Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         AppText(text: "24 : 06 : 22 : 59",
              //           size: 28, color: AppColors.starkWhite,
              //           fontWeight: FontWeight.w700,),
              //         AppText(text: "DAYS : HOURS : MINUTES : SECONDS",
              //           size: 10, color: AppColors.starkWhite,
              //           fontWeight: FontWeight.w700,),
              //       ],
              //     ),
              //   ),
              // ),

              AppText(text: "${widget.project['title']}",
                size: 28, color: AppColors.leadBlack,
                fontWeight: FontWeight.w700,),
              const SizedBox(height: 20,),
              AppText(text: "${widget.project['description'] }",
                size: 18, color: AppColors.leadBlack.withOpacity(0.5),
                fontWeight: FontWeight.w400,fontStyle: FontStyle.italic,
                textAlign: TextAlign.center,),
              const SizedBox(height: 20,),

              const SizedBox(height: 30,),
              const AppText(text: "Tasks",
                size: 20, color: AppColors.leadBlack,
                fontWeight: FontWeight.w700,),
              const SizedBox(height: 30,),
              Expanded(
                child:provider.list.isEmpty?
                const Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Icon(Icons.note_alt_outlined,
                        color: AppColors.secondaryColor,size: 150,),
                      AppText(text: "No Task Yet. "
                          "Create New Task",
                        size: 16,color:AppColors.leadBlack,
                        fontWeight: FontWeight.w700,),
                    ],
                  ),
                ):
                ListView.builder(
                  itemCount: provider.list.length,
                    itemBuilder: (context, index){
                      return TaskTileWidget(
                        taskName:provider.list[index].data['name'],
                        onChanged: (value) {
                          provider.updateDocument(
                              widget.project['id'],
                              provider.list[index].$id,
                              provider.list[index].data['isCompleted'],
                          );
                        },
                        taskCompleted: provider.list[index].data['isCompleted'],
                        deleteFunction: (context) => provider.deleteTaskItem(
                            provider.list[index].$id, index),

                      );
                    }
                ),
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
              builder: (context,){
            return DialogBox(
              controller: provider.newTaskCtr,
              pressed: () {
                provider.createTask(widget.project['id'], context);
                provider.newTaskCtr.clear();
                context.pop();

            },
            );
          }
          );
    },

    child: const Icon(Icons.add),
      ),
    )
        :const Scaffold(
      body: Center(
        child: LoadingIndicator(
            indicatorType: Indicator.orbit,
            colors: [AppColors.primaryColor],
            strokeWidth: 2,
            backgroundColor: AppColors.starkWhite,
            pathBackgroundColor: AppColors.starkWhite
        ),
      ),
    );
  }
}





