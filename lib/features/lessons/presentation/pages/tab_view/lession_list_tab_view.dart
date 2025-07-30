import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/features/lessons/presentation/bloc/lessions_bloc.dart';
import 'package:learning_management/features/lessons/presentation/pages/lession_details_page.dart';
import 'package:learning_management/features/lessons/presentation/pages/lessions_page.dart';
import 'package:learning_management/features/lessons/presentation/widgets/item_view/lession_item_view.dart';
import 'package:learning_management/features/lessons/presentation/widgets/loading/lessions_list_loading.dart';
import 'package:learning_management/features/lessons/data/models/lessions_list_model.dart';
import 'package:learning_management/widgets/empty_widget.dart';

class LessionListTabView extends HookWidget {
  const LessionListTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessionsBloc, LessionsState>(
      builder: (context, state) {

        if(state.status.isLoading){
          return LessionsListLoading();
        }else if(state.status.isSuccess && (state.lessionsListEntity?.lessionsData?.lessonList).isNotNullAndNotEmpty){
          return ListView.builder(
            itemCount: state.lessionsListEntity?.lessionsData?.lessonList?.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {

              Lesson  lession = state.lessionsListEntity!.lessionsData!.lessonList![index];

              return InkWell(
                onTap: () =>
                    context.push(LessionsPage.path + LessionDetailsPage.path),
                child: LessionItemView(
                  title: lession.title ?? "",
                  isCompleted: lession.completeStatus == "COMPLETE",
                ),
              );

            },
          );
        }else{
          return EmptyWidget(
              title: "No Lessions Found!",
              message: "Lessions are not available at this moment."
          );
        }
      },
    );
  }
}
