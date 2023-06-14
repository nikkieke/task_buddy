
import 'package:appwrite/models.dart';

abstract class ProjectRepository{
  Future<Document>createProject(String title, String description, String? startDate, String? endDate);
  Future<List<Document>>getProjects();
  Future<void>deleteProject(String documentId);
  Future<Document>editProject(String title, String description, String? startDate, String? endDate, String documentId);
}