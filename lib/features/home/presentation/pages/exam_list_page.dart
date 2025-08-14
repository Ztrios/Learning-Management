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
import 'package:learning_management/features/home/presentation/bloc/home_bloc.dart';
import 'package:learning_management/features/home/data/models/subjects_model.dart';
import 'package:learning_management/features/subject_details/data/models/exams_list_model.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_bloc.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_event.dart';
import 'package:learning_management/features/subject_details/presentation/pages/exams_submission_page.dart';
import 'package:learning_management/features/subject_details/presentation/pages/subject_details_page.dart';
import 'package:learning_management/features/subject_details/presentation/widgets/item_view/exams_item_view.dart';
import 'package:learning_management/features/subject_details/presentation/widgets/loading/lessions_list_loading.dart';
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

    void getInitialExamList(){
      List<Content>? subjects = context.read<HomeBloc>().state.subjectsEntity?.subjectsData?.content;
      int? subjectId = subjects.isNotNullAndNotEmpty ? subjects!.first.id : null;
      getExamsList(subjectId.toString());
    }

    void showDropDownMenu(List<Content> subjects) async {
      await showMenu<int>(
        context: context,
        color: Colors.white,
        position: RelativeRect.fromLTRB(
          MediaQuery
              .of(context)
              .size
              .width, // right side
          kToolbarHeight, // below the app bar
          0,
          0,
        ),
        items: subjects.map((subject){
          return PopupMenuItem(
            onTap: ()=> getExamsList(subject.id.toString()),
            value: subject.id,
            child: Text(subject.name ?? ""),
          );
        }).toList(),
      );
    }


    useEffect((){
      Future.microtask(()=> getInitialExamList());
      return null;
    },[]);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75.w,
        actionsPadding: padding12,
        centerTitle: true,
        title: Text(
          "Exams",
          style: AppTextStyles.titleMedium.copyWith(
              color: AppColors.blueLight,
              fontWeight: FontWeight.w900
          ),
        ),
        leading: IconButton(
          onPressed: ()=> context.pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.blueLight
          )
        ),
        actions: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return IconButton(
                onPressed: (){
                  showDropDownMenu(state.subjectsEntity?.subjectsData?.content ?? []);
                },
                icon: Icon(
                  Icons.more_vert,
                  color: AppColors.blueLight,
                ),
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          padding: padding12,
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
                        if(exam.examStatus != "SUBMITTED"){
                          context.push("${SubjectDetailsPage.path}${ExamsSubmissionPage.path}/${exam.id}");
                        }else{
                          ToastNotifications.showErrorToast(
                            title: "Submitted Exam!",
                            message: "Your exam is already submitted.",
                          );
                        }
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
    );
  }
}
