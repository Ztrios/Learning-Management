import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/helpers/format_data/datetime_formatters.dart';
import 'package:learning_management/core/helpers/toast_notification/toast_notifications.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/home/presentation/bloc/home_bloc.dart';
import 'package:learning_management/features/home/data/models/subjects_model.dart';
import 'package:learning_management/features/subject_details/data/models/exams_list_model.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_bloc.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_event.dart';
import 'package:learning_management/features/subject_details/presentation/pages/exams_submission_page.dart';
import 'package:learning_management/features/subject_details/presentation/pages/subject_details_page.dart';
import 'package:learning_management/features/subject_details/presentation/widgets/item_view/exams_item_view.dart';
import 'package:learning_management/features/subject_details/presentation/widgets/loading/lessions_list_loading.dart';
import 'package:learning_management/widgets/app_bars/primary_app_bars.dart';
import 'package:learning_management/widgets/app_bars/secondary_app_bar.dart';
import 'package:learning_management/widgets/drawer/custom_drawer.dart';
import 'package:learning_management/widgets/empty_widget.dart';

class ExamsListPage extends HookWidget {

  static String get path => "/exams-list";

  static String get name => "exams-list";

  const ExamsListPage({super.key});

  @override
  Widget build(BuildContext context) {

    void getExamsList(String subjectId){
      context.read<SubjectDetailsBloc>().add(GetExamsList(subjectId: subjectId));
    }


    useEffect((){
      Future.microtask(()=> getExamsList(""));
      return null;
    },[]);

    return Scaffold(
      endDrawer: CustomDrawer(),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [

              gap12,

              PrimaryAppBar(),

              gap12,

              Padding(
                padding: paddingLeft20,
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if(state.status.isSuccess && (state.subjectsEntity?.subjectsData?.content).isNotNullAndNotEmpty){
                      return DefaultTabController(
                        initialIndex: 0,
                        length: (state.subjectsEntity?.subjectsData?.content?.length ?? 0) + 1,
                        child: TabBar(
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          physics: BouncingScrollPhysics(),
                          indicatorColor: AppColors.deepOrange,
                          splashBorderRadius: radius6,
                          labelStyle: AppTextStyles.bodyMedium.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Colors.deepOrange
                          ),
                          tabs: [
                            Container(
                              height: 45.h,
                              alignment: Alignment.center,
                              child: Text(
                                  "All"
                              ),
                            ),
                            ...(state.subjectsEntity?.subjectsData?.content ?? []).map(
                                    (subject){
                                  return Container(
                                    height: 45.h,
                                    alignment: Alignment.center,
                                    child: Text(
                                        subject.name ?? ""
                                    ),
                                  );
                                }),
                          ],
                          onTap: (index){
                            if(index > 0){
                              int? subjectId = state.subjectsEntity!.subjectsData!.content![index].id;
                              if(subjectId != null){
                                getExamsList((subjectId + 1).toString());
                              }
                            }
                          },
                        ),
                      );
                    }else{
                      return SizedBox.shrink();
                    }
                  }
                ),
              ),

              gap12,

              Expanded(
                child: Padding(
                  padding: paddingH20,
                  child: BlocBuilder<SubjectDetailsBloc, SubjectDetailsState>(
                    builder: (context, state) {
                      if(state.status.isLoading){
                        return LessionsListLoading();
                      }else if(state.status.isSuccess && (state.examsListEntity?.examData?.exams).isNotNullAndNotEmpty){
                        return ListView.builder(
                          itemCount: state.examsListEntity?.examData?.exams?.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {

                            Exam exam = state.examsListEntity!.examData!.exams![index];

                            return InkWell(
                              onTap: () {
                                context.push("${SubjectDetailsPage.path}${ExamsSubmissionPage.path}/${exam.id}/${exam.examStatus}");
                                // if(exam.examStatus != "SUBMITTED"){
                                //   context.push("${SubjectDetailsPage.path}${ExamsSubmissionPage.path}/${exam.id}/${exam.examStatus}");
                                // }else{
                                //   ToastNotifications.showErrorToast(
                                //     title: "Submitted Exam!",
                                //     message: "Your exam is already submitted.",
                                //   );
                                // }
                              },
                              child: ExamItemView(
                                showStar: false,
                                isCompleted: exam.examStatus == "SUBMITTED",
                                title: exam.title ?? "",
                                totalMarks: exam.fullMarks ?? 0,
                                getMarks: 0,
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
                              ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
