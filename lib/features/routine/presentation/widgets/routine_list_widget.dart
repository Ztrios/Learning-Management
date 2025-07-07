import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/routine/presentation/widgets/item_view/routine_list_item_view.dart';

class RoutineListWidget extends StatelessWidget {
  const RoutineListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          children: [

            Text(
              "Time",
              style: AppTextStyles.titleSmall.copyWith(
                  color: AppColors.textGreyLight,
                  fontWeight: FontWeight.w900
              ),
            ),

            gap24,

            Expanded(
              child: Row(
                mainAxisAlignment: mainSpaceBetween,
                children: [

                  Text(
                    "Courses",
                    style: AppTextStyles.titleSmall.copyWith(
                        color: AppColors.textGreyLight,
                        fontWeight: FontWeight.w900
                    ),
                  ),


                  IconButton(
                      onPressed: (){},
                      icon: SvgPicture.asset(
                        "assets/icons/filter_icon.svg",
                        width: 30.w,
                      )
                  )
                ],
              ),
            )

          ],
        ),

        Expanded(
          child: ListView.builder(
            itemCount: 10,
              itemBuilder: (context, index){
                return RoutineListItemView();
              }
          ),
        )


      ],
    );
  }
}

