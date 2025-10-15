import 'package:flutter/material.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/data/models/on_bording_model.dart';
import 'package:insulin95/features/splash/interface/on%20board/interface/view/on_boarding_button.dart';
import 'package:insulin95/features/splash/interface/on%20board/interface/view/on_bodring_indicator.dart';
import 'package:insulin95/features/splash/interface/on%20board/interface/view/widgets/on_boarding_page.dart';

class OnBoardBody extends StatefulWidget {
  const OnBoardBody({super.key});

  @override
  State<OnBoardBody> createState() => _OnBoardBodyState();
}

class _OnBoardBodyState extends State<OnBoardBody> {
  final List<OnBordingModel> pages = [
    OnBordingModel(
      image: "assets/on_board/onboard1.png",
      title: "All-in-one Diabetes Management",
      subTitle:
          "Track Your blood sugar, calculate your BMI,\n plan healthy meals, and chat with AI - all in\n one easy-to-use-app",
    ),
    OnBordingModel(
      image: "assets/on_board/onboard2.png",
      title: "Healthy Living & Fitness",
      subTitle:
          "Discover Balanced meal planes and simple\n exercise routines to keep your body active.",
    ),
    OnBordingModel(
      image: "assets/on_board/onboard3.png",
      title: "Direct Communication with\n Doctors",
      subTitle:
          "Get quick and accurate medical advice from\n your doctors dirctly through the app",
    ),
  ];

  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              VerticalSpace(9).of(context),

              Expanded(
                child: PageView.builder(
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  controller: controller,
                  itemBuilder: (context, index) {
                    return OnBoardingPage(model: pages[index]);
                  },
                ),
              ),

              VerticalSpace(2).of(context),

              OnbordingIndicator(currentIndex: currentIndex, pages: pages),

              VerticalSpace(2).of(context),

              OnBordingButton(
                
                currentIndex: currentIndex,
                pages: pages,
                controller: controller,
              ),

              VerticalSpace(2).of(context),
            ],
          ),
        ),
      ),
    );
  }
}
