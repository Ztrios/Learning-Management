import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/widgets/network_image_widget.dart';

class MaterialsItemView extends StatelessWidget {
  const MaterialsItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Column(
        children: [

          gap6,

          Row(
            children: [

              NetworkImageWidget(
                "https://i.ytimg.com/vi/NcoRlvM1dmg/sddefault.jpg",
                width: 130.w,
                height: 80.h,
                showPlayButton: true,
              ),

              gap12,

              Column(
                crossAxisAlignment: crossStart,
                children: [
                  Text(
                    "Integration Formula",
                    style: AppTextStyles.titleSmall.copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.textPrimary
                    ),
                  ),

                  Text(
                    "Lecture by Susant Kumar",
                    style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary
                    ),
                  ),

                  Text(
                    "2:34",
                    style: AppTextStyles.caption,
                  )

                ],
              )

            ],
          ),

          gap6
        ],
      ),
    );
  }
}
