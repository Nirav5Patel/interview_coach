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

        if (user.recentScores.length >= 2) ...[
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.04),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BaseText(text: "Score trend",fontSize: 13,fontWeight: FontWeight.w700,color: Colors.white,),
                    const Spacer(),

                   BaseText(text: user.isImproving ? '↑ Improving' : '↓ Needs work',fontSize: 12,color:user.isImproving
                       ? const Color(0xFF1D9E75)
                       : const Color(0xFFD85A30 ,)
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 80,
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(show: false),
                      titlesData: const FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: user.recentScores
                              .asMap()
                              .entries
                              .map((e) => FlSpot(
                              e.key.toDouble(),
                              e.value.toDouble()))
                              .toList(),
                          isCurved: true,
                          color: const Color(0xFF9C9AFF),
                          barWidth: 2.5,
                          dotData: const FlDotData(show: true),
                          belowBarData: BarAreaData(
                            show: true,
                            color: const Color(0xFF534AB7)
                                .withOpacity(0.15),
                          ),
                        ),
                      ],
                      minY: 0,
                      maxY: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],

        const SizedBox(height: 28),

        // ── Pick role ─────────────────────────────────────────────
        BaseText(text: "Practice role",fontSize: 13,fontWeight: FontWeight.w500,color:ColorRes.whiteColor,),


        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: roles.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (_, i) {
              final role = roles[i];
              return Obx(() {
                final isSelected = selectedRole.value == role['label'];
                return GestureDetector(
                  onTap: () => selectedRole.value = role['label'],
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF534AB7)
                          : Colors.white.withOpacity(0.07),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child:
                    BaseText(text: '${role['icon']} ${role['label']}',fontSize: 13,fontWeight: FontWeight.w500,color:  isSelected
                        ? Colors.white
                        : Colors.white60,)
                  ),
                );
              });
            },
          ),
        ),

        const SizedBox(height: 20),

        // ── Pick difficulty ───────────────────────────────────────

        BaseText(text:"Difficulty",fontSize: 13,fontWeight: FontWeight.w600,color: ColorRes.whiteColor, ),

        const SizedBox(height: 10),
        Row(
          children: difficulties.map((d) {
            final colors = {
              'Entry': const Color(0xFF1D9E75),
              'Mid': const Color(0xFFEF9F27),
              'Senior': const Color(0xFFD85A30),
            };
            return Expanded(
              child: Obx(() {
                final isSelected = selectedDifficulty.value == d;
                return GestureDetector(
                  onTap: () => selectedDifficulty.value = d,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? colors[d]!.withOpacity(0.2)
                          : Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected
                            ? colors[d]!
                            : Colors.transparent,
                      ),
                    ),
                    child:
                    BaseText(text:d,fontSize: 13,fontWeight: FontWeight.w600,color:isSelected
                        ? colors[d]!
                        : Colors.white54 , )
                  ),
                );
              }),
            );
          }).toList(),
        ),

        const SizedBox(height: 36),

        // ── Start button ──────────────────────────────────────────
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              _interviewController.startSession(
                role: selectedRole.value,
                difficulty: selectedDifficulty.value,
              );
              Get.toNamed('/interview');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF534AB7),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              elevation: 0,
            ),
            child:
            BaseText(text: 'Start Interview (5 questions) →',fontSize: 15,fontWeight: FontWeight.w600,color: ColorRes.whiteColor,),
          ),
        ),

        const SizedBox(height: 20),

        
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
