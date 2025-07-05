import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';

class ProgressIndicatorCircle extends StatelessWidget {
  final bool isForExam;
  final int percantage;
  final String message;
  final Color progressColor;
  const ProgressIndicatorCircle({
    super.key,
    required this.isForExam,
    required this.percantage,
    required this.message,
    required this.progressColor
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 160.w,
          height: 160.w,
          child: TweenAnimationBuilder(
            tween: IntTween(begin: 0, end: percantage),
            duration: Duration(seconds: 1),
            builder: (context,value, child) {
              return CircularProgressIndicator(
                value: value / 100,
                strokeWidth: 12.w,
                color: progressColor,
                backgroundColor: Colors.white,
                strokeCap: StrokeCap.round,
              );
            },
          ),
        ),
        Column(
          children: [
            TweenAnimationBuilder(
              tween: IntTween(begin: 0, end: percantage),
              duration: Duration(seconds: 1),
              builder: (context,value,child) {
                return RichText(
                  text: TextSpan(
                    text: value.toString(),
                    style: AppTextStyles.displaySmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isForExam ? Colors.white : null
                    ),
                    children: [
                      TextSpan(
                        text: "/100",
                        style: AppTextStyles.titleMedium.copyWith(
                          fontWeight: FontWeight.w900,
                          color: isForExam ? Colors.white : AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
            Text(
              message,
              style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.greyLight
              ),
            ),
          ],
        ),
      ],
    );
  }
}