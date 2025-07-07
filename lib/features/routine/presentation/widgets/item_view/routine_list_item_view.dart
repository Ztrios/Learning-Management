import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';

class RoutineListItemView extends StatelessWidget {
  const RoutineListItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              Text(
                "11:35",
                style: AppTextStyles.titleMedium,
              ),

              Text(
                "13:05",
                style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.textGreyLight
                ),
              ),
            ],
          ),


          gap12,

          Container(
            width: 1.w,
            color: AppColors.grey,
          ),

          gap12,


          Expanded(
            child: Container(
              width: 1.sw,
              margin: paddingBottom20,
              padding: padding12,
              decoration: BoxDecoration(
                  color: AppColors.deepOrange,
                  borderRadius: radius16
              ),
              child: Column(
                crossAxisAlignment: crossStart,
                children: [

                  Row(
                    mainAxisAlignment: mainSpaceBetween,
                    children: [
                      Text(
                        "Mathematics",
                        style: AppTextStyles.titleLarge.copyWith(
                            color: Colors.white
                        ),
                      ),

                      IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.more_vert,color: Colors.white,)
                      )


                    ],
                  ),

                  Text(
                    "Chapter 1: Introduction",
                    style: AppTextStyles.bodyLarge.copyWith(
                        color: Colors.white
                    ),
                  ),

                  gap12,

                  Row(
                    children: [

                      Icon(Icons.my_location, color: Colors.white),

                      gap12,

                      Text(
                        "Zoom ID: 3346566",
                        style: AppTextStyles.caption.copyWith(
                            color: Colors.white
                        ),
                      )

                    ],
                  ),

                  gap12,

                  Row(
                    children: [

                      CircleAvatar(
                        radius: 12.r,
                        backgroundImage: NetworkImage(
                          "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg",
                        ),
                      ),

                      gap10,

                      Text(
                        "Julie Watson",
                        style: AppTextStyles.caption.copyWith(
                            color: Colors.white
                        ),
                      )

                    ],
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
