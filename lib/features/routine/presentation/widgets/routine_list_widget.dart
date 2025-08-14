import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/helpers/format_data/datetime_formatters.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/routine/data/models/class_routine_model.dart';
import 'package:learning_management/features/routine/presentation/bloc/routine_bloc.dart';
import 'package:learning_management/features/routine/presentation/widgets/item_view/routine_list_item_view.dart';
import 'package:learning_management/features/routine/presentation/widgets/loading_widget/class_routines_loading_widget.dart';
import 'package:learning_management/widgets/empty_widget.dart';
import 'package:learning_management/widgets/error_widget/error_widget.dart';

class RoutineListWidget extends StatelessWidget {
  const RoutineListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        

        Expanded(
          child: BlocBuilder<RoutineBloc, RoutineState>(
            builder: (context, state) {
              if(state.status.isLoading){
                return ClassRoutinesLoadingWidget();
              }else if(state.status.isSuccess && (state.classRoutineEntity?.classData?.classSchedule).isNotNullAndNotEmpty){
                return ListView.builder(
                    itemCount: state.classRoutineEntity?.classData?.classSchedule?.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {

                      ClassSchedule classSchedule = state.classRoutineEntity!.classData!.classSchedule![index];

                      return RoutineListItemView(
                        isActive: true,
                        startTime: DateTimeFormatters.formatLocalTime(classSchedule.startTime ?? ""),
                        endTime: DateTimeFormatters.formatLocalTime(classSchedule.endTime ?? ""),
                        subject: classSchedule.classInfo?.subject ?? "Not Found",
                        topic: classSchedule.classInfo?.className ?? "Not Found",
                        meetingId: state.classRoutineEntity?.classData?.meetingId ?? "Not Found!",
                        meetingPassword: state.classRoutineEntity?.classData?.meetingPass ?? "Not Found!",
                        meetingLink: state.classRoutineEntity?.classData?.meetingLink ?? "Not Found!",
                        teacherName: classSchedule.classInfo?.instructor ?? "Not Found",
                      );
                    }
                );
              }else {
                return EmptyWidget(
                  title: "No Class Found!",
                  message: "Class is not available at this moment",
                );
              }
            },
          ),
        )


      ],
    );
  }
}

