import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart' hide Content;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/home/data/models/subjects_model.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/home/presentation/bloc/home_bloc.dart';
import 'package:learning_management/features/home/presentation/bloc/home_event.dart';
import 'package:learning_management/features/home/presentation/widgets/item_view/subject_item_view.dart';
import 'package:learning_management/features/home/presentation/widgets/loading_widgets/subjects_loading_widget.dart';
import 'package:learning_management/features/subject_details/presentation/pages/subject_details_page.dart';
import 'package:learning_management/widgets/error_widget/error_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SubjectListWidget extends HookWidget {
  const SubjectListWidget({super.key});

  @override
  Widget build(BuildContext context) {



    const List<Color> colors = [
      AppColors.deepOrange,
      AppColors.deepBlue,
      AppColors.deepGreen,
      AppColors.tealBlue,
      AppColors.deepPurpleAccent
    ];


    const Map<String,dynamic> icons = {
      "bangla": "assets/icons/bangla_icon.svg",
      "english": "assets/icons/english_icon.svg",
      "mathematics": "assets/icons/mathematics_icon.svg",
      "math": "assets/icons/mathematics_icon.svg",
      "geography": "assets/icons/geography_icon.svg",
      "history": "assets/icons/history_icon.svg",
    };



    Future<void> getStudentSubjects() async {
      int? studentId = context.read<AuthBloc>().state.signInEntity?.signInData?.student?.id;
      if(studentId != null){
        context.read<HomeBloc>().add(GetStudentSubjects(studentId: studentId.toString()));
      }
    }


    useEffect((){
      Future.microtask(()=> getStudentSubjects());
      return null;
    },[]);


    return SizedBox(
      width: 1.sw,
      height: 170.h,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if(state.status.isSuccess){
            return Column(
              crossAxisAlignment: crossStart,
              children: [
                Text(
                  "Subjects",
                  style: AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.bold
                  ),
                ),

                Text(
                  "Recommendations for you",
                  style: AppTextStyles.caption,
                ),

                gap12,

                Expanded(
                  child: ListView.builder(
                      itemCount: state.subjectsEntity?.subjectsData?.content?.length,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        Content? subject = (state.subjectsEntity?.subjectsData?.content).isNotNullAndNotEmpty ?
                        state.subjectsEntity!.subjectsData!.content![index] : null;
                        return InkWell(
                          onTap: () {
                            Map<String, dynamic> parameters = {
                              "subjectId": subject?.id.toString(),
                              "subject": subject?.name ?? "English",
                              "subjectIcon":  icons[(subject?.name ?? "english").toLowerCase()] ?? "assets/icons/history_icon.svg"
                            };
                            context.push(
                                Uri(path: SubjectDetailsPage.path,
                                    queryParameters: parameters).toString(),
                                extra: SubjectDetailsPageExtraParams(
                                  background: colors[index % colors.length]
                                      .withValues(alpha: 0.9),
                                  shapeColor: colors[index % colors.length],
                                )
                            );
                          },

                          child: SubjectItemView(
                            subject: subject?.name ?? "English",
                            svgIcon: icons[(subject?.name ?? "english").toLowerCase()] ?? "assets/icons/history_icon.svg",
                            background: colors[index % colors.length].withValues(alpha: 0.9),
                            shapeColor: colors[index % colors.length],
                          ),
                        );
                      }
                  ),
                ),
              ],
            );
          }/*else if(state.status.isError){
            return ErrorViewWidget(
                message: state.message ?? "Unknown"
            );
          }*/else{
            return SubjectsLoadingWidget();
          }
        },
      ),
    );
  }
}
