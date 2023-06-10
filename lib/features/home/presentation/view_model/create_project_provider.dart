import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CreateProjectProvider extends ChangeNotifier{
  final ChangeNotifierProviderRef ref;

  CreateProjectProvider({required this.ref});

  String startFormatted = DateFormat.yMd().add_jm().format(DateTime.now()).toString();
  String endFormatted = DateFormat.yMd().add_jm().format(DateTime.now()).toString();


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


}

final createProjectProvider = ChangeNotifierProvider<CreateProjectProvider>((ref) => CreateProjectProvider(ref: ref));