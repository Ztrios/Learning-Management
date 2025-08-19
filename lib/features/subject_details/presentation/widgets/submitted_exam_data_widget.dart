import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/core/helpers/helpers.dart';
import 'package:learning_management/features/subject_details/data/models/submitted_exam_model.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_bloc.dart';
import 'package:learning_management/features/subject_details/presentation/widgets/item_view/materials_item_view.dart';

class SubmittedExamDataWidget extends StatelessWidget {
  const SubmittedExamDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectDetailsBloc, SubjectDetailsState>(
      builder: (context, state) {
        final SubmittedExamData? submittedExamData = state.submittedExamEntity?.submittedExamData;
        if(submittedExamData?.fileUrls != null){
          return ListView.builder(
              itemCount: submittedExamData?.fileUrls?.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: ()=> Helpers.launchUri(uri: submittedExamData.fileUrls![index]),
                  child: MaterialsItemView(
                      url: submittedExamData!.fileUrls![index]
                  ),
                );
              }
          );
        }else{
          return SizedBox.shrink();
        }

      },
    );
  }
}
