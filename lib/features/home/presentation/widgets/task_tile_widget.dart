import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../widgets/app_text.dart';
import '../view_model/project_details_provider.dart';

class TaskTileWidget extends StatelessWidget {
  TaskTileWidget({
    super.key,
    required this.onChanged,
    required this.taskName,
    required this.provider,
  });

  final ProjectDetailsProvider provider;
  Function(bool?)? onChanged;
  final String taskName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child:  Row(
        children: [
          Checkbox(
            shape: const CircleBorder(),
            value: provider.taskCompleted,
            onChanged: onChanged,
          ),
          AppText(text: taskName, size: 15, line: provider.taskCompleted?
          TextDecoration.lineThrough: TextDecoration.none,),

        ],
      ),
    );
  }
}