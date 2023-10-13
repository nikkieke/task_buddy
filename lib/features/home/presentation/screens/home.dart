import 'package:appwrite/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:task_buddy/core/colors/app_colors.dart';
import 'package:task_buddy/widgets/app_text.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/service/appwrite_client.dart';
import '../view_model/create_project_provider.dart';
import '../widgets/project_list_widget.dart';
import '../widgets/status_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late CreateProjectProvider provider;



  @override
  void didChangeDependencies() {
    provider = ref.watch(createProjectProvider);
    provider.getList();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    provider = ref.watch(createProjectProvider);


    return provider.haveData ?
    Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.starkWhite,
      drawer:  Drawer(
        width: 200,
        backgroundColor: Colors.grey,
        child: Container(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              const Divider(),
              ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text("Log out",style: TextStyle(
                      color: Colors.white,  fontSize: 15)),
                  onTap: (){
                    provider.logout(context);
                  }
              ),
            ],
          ),
        )
      ),
      appBar: AppBar(title: const Text(""),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IconButton(
                //   onPressed: (){
                //
                //   },
                //   icon: const Icon(Icons.menu_rounded, size: 35,),
                //   color: AppColors.leadBlack,
                //   style: IconButton.styleFrom(
                //       shape: const CircleBorder()
                //   ),
                // ),
                const SizedBox(height: 30,),
              AppText(text: "Hello ${provider.user.name}!",
                size: 40,color:AppColors.leadBlack,
                fontWeight: FontWeight.w700,),

                const AppText(text: "Hope your day as amazing as you are",
                  size: 16,color:AppColors.leadBlack,
                  fontWeight: FontWeight.w700,),
                const SizedBox(height: 50,),
                CupertinoSearchTextField(
                  backgroundColor: AppColors.primaryColor.withOpacity(0.2),
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  prefixInsets: const EdgeInsets.only(left: 15),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  controller: provider.searchCtr,
                  onChanged: (value) {
                    provider.searchList(value);
                  },
                  autocorrect: true,
                ),
                provider.currentProjectList.isEmpty?
                    const Center(
                      child: Column(
                        children: [
                          Icon(Icons.note_alt_outlined,
                            color: AppColors.secondaryColor,size: 150,),
                          AppText(text: "No projects available. "
                              "Create New Project",
                            size: 16,color:AppColors.leadBlack,
                            fontWeight: FontWeight.w700,),

                        ],
                      ),
                    ):
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 30,),
                    // Row(
                    //   children: [
                    //     StatusWidget(text: 'All', pressed: () {
                    //
                    //     },),
                    //     StatusWidget(text: 'Pending', pressed: () {
                    //
                    //     },),
                    //     StatusWidget(text: 'Completed', pressed: () {
                    //
                    //     },),
                    //   ],
                    // ),
                    const SizedBox(height: 20,),
                     AppText(text: "Projects",
                      size: 18,color:AppColors.leadBlack.withOpacity(0.5),
                      fontWeight: FontWeight.w700,),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/2.2,
                      child: ProjectList(provider: provider),
                    ),

                  ],
                )



              ],
            ),
          ),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.starkWhite,
        foregroundColor: AppColors.primaryColor,
        onPressed: () {
          context.push("${Routes.HOME}/${Routes.CREATEPROJECT}");
        },
        child: const Icon(Icons.add),
      ),
    )
    :const Scaffold(
      body: Center(
        child: LoadingIndicator(
        indicatorType: Indicator.orbit,
        colors: [AppColors.primaryColor],
        strokeWidth: 2,
        backgroundColor: AppColors.starkWhite,
        pathBackgroundColor: AppColors.starkWhite
        ),
      ),
    );
  }
}



