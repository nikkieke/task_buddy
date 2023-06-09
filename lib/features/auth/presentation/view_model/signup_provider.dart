
import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_buddy/widgets/app_text.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/service/appwrite_client.dart';
import '../../domain/usecase/provider.dart';

class SignupProvider extends ChangeNotifier{
  final ChangeNotifierProviderRef ref;
  
  SignupProvider({required this.ref});
  
  bool loading = false;
  final nameCtr = TextEditingController();
  final emailCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  
  Future<void>signup(BuildContext context)async{
    loading = true;
    notifyListeners();
    final response = await ref.watch(signupProvider)
        .signUp(
        ID.unique(),
        nameCtr.text,
        emailCtr.text,
        passwordCtr.text,
    ).catchError((e){
      if(context.mounted){
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: AppText(text: 'SignUp Failed! Please input valid details',)));
      }
      loading = false;
      notifyListeners();
      throw e;
    });

    print(response.status);
    if(response.status == true){
      if(context.mounted){
        context.go(Routes.HOME);
      }

    }

      loading = false;
      notifyListeners();
    }



  }
  


final signUpProvider = ChangeNotifierProvider<SignupProvider>((ref) => SignupProvider(ref: ref));
