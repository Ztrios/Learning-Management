import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/config/routes/router_transition.dart';
import 'package:learning_management/features/subject_details/presentation/pages/assignment_submission_page.dart';
import 'package:learning_management/features/subject_details/presentation/pages/exams_submission_page.dart';
import 'package:learning_management/features/subject_details/presentation/pages/lession_details_page.dart';
import 'package:learning_management/features/subject_details/presentation/pages/subject_details_page.dart';
import 'package:learning_management/features/subject_details/presentation/pages/quiz_submission_page.dart';

class SubjectDetailsRouter {
  const SubjectDetailsRouter._();

  static final List<GoRoute> routes = [

    /// Subject Details page route
    GoRoute(
        path: SubjectDetailsPage.path,
        name: SubjectDetailsPage.name,
        pageBuilder: (context, state){

          final String subjectId = state.uri.queryParameters["subjectId"] ?? "";
          final String subject = state.uri.queryParameters["subject"] ?? "English";
          final String subjectIcon = state.uri.queryParameters["subjectIcon"] ?? "assets/icons/mathematics_icon.svg";
          final SubjectDetailsPageExtraParams extras = state.extra! as SubjectDetailsPageExtraParams;

          return CustomTransitionPage(
              key: state.pageKey,
              child: SubjectDetailsPage(
                subjectId: subjectId,
                subject: subject,
                subjectIcon: subjectIcon,
                shapeColor: extras.shapeColor,
                background: extras.background,
              ),
              transitionsBuilder: routerTransition
          );
        },
        routes: [

          /// Lessions Details page routes
          GoRoute(
            path: "${LessionDetailsPage.path}/:lessionId",
            name: LessionDetailsPage.name,
            pageBuilder: (context,state){

              String lessionId = state.pathParameters["lessionId"] ?? "";

              return CustomTransitionPage(
                  key: state.pageKey,
                  child: LessionDetailsPage(lessionId: lessionId),
                  transitionsBuilder: routerTransition
              );

            },
            routes: [

              /// Assignment Submission page route
              GoRoute(
                path: "${AssignmentSubmissionPage.path}/:assignmentId",
                name: AssignmentSubmissionPage.name,
                pageBuilder: (context,state){

                  final String assignmentId = state.pathParameters["assignmentId"] ?? "";

                  return CustomTransitionPage(
                      key: state.pageKey,
                      child: AssignmentSubmissionPage(
                        assignmentId: assignmentId,
                      ),
                      transitionsBuilder: routerTransition
                  );
                },
              ),


              /// Quiz Submission page route
              GoRoute(
                path: "${QuizSubmissionPage.path}/:quizId",
                name: QuizSubmissionPage.name,
                pageBuilder: (context,state){
                  return CustomTransitionPage(
                      key: state.pageKey,
                      child: QuizSubmissionPage(
                        quizId: state.pathParameters["quizId"] ?? "",
                      ),
                      transitionsBuilder: routerTransition
                  );
                },
              )

            ]
          ),

          /// Exams Submission page route
          GoRoute(
            path: "${ExamsSubmissionPage.path}/:examId/:status",
            name: ExamsSubmissionPage.name,
            pageBuilder: (context,state){

              String examId = state.pathParameters["examId"] ?? "";
              String status = state.pathParameters["status"] ?? "";

              return CustomTransitionPage(
                  key: state.pageKey,
                  child: ExamsSubmissionPage(
                    examId: examId,
                    examStatus: status,
                  ),
                  transitionsBuilder: routerTransition
              );

            },
          )

        ]
    )

  ];

}