import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter_app/src/constants/colors.dart';
import 'package:login_flutter_app/src/constants/image_strings.dart';
import 'package:login_flutter_app/src/constants/sizes.dart';
import 'package:login_flutter_app/src/constants/text_strings.dart';

import '../../controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  //? -- USO DEL CONTROLADOR DEL SPLASH -- ?//
  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            splashTopIcon(),
            splashTitle(context),
            splashImage(),
            splashYellowPoint(),
          ],
        ),
      ),
    );
  }

  //* -------------------------------- WIDGETS -------------------------------- *//
  Widget splashTopIcon() {
    return Obx(
      () => AnimatedPositioned(
        duration: const Duration(milliseconds: 1600),
        top: (splashController.animate.value) ? 0 : -30,
        left: (splashController.animate.value) ? 0 : -30,
        width: 80,
        child: const Image(
          image: AssetImage(tSplashTopIcon),
        ),
      ),
    );
  }

  Widget splashTitle(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: const Duration(milliseconds: 1600),
        top: 80,
        left: (splashController.animate.value) ? tDefaultSize : -80,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 1600),
          opacity: (splashController.animate.value) ? 1 : 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(tAppName, style: Theme.of(context).textTheme.headlineSmall),
              Text(tAppTagLine, style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
        ),
      ),
    );
  }

  Widget splashImage() {
    return Obx(
      () => AnimatedPositioned(
        duration: const Duration(milliseconds: 2100),
        right: (splashController.animate.value) ? 0 : -60,
        bottom: 100,
        width: 400,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 2000),
          opacity: (splashController.animate.value) ? 1 : 0,
          child: const Image(image: AssetImage(tSplashImage)),
        ),
      ),
    );
  }

  Widget splashYellowPoint() {
    return Obx(
      () => AnimatedPositioned(
        duration: const Duration(milliseconds: 2100),
        bottom: (splashController.animate.value) ? 60 : 0,
        right: tDefaultSize,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 2000),
          opacity: (splashController.animate.value) ? 1 : 0,
          child: Container(
            width: tSplashContainerSize,
            height: tSplashContainerSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: tPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
