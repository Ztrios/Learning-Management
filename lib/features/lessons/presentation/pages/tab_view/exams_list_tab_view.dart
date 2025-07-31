import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/helpers/format_data/datetime_formatters.dart';
import 'package:learning_management/core/helpers/toast_notification/toast_notifications.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/features/lessons/data/models/exams_list_model.dart';
import 'package:learning_management/features/lessons/presentation/bloc/lessions_bloc.dart';
import 'package:learning_management/features/lessons/presentation/pages/exams_submission_page.dart';
import 'package:learning_management/features/lessons/presentation/pages/lessions_page.dart';
import 'package:learning_management/features/lessons/presentation/widgets/item_view/exams_item_view.dart';
import 'package:learning_management/features/lessons/presentation/widgets/loading/lessions_list_loading.dart';
import 'package:learning_management/widgets/empty_widget.dart';

class ExamListTabView extends StatelessWidget {
  const ExamListTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessionsBloc, LessionsState>(
      builder: (context, state) {
        if(state.status.isLoading){
          return LessionsListLoading();
        }else if(state.status.isSuccess && (state.examsListEntity?.exams).isNotNullAndNotEmpty){
          return ListView.builder(
            itemCount: state.examsListEntity?.exams?.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {

              Exam exam = state.examsListEntity!.exams![index];

              return InkWell(
                onTap: () {
                  if(exam.status != "SUBMITTED"){
                    context.push("${LessionsPage.path}${ExamsSubmissionPage.path}/${exam.id}");
                  }else{
                    ToastNotifications.showErrorToast(
                        title: "Submitted Exam!",
                        message: "Your exam is already submitted.",
                    );
                  }
                },
                child: ExamItemView(
                  showStar: false,
                  isCompleted: exam.status == "SUBMITTED",
                  title: exam.title ?? "",
                  totalMarks: exam.marks ?? 0,
                  getMarks: exam.earnedMarks ?? 0,
                  examDate: DateTimeFormatters.formatDateV2(dateTime: exam.examDate),
                  startTime: DateTimeFormatters.formatLocalTime(exam.startTime?? ""),
                  endTime: DateTimeFormatters.formatLocalTime(exam.endTime?? ""),
                ),
              );
            },
          );


        }else{
          return EmptyWidget(
              title: "No Exams Found!",
              message: "Exams are not available at this moment."
          );
        }
      },
    );
  }
}
