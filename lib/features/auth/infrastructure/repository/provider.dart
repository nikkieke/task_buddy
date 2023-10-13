import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repository/auth_repository.dart';
import 'auth_repository_impl.dart';

final createAcctProvider = Provider<AuthRepository>((ref){
  return AuthRepositoryImpl();
});

final signInProvider = Provider<AuthRepository>((ref){
  return AuthRepositoryImpl();
});

final signOutProvider = Provider<AuthRepository>((ref){
  return AuthRepositoryImpl();
});

