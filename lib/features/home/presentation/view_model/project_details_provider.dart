import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/dialog_box_widget.dart';

class ProjectDetailsProvider extends ChangeNotifier{
  final ChangeNotifierProviderRef ref;

  ProjectDetailsProvider({required this.ref});

  bool taskCompleted = false;
  final newTaskCtr = TextEditingController();

  completedToggle(bool? value) {
    taskCompleted = value!;
    notifyListeners();
  }



}

final projectDetailsProvider = ChangeNotifierProvider<ProjectDetailsProvider>((ref) => ProjectDetailsProvider(ref: ref));