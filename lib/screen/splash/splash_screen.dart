import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_coach/screen/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      dispose: (c) => Get.delete<SplashController>(),
      builder: (ctr) {
        return Scaffold(body: mainView(ctr));
      },
    );
  }

  mainView(SplashController ctr) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
