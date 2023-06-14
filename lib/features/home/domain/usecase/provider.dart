import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_buddy/features/home/domain/usecase/project_usecase.dart';

import '../../infrastructure/repository/provider.dart';

final createNewProjectProvider = Provider<ProjectUseCase>((ref) {
  return ProjectUseCaseImpl(ref.read(createProjectProvider));
});

final getAllProjectsProvider = Provider<ProjectUseCase>((ref) {
  return ProjectUseCaseImpl(ref.read(getProjectsProvider));
});

final deleteAProjectsProvider = Provider<ProjectUseCase>((ref) {
  return ProjectUseCaseImpl(ref.read(deleteProjectsProvider));
});

final editAProjectsProvider = Provider<ProjectUseCase>((ref) {
  return ProjectUseCaseImpl(ref.read(editProjectsProvider));
});