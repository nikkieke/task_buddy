import 'package:appwrite/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecase/task_provider.dart';

class ProjectDetailsProvider extends ChangeNotifier{
  final ChangeNotifierProviderRef ref;

  ProjectDetailsProvider({required this.ref});
  bool loading = false;
  final newTaskCtr = TextEditingController();
  List <Document> list = [];
  bool haveData = false;



  Future<void>createTask(String projectID, context)async{
    final response = await ref.watch(createNewTaskProvider).
    createATask(
        projectID,
        newTaskCtr.text,
    ).catchError((e){
      notifyListeners();
      throw e;
    });
    print(response);
    getTaskList(projectID);
    notifyListeners();
  }

  Future<void> getTaskList(String projectID)async{
    list = await ref.watch(getAllTasksProvider)
        .getAllTasks(projectID)
        .catchError((e){
      throw e;
    });

    print(list.toString());
    haveData = true;
    notifyListeners();
  }

  Future<void> deleteTaskItem(String documentId, index)async{
    await ref.watch(deleteATaskProvider)
        .deleteATask(documentId)
        .catchError((e) {
      throw e;
    });
    list.removeAt(index);
    notifyListeners();
  }

  Future<void>updateDocument(String projectID, String documentId, bool isCompleted, )async{
    final response = await ref.watch(editATaskProvider)
        .updateATask
      (
        isCompleted,
        documentId
    ).catchError((e) {
      throw e;
    });
    print(response);
    getTaskList(projectID);
    notifyListeners();
  }



}

final projectDetailsProvider = ChangeNotifierProvider<ProjectDetailsProvider>((ref) => ProjectDetailsProvider(ref: ref));