import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';

class ProgressTabBar extends HookWidget {
  final int selectedIndex;
  final List<String> tabs;
  final Function(int value) onChanged;
  const ProgressTabBar({
    super.key,
    required this.selectedIndex,
    required this.tabs,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 80.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: crossCenter,
        children: List.generate(tabs.length, (index) {
          final isActive = selectedIndex == index;
          return Padding(
            padding: padding24,
            child: InkResponse(
              onTap: () => onChanged(index),
              splashColor: AppColors.blueLight,
              child: Column(
                children: [
                  Text(
                    tabs[index],
                    style: AppTextStyles.titleMedium.copyWith(
                      color: isActive ? AppColors.blueLight : AppColors.textGrey,
                    ),
                  ),
                  if (isActive)
                    CircleAvatar(
                      radius: 5.r,
                      backgroundColor: AppColors.blueLight,
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}