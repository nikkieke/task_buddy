
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_buddy/features/home/infrastructure/repository/task_repository_impl.dart';

import '../../domain/repository/tasks_repository.dart';

final  createTaskProvider = Provider<TasksRepository>((ref){
  return TaskRepositoryImpl();
});

final getTasksProvider = Provider<TasksRepository>((ref){
  return TaskRepositoryImpl();
});

final deleteTaskProvider = Provider<TasksRepository>((ref){
  return TaskRepositoryImpl();
});

final editTaskProvider = Provider<TasksRepository>((ref){
  return TaskRepositoryImpl();
});