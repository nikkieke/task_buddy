import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_buddy/features/home/infrastructure/repository/project_repository_impl.dart';

import '../../domain/repository/project_repository.dart';


final  createProjectProvider = Provider<ProjectRepository>((ref){
  return ProjectRepositoryImpl();
});

final getProjectsProvider = Provider<ProjectRepository>((ref){
  return ProjectRepositoryImpl();
});

final deleteProjectsProvider = Provider<ProjectRepository>((ref){
  return ProjectRepositoryImpl();
});

final editProjectsProvider = Provider<ProjectRepository>((ref){
  return ProjectRepositoryImpl();
});