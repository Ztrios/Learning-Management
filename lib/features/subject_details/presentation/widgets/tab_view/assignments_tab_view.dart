import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/features/subject_details/data/models/assignment_list_model.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_bloc.dart';
import 'package:learning_management/features/subject_details/presentation/pages/assignment_submission_page.dart';
import 'package:learning_management/features/subject_details/presentation/pages/lession_details_page.dart';
import 'package:learning_management/features/subject_details/presentation/pages/subject_details_page.dart';
import 'package:learning_management/features/subject_details/presentation/widgets/item_view/assignments_item_view.dart';
import 'package:learning_management/features/subject_details/presentation/widgets/loading/lessions_list_loading.dart';
import 'package:learning_management/widgets/empty_widget.dart';

class AssignmentsTabView extends StatelessWidget {
  const AssignmentsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectDetailsBloc, SubjectDetailsState>(
      builder: (context, state) {
        if(state.status.isLoading){
          return LessionsListLoading();
        }else if(state.status.isSuccess && (state.assignmentListEntity?.assignments).isNotNullAndNotEmpty){
          return ListView.builder(
              itemCount: state.assignmentListEntity?.assignments?.length,
              itemBuilder: (context, index) {

                Assignment assignment = state.assignmentListEntity!.assignments![index];

                return InkWell(
                  onTap: (){
                    if(assignment.status != "SUBMITTED"){
                      context.push("${SubjectDetailsPage.path}${LessionDetailsPage.path}/null${AssignmentSubmissionPage.path}/${assignment.id}");
                    }
                  },
                  child: AssignmentItemView(
                    title: assignment.title ?? "",
                    totalMarks: assignment.totalMarks ?? 0,
                    getMarks: assignment.earnedMarks ?? 0,
                    isCompleted: assignment.status == "SUBMITTED",
                    status: assignment.status ?? "UPCOMING",
                  ),
                );
              }
          );
        }else{
          return EmptyWidget(
            title: "No Assignments found!",
            message: "Assignments are not available at this moment."
          );
        }
      },
    );
  }
}
