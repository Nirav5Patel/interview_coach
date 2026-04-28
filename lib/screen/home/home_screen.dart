import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_coach/base_class/base_text.dart';
import 'package:interview_coach/constant/color_res.dart';
import 'package:interview_coach/screen/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      dispose: (c) => Get.delete<HomeController>(),
      builder: (ctr) {
        return Scaffold(body: mainView(ctr));
      },
    );
  }

  mainView(HomeController ctr) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseText(
                text: "User Name",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.history)),
            ],
          ),
        ),

        Row(children: [
          startCard(label: "Session", value:"totalSession", color: const Color(0xFF534AB7)),
          SizedBox(width: 10,),
          startCard(label: "Avg Score", value:"averageScore", color: const Color(0xFF534AB7)),
          SizedBox(width: 10,),
          startCard(label: "Best", value:"bestScore", color: const Color(0xFF534AB7)),

        ],) ,


        
      ],
    );
  }

  startCard({
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color.withOpacity(0.12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          BaseText(
            text: value,
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: color,
          ),
          SizedBox(height: 4),
          BaseText(
            text: label,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: ColorRes.whiteColor.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
