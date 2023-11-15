import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:login_flutter_app/src/constants/colors.dart';
import 'package:login_flutter_app/src/constants/image_strings.dart';
import 'package:login_flutter_app/src/constants/text_strings.dart';
import 'package:login_flutter_app/src/features/authentication/models/on_boarding_model.dart';
import 'package:login_flutter_app/src/features/authentication/screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // variables globales para la pantalla
  final controller = LiquidController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // variables del Widget
    final Size sizeScreen = MediaQuery.of(context).size;

    final pages = [
      OnBoardingPageWidget(
        model: OnBoardingModel(
          imagen: tOnBoardingImage1,
          title: tOnBoardingTitle1,
          subtitle: tOnBoardingSubTitle1,
          counterText: tOnBoardingCounter1,
          height: sizeScreen.height,
          bgColor: tOnBoardingPage1Color,
        ),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
          imagen: tOnBoardingImage2,
          title: tOnBoardingTitle2,
          subtitle: tOnBoardingSubTitle2,
          counterText: tOnBoardingCounter2,
          height: sizeScreen.height,
          bgColor: tOnBoardingPage2Color,
        ),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
          imagen: tOnBoardingImage3,
          title: tOnBoardingTitle3,
          subtitle: tOnBoardingSubTitle3,
          counterText: tOnBoardingCounter3,
          height: sizeScreen.height,
          bgColor: tOnBoardingPage3Color,
        ),
      ),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          LiquidSwipe(
            pages: pages,
            enableSideReveal: true,
            liquidController: controller,
            onPageChangeCallback: onPageChangedCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
          ),
          btnSaltarPantalla(),
          btnSiguientePagina(),
          Positioned(
            bottom: 10,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: 3,
              effect: const WormEffect(
                activeDotColor: Color(0xFF272727),
                dotHeight: 5.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //* ------------------------------------------------------------ WIDGETS ------------------------------------------------------------*//
  Widget btnSaltarPantalla() {
    return Positioned(
      top: 50,
      right: 20,
      child: TextButton(
        onPressed: () => controller.jumpToPage(page: 2),
        child: const Text("Saltar", style: TextStyle(color: Colors.grey)),
      ),
    );
  }

  Widget btnSiguientePagina() {
    return Positioned(
      bottom: 60.0,
      child: OutlinedButton(
        onPressed: () {
          int nextPage = controller.currentPage + 1;
          controller.animateToPage(page: nextPage);
        },
        style: ElevatedButton.styleFrom(
          side: const BorderSide(color: Colors.black26),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(15),
          foregroundColor: Colors.white,
        ),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            color: Color(0xFF272727),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }

  //* ------------------------------------------------------------ METODOS ------------------------------------------------------------*//
  void onPageChangedCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
