import 'package:dots_indicator/dots_indicator.dart';
import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/fonts/fonts.dart';
import 'package:edumate/core/models/intro_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class IntroPages extends StatefulWidget {
  const IntroPages({super.key});

  @override
  State<IntroPages> createState() => _IntroPagesState();
}

class _IntroPagesState extends State<IntroPages> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  final List<IntroPageModel> introPages = [
    IntroPageModel(
      image: Constants.introImg1,
      title: "Welcome to EDUMATE 👋!",
      body:
          "Your smart academic companion for organized learning, smooth communication, and a better university experience.",
    ),
    IntroPageModel(
      image: Constants.introImg2,
      title: "Stay Organized 📚",
      body:
          "Keep track of your assignments, deadlines, and important dates with our intuitive calendar and task management tools.",
    ),
    IntroPageModel(
      image: Constants.introImg3,
      title: "Connect Easily 💬",
      body:
          "Communicate seamlessly with your professors and classmates through our integrated messaging system.",
    ),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: introPages.length,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            itemBuilder: (context, index) {
              final page = introPages[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(page.image, height: 300),
                  const SizedBox(height: 30),
                  Text(
                    page.title,
                    textAlign: TextAlign.center,
                    style: Fonts.headingStyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      page.body,
                      textAlign: TextAlign.center,
                      style: Fonts.normalgreystyle,
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            right: 16,
            top: 50,
            child: TextButton(
              onPressed: () {
                pageController.jumpToPage(2);
              },
              child: Text("Skip"),
            ),
          ),

          /// Bottom controls
          Positioned(
            left: 24,
            right: 24,
            bottom: 30,
            child: Row(
              children: [
                DotsIndicator(
                  dotsCount: introPages.length,
                  position: currentIndex.toDouble(),
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(35.0, 9.0),
                    activeColor: Colors.blueAccent,
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.blueAccent),
                      ),
                    ),
                  ),
                  onPressed: _onNextPressed,
                  child: Text(
                    currentIndex == introPages.length - 1 ? "Start" : "Next >",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onNextPressed() {
    if (currentIndex < introPages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go(GoRoutes.loginpage);

    }
  }
}
