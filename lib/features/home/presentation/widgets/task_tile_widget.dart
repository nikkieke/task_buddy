import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../widgets/app_text.dart';

class TaskTileWidget extends StatelessWidget {
  TaskTileWidget({
    super.key,
    required this.onChanged,
    required this.taskName,
    required this.taskCompleted,
    required this.deleteFunction,
  });


  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  final String taskName;
  final bool taskCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
                icon: Icons.delete,
                onPressed: deleteFunction,
                backgroundColor: Colors.red.shade300,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
            )
          ],
        ),
        child: Container(
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child:  Row(
            children: [
              Checkbox(
                shape: const CircleBorder(),
                value: taskCompleted,
                onChanged: onChanged,
              ),
              AppText(text: taskName, size: 15, line: taskCompleted?
              TextDecoration.lineThrough: TextDecoration.none,),

            ],
          ),
        ),
      ),
    );
  }
}