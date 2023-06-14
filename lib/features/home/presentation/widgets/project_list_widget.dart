import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/routes/routes.dart';
import '../../../../widgets/app_text.dart';
import '../view_model/create_project_provider.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({
    super.key,
    required this.provider,
  });

  final CreateProjectProvider provider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: provider.currentProjectList.length,
        itemBuilder: (context, index){
          return TextButton(
            onPressed: () {
              context.push("${Routes.HOME}/"
                  "${Routes.PROJECTDETAILS}",
                  extra: {...provider.currentProjectList[index].data, 'id': provider.currentProjectList[index].$id},

              );
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            child: Slidable(
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    icon: Icons.delete,
                    onPressed: (context){
                      provider.deleteProjectItem(provider.currentProjectList[index].$id);
                      provider.currentProjectList.removeAt(index);
                    },
                    backgroundColor: Colors.red.shade300,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  )
                ],
              ),
              child:
              Container(
                padding: const EdgeInsets.symmetric( horizontal: 10),
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child:  Row(

                  children: [
                    Container(
                        height: 45,
                        width:45,
                        decoration: const BoxDecoration(
                            color: AppColors.starkWhite,
                            shape: BoxShape.circle
                        ),
                        child: const Icon(Icons.file_open, size: 28,color: AppColors.secondaryColor,)),
                    Flexible(

                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: AppText(text: provider.projectList[index].data['title'],
                          size: 20,color:AppColors.leadBlack, overFLow: TextOverflow.clip,
                        ),
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(Icons.more_vert_outlined, size: 28,color: AppColors.leadBlack,),
                    // ),
                  ],
                ),
              ),
            ),
          );

        }
    );
  }
}