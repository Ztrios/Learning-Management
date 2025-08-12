import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ResultsGraphLoading extends StatelessWidget {
  const ResultsGraphLoading({super.key});

  @override
  Widget build(BuildContext context) {

    final dummyResults = const [
      DummyResult(subject: "English", marks: 70, color: Colors.red),
      DummyResult(subject: "Bangla", marks: 50, color: Colors.yellow),
      DummyResult(subject: "Geography", marks: 63, color: Colors.pink),
      DummyResult(subject: "History", marks: 55, color: Colors.white),
    ];

    return Skeletonizer(
      enabled: true,
      child: Container(
        width: 1.sw,
        padding: padding24,
        decoration: BoxDecoration(
          borderRadius: radius16,
          color: AppColors.deepGreen,
        ),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Row(
              spacing: 15.w,
              children: [
                SvgPicture.asset("assets/icons/graph_icon.svg"),
                Text(
                  "Result graph",
                  style: AppTextStyles.headlineSmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            gap6,
            Text(
              "The student's academic results by subject",
              style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
            ),
            gap6,
            _StaticBarChart(results: dummyResults), // 👈 Fake chart that looks real
          ],
        ),
      ),
    );
  }
}

class _StaticBarChart extends StatelessWidget {
  final List<DummyResult> results;
  const _StaticBarChart({required this.results});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Row(
        crossAxisAlignment: crossEnd,
        mainAxisAlignment: mainSpaceEven,
        children: results.map((res) {
          final heightFactor = res.marks / 100; // Scale based on marks
          return Column(
            mainAxisAlignment: mainEnd,
            children: [
              Container(
                width: 40.w,
                height: 240.h * heightFactor,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  borderRadius: radius8,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                res.subject,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class DummyResult {
  final String subject;
  final int marks;
  final Color color;

  const DummyResult({
    required this.subject,
    required this.marks,
    required this.color,
  });
}

