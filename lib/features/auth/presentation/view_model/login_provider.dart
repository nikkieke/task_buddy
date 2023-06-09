import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/usecase/provider.dart';


import '../../../../core/routes/routes.dart';
import '../../../../widgets/app_text.dart';

class LoginProvider extends ChangeNotifier{
  final ChangeNotifierProviderRef ref;

  LoginProvider({required this.ref});

  bool loading = false;
  final emailCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();


  Future<void>login(BuildContext context)async{
    loading = true;
    notifyListeners();
    final response = await ref.watch(logInProvider)
        .signIn(
      emailCtr.text,
      passwordCtr.text,
    ).catchError((e){
      if(context.mounted){
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: AppText(text: 'Login Failed! Please input valid details',)));
      }
      loading = false;
      notifyListeners();
      throw e;
    });

    print(response);
    if(context.mounted){
      context.go(Routes.HOME);
    }

    loading = false;
    notifyListeners();
  }



}



final loginProvider = ChangeNotifierProvider<LoginProvider>((ref) => LoginProvider(ref: ref));