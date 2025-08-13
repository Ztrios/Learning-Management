import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';

class ProgressIndicatorCircle extends StatelessWidget {
  final bool isForQuiz;
  final int percentage;
  final String message;
  final Color progressColor;
  const ProgressIndicatorCircle({
    super.key,
    required this.isForQuiz,
    required this.percentage,
    required this.message,
    required this.progressColor
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 130.w,
          height: 130.w,
          child: TweenAnimationBuilder(
            tween: IntTween(begin: 0, end: percentage),
            duration: Duration(seconds: 1),
            builder: (context,value, child) {
              return CircularProgressIndicator(
                value: value / 100,
                strokeWidth: 10.w,
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
              tween: IntTween(begin: 0, end: percentage),
              duration: Duration(seconds: 1),
              builder: (context,value,child) {
                return RichText(
                  text: TextSpan(
                    text: value.toString(),
                    style: AppTextStyles.displaySmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isForQuiz == false ? Colors.white : null
                    ),
                    children: [
                      TextSpan(
                        text: "/100",
                        style: AppTextStyles.titleMedium.copyWith(
                          fontWeight: FontWeight.w900,
                          color: isForQuiz == false ? Colors.white : AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
            Text(
              message,
              style: AppTextStyles.bodySmall.copyWith(
                  color: isForQuiz == true ? AppColors.greyLight : Colors.white
              ),
            ),
          ],
        ),
      ],
    );
  }
}