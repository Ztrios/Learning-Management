import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';

class OnboardingPageData {
  final String title;
  final String description;
  final String svgImage;

  OnboardingPageData({
    required this.title,
    required this.description,
    required this.svgImage,
  });
}

class OnboardingPageView extends StatelessWidget {
  final List<OnboardingPageData> pages;
  final PageController controller;
  final void Function(int index)? onPageChanged;

  const OnboardingPageView({
    super.key,
    required this.pages,
    required this.controller,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: pages.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        final page = pages[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              page.svgImage,
              width: 300.w,
              height: 300.w,
            ),

            gap48,

            Text(
              page.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            gap16,

            Text(
              page.description,
              style: AppTextStyles.caption,
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
