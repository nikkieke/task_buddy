
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import '../../../../core/service/appwrite_client.dart';
import '../../../../core/service/config.dart';
import '../../domain/repository/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository{
  @override
  Future<Document> createProject(String title, String description, String? startDate, String? endDate)async {
    final databases = AppWriteClient.database;

    final user = await AppWriteClient.instance.getUser();

    try {
      final document = await databases.createDocument(
          databaseId: AppWriteConfig.databaseID,
          collectionId: AppWriteConfig.projectsCollectionID,
          documentId: ID.unique(),
          data: {
            'userID': user.$id,
            'title': title,
            'description': description,
            'startDate': startDate,
            'endDate': endDate,
          }
          );
      print(document);

      return document;
    } on AppwriteException catch(e) {
      throw e.response.toString();
    }

  }

  @override
  Future<List<Document>> getProjects() async{

    final databases = AppWriteClient.database;
    final user = await AppWriteClient.instance.getUser();
    try {
      final response = await databases.listDocuments(
          databaseId: AppWriteConfig.databaseID,
          collectionId: AppWriteConfig.projectsCollectionID,
          queries: [
            Query.equal('userID', user.$id),
          ]
      );
      return response.documents;

    } on AppwriteException catch(e) {
      throw e.response.toString();
    }

  }

  @override
  Future<void> deleteProject(String documentId) async{
    final databases = AppWriteClient.database;

    try{
      final response = await databases.deleteDocument(
          databaseId: AppWriteConfig.databaseID,
          collectionId: AppWriteConfig.projectsCollectionID,
          documentId: documentId
      );
      print(response);
    }on AppwriteException catch(e) {
      throw e.response.toString();
    }

  }

  @override
  Future<Document> editProject(String title, String description,
      String? startDate, String? endDate, String documentId) async{
    final databases = AppWriteClient.database;
    final user = await AppWriteClient.instance.getUser();
    try {
      final response = await databases.updateDocument(
          databaseId: AppWriteConfig.databaseID,
          collectionId: AppWriteConfig.projectsCollectionID,
          documentId: documentId,
          data: {
          'userID': user.$id,
          'title': title,
          'description': description,
          'startDate': startDate,
          'endDate': endDate,
      }
      );
      return response;
    } on AppwriteException catch(e) {
      throw e.response.toString();
    }

  }

}