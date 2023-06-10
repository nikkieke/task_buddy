import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_buddy/core/colors/app_colors.dart';
import 'package:task_buddy/widgets/app_text.dart';

import '../../../../core/routes/routes.dart';
import '../widgets/status_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.starkWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: (){

                    },
                    icon: const Icon(Icons.menu_rounded, size: 35,),
                  color: AppColors.leadBlack,
                  style: IconButton.styleFrom(
                    shape: const CircleBorder()
                ),
                ),
                const SizedBox(height: 30,),
                const AppText(text: "Hello John!",
                  size: 40,color:AppColors.leadBlack,
                  fontWeight: FontWeight.w700,),
                const AppText(text: "Hope your day as amazing as you are",
                  size: 16,color:AppColors.leadBlack,
                  fontWeight: FontWeight.w700,),
                const SizedBox(height: 30,),
                CupertinoSearchTextField(
                  backgroundColor: AppColors.primaryColor.withOpacity(0.2),
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  prefixInsets: const EdgeInsets.only(left: 15),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  //controller: controller,
                  onChanged: (value) {},
                  onSubmitted: (value) {},
                  autocorrect: true,
                ),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    StatusWidget(text: 'All', pressed: () {

                    },),
                    StatusWidget(text: 'Pending', pressed: () {

                    },),
                    StatusWidget(text: 'Completed', pressed: () {

                    },),
                  ],
                ),
                const SizedBox(height: 20,),
                const AppText(text: "Projects",
                  size: 20,color:AppColors.leadBlack,
                  fontWeight: FontWeight.w700,),
                const SizedBox(height: 20,),
                SizedBox(
                  height: MediaQuery.of(context).size.height/2.2,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                        itemBuilder: (context, index){
                          return TextButton(
                            onPressed: () {
                              context.push("${Routes.HOME}/${Routes.PROJECTDETAILS}");
                            },
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              height: 100,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor.withOpacity(0.2),
                                borderRadius: const BorderRadius.all(Radius.circular(30)),
                              ),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 45,
                                    width:45,
                                      decoration: const BoxDecoration(
                                        color: AppColors.starkWhite,
                                        shape: BoxShape.circle
                                      ),
                                      child: const Icon(Icons.file_open, size: 28,color: AppColors.secondaryColor,)),
                                  const AppText(text: "House keeping Project",
                                    size: 20,color:AppColors.leadBlack,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.more_vert_outlined, size: 28,color: AppColors.leadBlack,),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                    ),
                ),



              ],
            ),
          ),
        ),
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
    );
  }
}

