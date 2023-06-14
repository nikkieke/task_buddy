import 'package:appwrite/models.dart';

abstract class TasksRepository{
  Future<Document>createTask(String projectID, String taskName,);
  Future<List<Document>>getTasks(String projectID,);
  Future<void>deleteTask(String documentId);
  Future<Document>updateTask(bool isCompleted, String documentId);
}