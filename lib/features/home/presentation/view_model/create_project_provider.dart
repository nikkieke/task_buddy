import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/service/appwrite_client.dart';
import '../../domain/usecase/provider.dart';

class CreateProjectProvider extends ChangeNotifier{
  final ChangeNotifierProviderRef ref;

  CreateProjectProvider({required this.ref});

  bool loading = false;
  bool haveData = false;
  final titleCtr = TextEditingController();
  final descriptionCtr = TextEditingController();
  String startFormatted = DateFormat.yMd().add_jm().format(DateTime.now()).toString();
  String endFormatted = DateFormat.yMd().add_jm().format(DateTime.now()).toString();
  List <Document> projectList = [];
  final searchCtr = TextEditingController();
  List <Document>currentProjectList = [];
  bool searchOn= false;
  late User user;





  Future pickStartDateTime(BuildContext context) async {
    DateTime dateTime = DateTime(2023, 12, 24, 5, 30);
    startFormatted = DateFormat.yMd().add_jm().format(dateTime).toString();
    notifyListeners();

    DateTime? date = await pickDate(context);
    if (date == null) return;


    TimeOfDay? time = await pickTime(context);
    if (time == null) return;

     DateTime newDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute
    );

    startFormatted = DateFormat.yMd().add_jm().format(newDateTime).toString();

    notifyListeners();
  }

  Future pickEndDateTime(BuildContext context) async {
    DateTime dateTime = DateTime(2023, 12, 24, 5, 30);
    endFormatted = DateFormat.yMd().add_jm().format(dateTime).toString();
    notifyListeners();

    DateTime? date = await pickDate(context);
    if (date == null) return;


    TimeOfDay? time = await pickTime(context);
    if (time == null) return;

    DateTime newDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute
    );

    endFormatted = DateFormat.yMd().add_jm().format(newDateTime).toString();

    notifyListeners();
  }

  Future<DateTime?> pickDate(BuildContext context) {
    DateTime dateTime = DateTime(2023, 12, 24, 5, 30);
    return showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
  }

  Future <TimeOfDay?> pickTime(BuildContext context){
    DateTime dateTime = DateTime(2023, 12, 24, 5, 30);
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),


    );
  }

  Future<void>createProject(BuildContext context)async{
    loading = true;
    notifyListeners();
     final response = await ref.watch(
         createNewProjectProvider).createNewProject(
          titleCtr.text,
          descriptionCtr.text,
          DateTime.now().toString(),
          DateTime.now().toString(),

     ).catchError((e){

       loading = false;
       notifyListeners();
       throw e;
     });
    print(response);
    titleCtr.clear();
    descriptionCtr.clear();
    if(context.mounted){
      context.go(Routes.HOME);
    }

    loading = false;
    notifyListeners();
  }

  Future<void> getList()async{
    user = await AppWriteClient.instance.getUser()
        .catchError((e){
      throw e;
    });
     projectList = await ref.watch(getAllProjectsProvider)
        .getAllProjects()
        .catchError((e){
        throw e;
    });
     if(searchOn == false){
       currentProjectList = projectList;
     }
    haveData = true;
    notifyListeners();

  }

  Future<void> deleteProjectItem(String documentId)async{
    await ref.watch(deleteAProjectsProvider)
        .deleteAProject(documentId)
        .catchError((e) {
      throw e;
    });
    notifyListeners();
  }

  void searchList(String value){
    searchOn = true;
    notifyListeners();
    if(value.isEmpty){
      currentProjectList = projectList;
    }else {
      currentProjectList = projectList.where((project) =>
          project.data['title'].toString().toLowerCase().contains(
              value.toLowerCase())).toList();
    }
    notifyListeners();
  }






}

final createProjectProvider = ChangeNotifierProvider<CreateProjectProvider>((ref) => CreateProjectProvider(ref: ref));