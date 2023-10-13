import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../infrastructure/repository/provider.dart';
import 'auth_usecase.dart';


final signupProvider = Provider<AuthUseCase>((ref){
  return AuthUseCaseImpl(ref.read(createAcctProvider));
});

final logInProvider = Provider<AuthUseCase>((ref){
  return AuthUseCaseImpl(ref.read(signInProvider));
});

final logoutProvider = Provider<AuthUseCase>((ref){
  return AuthUseCaseImpl(ref.read(signInProvider));
});