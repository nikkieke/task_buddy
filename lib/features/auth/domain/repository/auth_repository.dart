import 'package:appwrite/models.dart';

abstract class AuthRepository{
  Future<User>createUser(String userID, String name, String email, String password);
  Future<Session>signInUser(String email, String password);

}