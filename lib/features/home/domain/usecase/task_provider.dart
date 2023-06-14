import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_buddy/features/home/domain/usecase/task_usecase.dart';

import '../../infrastructure/repository/task_provider.dart';

final createNewTaskProvider = Provider<TaskUseCase>((ref) {
  return TaskUseCaseImpl(ref.read(createTaskProvider));
});

final getAllTasksProvider = Provider<TaskUseCase>((ref) {
  return TaskUseCaseImpl(ref.read(getTasksProvider));
});

final deleteATaskProvider = Provider<TaskUseCase>((ref) {
  return TaskUseCaseImpl(ref.read(deleteTaskProvider));
});

final editATaskProvider = Provider<TaskUseCase>((ref) {
  return TaskUseCaseImpl(ref.read(editTaskProvider));
});