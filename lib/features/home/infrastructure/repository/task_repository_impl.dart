
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:task_buddy/features/home/domain/repository/tasks_repository.dart';

import '../../../../core/service/appwrite_client.dart';
import '../../../../core/service/config.dart';

class TaskRepositoryImpl implements TasksRepository{
  @override
  Future<Document> createTask(String projectID, String taskName, ) async {
    final databases = AppWriteClient.database;
    final user = await AppWriteClient.instance.getUser();
      try {
        final document = await databases.createDocument(
            databaseId: AppWriteConfig.databaseID,
            collectionId: AppWriteConfig.tasksCollectionID,
            documentId: ID.unique(),
            data: {
              'userID': user.$id,
              'projectID': projectID,
              'name': taskName,
              'isCompleted' : false,
            }
        );
        print(document);
        return document;
      } on AppwriteException catch(e) {
        throw e.response.toString();
      }
  }

  @override
  Future<List<Document>> getTasks(String projectID, ) async{
    final databases = AppWriteClient.database;
    try {
      final document = await databases.listDocuments(
          databaseId: AppWriteConfig.databaseID,
          collectionId: AppWriteConfig.tasksCollectionID,
          queries: [
            Query.equal('projectID', projectID),
            //Query.orderDesc('createdAt'),
          ]
      );
      print(document);
      return document.documents;
    } on AppwriteException catch(e) {
      throw e.response.toString();
    }

  }

  @override
  Future<void> deleteTask(String documentId) async{
    final databases = AppWriteClient.database;

    try {
      final response = await databases.deleteDocument(
          databaseId: AppWriteConfig.databaseID,
          collectionId: AppWriteConfig.tasksCollectionID,
           documentId: documentId
      );
      print(response);

    } on AppwriteException catch(e) {
      throw e.response.toString();
    }
  }

  @override
  Future<Document> updateTask(bool isCompleted, String documentId) async{
    final databases = AppWriteClient.database;
    try {
      final response = await databases.updateDocument(
          databaseId: AppWriteConfig.databaseID,
          collectionId: AppWriteConfig.tasksCollectionID,
          documentId: documentId,
          data: {
            'isCompleted' : !isCompleted,
          }
      );
      print(response);
      return response;
    } on AppwriteException catch(e) {
      throw e.response.toString();
    }
  }

}