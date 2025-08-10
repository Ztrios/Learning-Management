import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/helpers/helpers.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/home/presentation/widgets/item_view/teacher_item_view.dart';

class RoutineListItemView extends StatelessWidget {

  final bool isActive;
  final String startTime;
  final String endTime;
  final String subject;
  final String topic;
  final String meetingId;
  final String meetingPassword;
  final String meetingLink;
  final String teacherName;

  const RoutineListItemView({
    super.key,
    required this.isActive,
    required this.startTime,
    required this.endTime,
    required this.subject,
    required this.topic,
    required this.meetingId,
    required this.meetingPassword,
    required this.meetingLink,
    required this.teacherName
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: crossStart,
            children: [
              Text(
                startTime,
                style: AppTextStyles.titleMedium,
              ),

              Text(
                endTime,
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
                  color: isActive ? AppColors.deepOrange : Color(0xFFF6F6F5),
                  borderRadius: radius16
              ),
              child: Column(
                crossAxisAlignment: crossStart,
                children: [

                  Row(
                    mainAxisAlignment: mainSpaceBetween,
                    children: [
                      Text(
                        subject,
                        style: AppTextStyles.titleLarge.copyWith(
                            color: isActive ? Colors.white : null
                        ),
                      ),

                      // IconButton(
                      //     onPressed: (){},
                      //     icon: Icon(
                      //       Icons.more_vert,
                      //       color: isActive ? Colors.white : null,
                      //     )
                      // ),
                      //
                      if(isActive)
                        InkWell(
                          onTap: ()=> Helpers.launchUri(uri: meetingLink),
                          child: Container(
                            width: 85.w,
                            height: 30.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: radius6,
                                color: Colors.white
                            ),
                            child: Text(
                              "Join Class",
                              style: AppTextStyles.caption,
                            ),
                          ),
                        ),

                    ],
                  ),

                  gap6,

                  Text(
                    topic,
                    style: AppTextStyles.bodyLarge.copyWith(
                        color: isActive ? Colors.white : null
                    ),
                  ),

                  gap12,

                  Row(
                    children: [

                      Icon(
                          Icons.my_location,
                          color: isActive ? Colors.white : null
                      ),

                      gap12,

                      Text(
                        "Zoom ID: $meetingId",
                        style: AppTextStyles.caption.copyWith(
                            color: isActive ? Colors.white : null
                        ),
                      ),

                      gap12,

                      InkWell(
                        onTap: ()=> Clipboard.setData(ClipboardData(text: meetingId)),
                          child: Icon(
                              Icons.copy_rounded,
                            color: Colors.white,
                          )
                      )

                    ],
                  ),


                  Row(
                    children: [

                      Icon(
                          Icons.password,
                          color: isActive ? Colors.white : null
                      ),

                      gap12,

                      Text(
                        "Password: $meetingPassword",
                        style: AppTextStyles.caption.copyWith(
                            color: isActive ? Colors.white : null
                        ),
                      ),

                      gap12,

                      InkWell(
                          onTap: ()=> Clipboard.setData(ClipboardData(text: meetingPassword)),
                          child: Icon(
                            Icons.copy_rounded,
                            color: Colors.white,
                          )
                      )

                    ],
                  ),

                  gap12,

                  Row(
                    children: [
                      TeacherItemView(
                          teacherName: teacherName,
                          iconTextColor: isActive ? Colors.deepOrange : AppColors.textPrimary,
                          nameTextColor: !isActive ? AppColors.textPrimary : null
                      ),

                      const Spacer(),


                      gap12,

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
