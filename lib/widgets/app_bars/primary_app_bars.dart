import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/home/presentation/pages/home_page.dart';
import 'package:learning_management/features/notifications/presentation/pages/notifications_page.dart' show NotificationsPage;
import 'package:learning_management/features/profile/presentation/pages/student_profile_page.dart';

class PrimaryAppBar extends StatelessWidget {
  const PrimaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingH20,
      child: Row(
        children: [

          InkWell(
            onTap: ()=> context.push(StudentProfilePage.path),
            child: SvgPicture.asset(
              "assets/icons/avatar_icon.svg",
            ),
          ),

          gap12,

          Column(
            crossAxisAlignment: crossStart,
            children: [

              Row(
                children: [
                  Icon(Icons.sunny, color: AppColors.blueLight),

                  gap4,

                  Text(
                    "Good Morning".toUpperCase(),
                    style: AppTextStyles.titleSmall.copyWith(
                        color: AppColors.blueLight,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),

              Text(
                "Madelyn Dias",
                style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.blueLight
                ),
              )
            ],
          ),


          const Spacer(),

          IconButton(
              onPressed: ()=> context.push(NotificationsPage.path),
              icon: Icon(
                Icons.notifications,
                size: 30.sp,
                color: AppColors.deepPurpleAccent
              )
          ),

          gap12,

          Builder(
            builder: (context) {
              return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/menu_icon.svg"
                  )
              );
            }
          )

        ],
      ),
    );
  }
}
