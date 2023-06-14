import 'package:appwrite/models.dart';

import '../repository/project_repository.dart';

abstract class ProjectUseCase{
  Future<Document>createNewProject(String title, String description, String? startDate, String? endDate);
  Future<List<Document>> getAllProjects();
  Future<void>deleteAProject(String documentId);
  Future<Document>editAProject(String title, String description, String? startDate, String? endDate, String documentId);

}

class ProjectUseCaseImpl implements ProjectUseCase{
  final ProjectRepository projectRepository;

  ProjectUseCaseImpl(this.projectRepository);
  @override
  Future<Document> createNewProject(String title, String description, String? startDate, String? endDate) async{
    return await projectRepository.createProject(title, description, startDate, endDate);
  }

  @override
  Future<List<Document>> getAllProjects() async{
    return await projectRepository.getProjects();
  }

  @override
  Future<void> deleteAProject(String documentId) async{
    return await projectRepository.deleteProject(documentId);
  }

  @override
  Future<Document> editAProject(String title, String description,
      String? startDate, String? endDate, String documentId) async{
    return await projectRepository.editProject(title, description, startDate, endDate, documentId);
  }

}