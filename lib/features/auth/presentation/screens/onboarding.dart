import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_buddy/widgets/app_text.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/routes/routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.8,
                height: MediaQuery.of(context).size.height/1.2,
                initialPage: 0,
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged:
                    (index, reason) {
                  setState(() =>
                  activeIndex = index);
                },
              ),
              items: [
                CarouselWidget(size: size, artboard: "buddy_illustration1", text: "Welcome to TaskBuddy! Meet our adorable mascot, "
                    "Buddy, your ultimate companion in managing tasks. Stay organized and smash your goals with ease!",),
                CarouselWidget(size: size, artboard: "buddy_illustration2", text: 'Say goodbye to scattered tasks and hello to efficient project management. '
                    'Group all your tasks into projects and tackle them with focus and determination.',),
                CarouselWidget(size: size, artboard: "buddy_illustration3", text: 'Stay updated and effectively keep tabs on your progress across multiple projects with TaskBuddy! '
                    'Set deadlines and create reminders.',),
              ],
            ),

              carouselIndicator(activeIndex),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppText(text: 'Skip',
                      color: AppColors.starkWhite,size: 18, fontWeight: FontWeight.w400,),

                    TextButton(
                      onPressed: () {
                        context.go(Routes.GETSTARTED);
                      },
                      style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          )
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 120,
                        decoration: const BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child: const AppText(text: 'Next',
                          color: AppColors.leadBlack,size: 18, fontWeight: FontWeight.w400,),
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
    required this.size,
    required this.artboard,
    required this.text,
  });

  final Size size;
  final String artboard;
  final String text;

  @override
  Widget build(BuildContext context) {
    return 
      Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          height: size.height/2,
          decoration:  const BoxDecoration(
              color: AppColors.starkWhite,
              borderRadius: BorderRadius.all(Radius.circular(30)),

          ),
          child:  RiveAnimation.asset(
            "assets/rive_assets/onboarding.riv",
            artboard: artboard,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
         AppText(text: text,
          color: AppColors.starkWhite,size: 18, fontWeight: FontWeight.w400,),

      ],
    );
  }
}

Widget carouselIndicator(activeIndex){
  return AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count:  3,
          effect:  const ExpandingDotsEffect(
            activeDotColor: AppColors.secondaryColor,
            dotColor: AppColors.starkWhite,
            dotHeight: 8,
            dotWidth: 8,
          )
      );

}