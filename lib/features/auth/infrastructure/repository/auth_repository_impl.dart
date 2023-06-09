import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import '../../../../core/service/appwrite_client.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  @override
  Future<User> createUser(String userId, String name, String email, String password)async {
    Account account = Account(AppWriteClient.instance.client);

    try{
      final response = await account
          .create(userId: userId,
          name: name,
          email: email,
          password: password);
      await account.createEmailSession(email: email, password: password);
      return response;

    }on AppwriteException catch(e){
      throw e.response.toString();
    }


  }

  @override
  Future<Session> signInUser(String email, String password)async {
    Account account = Account(AppWriteClient.instance.client);
    try{
      final response = await account
          .createEmailSession(
          email: email,
          password: password);
      await account.createEmailSession(email: email, password: password);
      return response;

    }on AppwriteException catch(e){
      throw e.response.toString();
    }
  }

}