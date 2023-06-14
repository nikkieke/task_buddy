import 'package:appwrite/models.dart';

import '../repository/tasks_repository.dart';

abstract class TaskUseCase{
  Future<Document>createATask(String projectID, String taskName, );
  Future<List<Document>>getAllTasks(String projectID,);
  Future<void>deleteATask(String documentId);
  Future<Document>updateATask(bool isCompleted, String documentId);
}

class TaskUseCaseImpl implements TaskUseCase{
  final TasksRepository tasksRepository;

  TaskUseCaseImpl(this.tasksRepository);

  @override
  Future<Document> createATask(String projectID, String taskName, ) {
    return tasksRepository.createTask(projectID, taskName, );
  }

  @override
  Future<void> deleteATask(String documentId) {
    return tasksRepository.deleteTask(documentId);
  }

  @override
  Future<List<Document>> getAllTasks(String projectID) {
   return tasksRepository.getTasks(projectID);
  }

  @override
  Future<Document> updateATask(bool isCompleted, String documentId) {
    return tasksRepository.updateTask(isCompleted, documentId);

  }

}