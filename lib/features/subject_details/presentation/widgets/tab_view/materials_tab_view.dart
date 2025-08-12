import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/core/helpers/helpers.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_bloc.dart';
import 'package:learning_management/features/subject_details/presentation/widgets/item_view/materials_item_view.dart';
import 'package:learning_management/features/subject_details/presentation/widgets/pdf_viewer_widget.dart';
import 'package:learning_management/features/subject_details/presentation/widgets/video_player_widget.dart';

class MaterialsTabView extends StatelessWidget {
  const MaterialsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectDetailsBloc, SubjectDetailsState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.lessionDetailsEntity?.lessionDetails?.attachments?.length ?? 0,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Helpers.launchUri(uri: state.lessionDetailsEntity!.lessionDetails!.attachments![index]);
                  // if (index.isEven) {
                  //   Navigator.push(context, MaterialPageRoute(
                  //       builder: (context) => VideoPlayerWidget()));
                  // } else {
                  //   Navigator.push(context, MaterialPageRoute(
                  //       builder: (context) => PdfViewerWidget()));
                  // }
                },
                child: MaterialsItemView(
                  title: state.lessionDetailsEntity!.lessionDetails!.attachments![index],
                )
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        );
      },
    );
  }
}
