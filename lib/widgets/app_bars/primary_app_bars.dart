import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';

class PrimaryAppBar extends StatelessWidget {
  const PrimaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingH20,
      child: Row(
        children: [

          SvgPicture.asset(
            "assets/icons/avatar_icon.svg",
          ),

          gap12,

          Column(
            children: [

              Row(
                children: [
                  Icon(Icons.sunny, color: AppColors.blueLight),

                  gap4,

                  Text(
                    "Good Morning".toUpperCase(),
                    style: AppTextStyles.titleMedium.copyWith(
                        color: AppColors.blueLight,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),

              Text(
                "Madelyn Dias",
                style: AppTextStyles.titleLarge.copyWith(
                    color: AppColors.blueLight
                ),
              )
            ],
          ),


          const Spacer(),


          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/menu_icon.svg"
              )
          )

        ],
      ),
    );
  }
}
