import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_coach/screen/user/user_controller.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        init: UserController(),
        dispose: (c)=>Get.delete<UserController>(),
        builder: (ctr){
      return Scaffold(
        body: mainView(ctr),
      );
    });
  }

  mainView(UserController ctr){
    return Column(
      children: [

      ],
    );
  }
}
