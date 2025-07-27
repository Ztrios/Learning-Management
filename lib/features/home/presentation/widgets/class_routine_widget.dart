import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/helpers/format_data/datetime_formatters.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/home/presentation/bloc/home_bloc.dart';
import 'package:learning_management/features/home/presentation/bloc/home_event.dart';
import 'package:learning_management/features/home/presentation/widgets/item_view/teacher_item_view.dart';
import 'package:learning_management/features/home/presentation/widgets/section_header.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/error_widget/error_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ClassRoutineWidget extends HookWidget {
  const ClassRoutineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = useState<double>(150.w);
    final asset = useState<String>("assets/images/teacher.svg");
    final background = useState<Color>(AppColors.deepBlue);

    setRoutineInterface() {
      int index = Random().nextInt(5);
      switch (index) {
        case 0:
          size.value = 150.w;
          background.value = AppColors.deepBlue;
          asset.value = "assets/images/teacher.svg";
        case 1:
          size.value = 120.w;
          asset.value = "assets/images/global_learning.svg";
          background.value = AppColors.deepGreen;
        case 2:
          size.value = 150.w;
          asset.value = "assets/images/exam_scene.svg";
          background.value = AppColors.deepPink;
        case 3:
          size.value = 150.w;
          asset.value = "assets/images/online_learning.svg";
          background.value = AppColors.tealBlue;
        case 4:
          size.value = 150.w;
          asset.value = "assets/images/pdf_learning.svg";
          background.value = AppColors.deepRed;
      }
    }

    void getTodaysClass() async {
      int? sectionId = context
          .read<AuthBloc>()
          .state
          .signInEntity
          ?.signInData
          ?.sectionId;
      if (sectionId != null) {
        context.read<HomeBloc>().add(
            GetTodaysClass(sectionId: sectionId.toString()));
      }
    }

    useEffect(() {
      Future.microtask(() {
        setRoutineInterface();
        getTodaysClass();
      });
      return null;
    }, []);

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if(state.status.isLoading || state.status.isSuccess){
          return Skeletonizer(
            enabled: state.status.isLoading,
            child: Column(
              children: [

                SectionHeader(title: "Today's Class"),

                gap8,

                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 1.sw,
                      height: 210.h,
                      padding: padding16,
                      decoration: BoxDecoration(
                          borderRadius: radius16,
                          color: background.value
                      ),
                      child: Column(
                        crossAxisAlignment: crossStart,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: crossStart,
                                children: [
                                  Text(
                                    (state.todaysClassEntity?.classData?.classSchedule).isNotNullAndNotEmpty ?
                                        state.todaysClassEntity!.classData!.classSchedule![0].classInfo!.className!
                                        : "Not Found",
                                    style: AppTextStyles.titleSmall.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),

                                  Text(
                                    (state.todaysClassEntity?.classData?.classSchedule).isNotNullAndNotEmpty ?
                                    state.todaysClassEntity!
                                        .classData!
                                        .classSchedule!
                                        .map((classSchedule) =>
                                    classSchedule.classInfo?.subject)
                                        .toList()
                                        .join("&") : "Not Found",
                                    style: AppTextStyles.caption.copyWith(
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                              ),

                              Container(
                                padding: padding4,
                                decoration: BoxDecoration(
                                    borderRadius: radius8,
                                    color: AppColors.lightOrange
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                        Icons.alarm,
                                        color: background.value
                                    ),

                                    gap4,

                                    Text(
                                      DateTimeFormatters.formatLocalTime(
                                          state.todaysClassEntity?.classData
                                              ?.startTime ?? "03:04:35"),
                                      style: AppTextStyles.titleSmall.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: background.value
                                      ),
                                    ),
                                  ],
                                ),
                              )

                            ],
                          ),


                          gap24,

                          Text(
                            "Zoom ID : ${state.todaysClassEntity?.classData?.meetingId ?? "Not Found"}",
                            style: AppTextStyles.caption.copyWith(
                                color: Colors.white
                            ),
                          ),

                          Text(
                            "Password : ${state.todaysClassEntity?.classData?.meetingPass ?? "Not Found"}",
                            style: AppTextStyles.caption.copyWith(
                                color: Colors.white
                            ),
                          ),

                          gap12,

                          InkWell(
                            onTap: (){},
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
                                style: AppTextStyles.caption.copyWith(
                                  color: background.value
                                ),
                              ),
                            ),
                          ),

                          const Spacer(),

                          Column(
                            children: (state.todaysClassEntity?.classData?.classSchedule).isNotNullAndNotEmpty ?
                            state.todaysClassEntity!.classData!.classSchedule!.map((classSchedule){
                              return TeacherItemView(
                                iconTextColor: background.value,
                                teacherName: classSchedule.classInfo?.instructor ?? "Sajib Hasan"
                              );
                            }).toList(): [],
                          ),

                        ],
                      ),
                    ),

                    Positioned(
                        bottom: 0,
                        right: -20,
                        child: SvgPicture.asset(
                          asset.value,
                          width: size.value,
                          height: size.value,
                          fit: BoxFit.cover,
                        )
                    ),

                  ],
                ),
              ],
            ),
          );
        }else if(state.status.isError){
          return ErrorViewWidget(
              message: state.message ?? "Not Found!"
          );
        }else{
          return SizedBox.shrink();
        }

      },
    );
  }
}
