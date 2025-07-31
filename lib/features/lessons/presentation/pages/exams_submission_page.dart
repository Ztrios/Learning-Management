import 'dart:convert';
import 'dart:io';

import 'package:defer_pointer/defer_pointer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/helpers/format_data/datetime_formatters.dart';
import 'package:learning_management/core/helpers/format_data/pdf_formatters.dart';
import 'package:learning_management/core/helpers/toast_notification/toast_notifications.dart';
import 'package:learning_management/core/utils/enums/enums.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/margins.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/lessons/data/models/exam_details_model.dart';
import 'package:learning_management/features/lessons/presentation/bloc/lessions_bloc.dart';
import 'package:learning_management/features/lessons/presentation/bloc/lessions_event.dart';
import 'package:learning_management/features/lessons/presentation/widgets/pdf_list_widget.dart';
import 'package:learning_management/features/lessons/presentation/widgets/submission_header.dart';
import 'package:learning_management/features/lessons/presentation/widgets/html_viewer_widget.dart';
import 'package:learning_management/features/lessons/presentation/widgets/item_view/assignments_item_view.dart';
import 'package:learning_management/features/lessons/presentation/widgets/submission_types_selection.dart';
import 'package:learning_management/features/lessons/presentation/widgets/files_upload_widget.dart';
import 'package:learning_management/widgets/app_bars/secondary_app_bar.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/circle_loading.dart';
import 'package:learning_management/widgets/drawer/custom_drawer.dart';
import 'package:learning_management/widgets/empty_widget.dart';
import 'package:learning_management/widgets/network_image_widget.dart';

class ExamsSubmissionPage extends HookWidget {

  static String get path => "/exam-submission";
  static String get name => "exam-submission";

  final String examId;

  const ExamsSubmissionPage({
    super.key,
    required this.examId
  });

  @override
  Widget build(BuildContext context) {

    final uploadedFile = useState<File?>(null);

    void getExamDetails() async {
      context.read<LessionsBloc>().add(GetExamsDetails(examId: examId));
    }

    Future<void> examSubmit() async {
      print(uploadedFile.value);
      int? studentId = context.read<AuthBloc>().state.signInEntity?.signInData?.student?.id;
      if(studentId == null) return;

      if(uploadedFile.value != null){
        Map<String, dynamic> dto = {
          "examId" : examId,
          "studentId" : studentId.toString()
        };

        Map<String, dynamic> body = {
          "dto" : jsonEncode(dto),
          "file" : await MultipartFile.fromFile(uploadedFile.value!.path)
        };

        context.read<LessionsBloc>().add(SubmitExam(
            body: body
        ));
      }else{
        ToastNotifications.showErrorToast(
            title: "Empty File",
            message: "Need to upload exams photos or pdf",
            alignment: Alignment.topCenter
        );
      }
    }

    useEffect((){
      Future.microtask(()=> getExamDetails());
      return null;
    },[]);

    return Scaffold(
      endDrawer: CustomDrawer(),
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: BlocConsumer<LessionsBloc, LessionsState>(
            listenWhen: (previous, current)=> !previous.examSubmissionStatus.isSuccess,
            listener: (context, state){
              if(state.examSubmissionStatus.isSuccess){
                ToastNotifications.showSuccessToast("Exam submitted successfully!");
                context.pop();
              }
            },
            builder: (context, state) {

              if(state.status.isLoading){
                return CircleLoadingWidget();
              }else if((state.examDetailsEntity?.examDetails).isNotNullAndNotEmpty){
                ExamDetails? examDetails = state.examDetailsEntity?.examDetails;
                return Column(
                  children: [

                    SecondaryAppBar(
                      title: "Exam Submission",
                    ),

                    Expanded(
                      child: Container(
                        width: 1.sw,
                        height: 1.sh,
                        padding: paddingH24,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: crossStart,
                            children: [

                              SubmissionHeader(
                                  title: examDetails?.title ?? "Not Found",
                                  endTime: DateTimeFormatters.timeToDateTime(examDetails?.endTime ?? "12:94:29"),
                                  totalMarks: (examDetails?.marks ?? 0).floor()
                              ),

                              gap24,


                              HtmlViewerWidget(
                                  content: examDetails?.description ?? ""
                              ),

                              gap24,

                              PdfListWidget(
                                  pdfUrls: examDetails?.fileUrls ?? []
                              ),

                              Divider(thickness: 2),

                              gap12,

                              FilesUploadWidget(
                                selectedFiles: (List<File>? files, UploadType type) async {
                                  uploadedFile.value = null;
                                  if(files != null){
                                    if(type == UploadType.pdf){
                                      //uploadedFile.value = await files.first.rename("exam-$examId.pdf");
                                      uploadedFile.value = files.first;
                                    }else{
                                      uploadedFile.value =
                                      await PdfFormatters.convertImagesToPdfFile(files,fileName: "exam-$examId.pdf");
                                    }
                                  }

                                },
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),


                    Padding(
                      padding: padding24,
                      child: PrimaryButton(
                        isLoading: state.examSubmissionStatus.isLoading,
                        onPressed: examSubmit,
                        width: 1.sw,
                        height: 50.h,
                        text: "Submit",
                        background: AppColors.deepOrange,
                        textColor: Colors.white,
                      ),
                    )


                  ],
                );
              }else{
                return EmptyWidget(
                    title: "Try Again",
                    message: "Something Went Wrong!"
                );
              }

            },
          ),
        ),
      ),
    );
  }
}
