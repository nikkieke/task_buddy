import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import 'config.dart';

class AppWriteClient{
  AppWriteClient._();

  static final instance = AppWriteClient._();

  Client client = Client()
      .setEndpoint(AppWriteConfig.endpoint)
      .setProject(AppWriteConfig.projectID);

  static final database = Databases(AppWriteClient.instance.client);


  Future<User>getUser()async{
    Account account = Account(client);

    try{
      final currentUser = await account.get();
      print(currentUser.name);
      return currentUser;
    }on AppwriteException catch(e){
      throw e.response.toString();
    }

  }
}