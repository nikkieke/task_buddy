import '../repository/auth_repository.dart';
import 'package:appwrite/models.dart';


abstract class AuthUseCase{
  Future<User>signUp(String userID, String name, String email, String password);
  Future<Session>signIn(String email, String password);
  
}






class AuthUseCaseImpl implements AuthUseCase{
  final AuthRepository authRepository;

  AuthUseCaseImpl(this.authRepository);

  @override
  Future<User> signUp(String userID, String name, String email, String password) async{
    return await authRepository.createUser(userID, name, email, password);
  }

  @override
  Future<Session> signIn(String email, String password) async{
    return await authRepository.signInUser(email, password);
  }
  
}