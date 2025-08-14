import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_bloc.dart';
import 'package:learning_management/features/subject_details/presentation/widgets/html_viewer_widget.dart';
import 'package:learning_management/widgets/circle_loading.dart';
import 'package:learning_management/widgets/empty_widget.dart';

class ContentTabView extends StatelessWidget {
  const ContentTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectDetailsBloc, SubjectDetailsState>(
      builder: (context, state) {
        if(state.status.isLoading){
          return CircleLoadingWidget();
        }else if(state.status.isSuccess && (state.lessionDetailsEntity?.lessionDetails?.content).isNotNullAndNotEmpty){
          return HtmlViewerWidget(
              content: state.lessionDetailsEntity?.lessionDetails?.content ?? ""
          );
        }else{
          return EmptyWidget(
              title: "No content found!",
              message: "Content is not available in this lession."
          );
        }
      },
    );
  }
}
