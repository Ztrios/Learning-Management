import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/lessons/presentation/widgets/submission_types_selection.dart';

class FilesUploadWidget extends HookWidget {
  const FilesUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final fileTypeIsPDF = useState<bool>(true);

    return DeferredPointerHandler(
      child: Column(
        children: [

          SubmissionTypeSelection(
            onChanged: (int index) => fileTypeIsPDF.value = index == 0,
          ),

          gap24,

          Row(
            children: [

              if(!fileTypeIsPDF.value)
              Expanded(
                child: Container(
                  width: 1.sw,
                  height: 110.h,
                  decoration: BoxDecoration(
                      borderRadius: radius6,
                      border: Border.all(
                          width: 1.w,
                          color: AppColors.deepOrange
                      )
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [

                      Image.network(
                        "https://www.studiestoday.com/sites/default/files/images16/Revision%20Worksheet%20Class%206%20Mathematics_2.PNG",
                        width: 1.sw,
                        height: 1.sh,
                      ),


                      CircleAvatar(
                        backgroundColor: AppColors.deepOrange,
                        child: Text(
                          "20",
                          style: AppTextStyles.titleSmall.copyWith(
                              color: Colors.white
                          ),
                        ),
                      ),

                      Positioned(
                        top: -15,
                        right: -15,
                        child: DeferPointer(
                          child: InkWell(
                            onTap: (){
                            },
                            child: CircleAvatar(
                              radius: 14.sp,
                              backgroundColor: AppColors.deepOrange,
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )


                    ],
                  ),
                ),
              ),

              if(!fileTypeIsPDF.value) gap12,

              Expanded(
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    width: 1.sw,
                    height: 110.h,
                    decoration: BoxDecoration(
                        borderRadius: radius6,
                        border: Border.all(
                            width: 1.w,
                            color: AppColors.deepOrange
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: mainCenter,
                      crossAxisAlignment: crossCenter,
                      children: [

                        Icon(
                          Icons.add,
                          size: 45.sp,
                          color: AppColors.deepOrange,
                        ),

                        Text(
                          "Click to Upload Photo",
                          style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textPrimary
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
