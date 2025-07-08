import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/config/routes/router_transition.dart';
import 'package:learning_management/features/lessons/presentation/pages/assignment_submission_page.dart';
import 'package:learning_management/features/lessons/presentation/pages/exams_submission_page.dart';
import 'package:learning_management/features/lessons/presentation/pages/lession_details_page.dart';
import 'package:learning_management/features/lessons/presentation/pages/lessions_page.dart';
import 'package:learning_management/features/lessons/presentation/pages/quiz_submission_page.dart';

class LessionRouter {
  const LessionRouter._();

  static final List<GoRoute> routes = [

    /// Lession page route
    GoRoute(
        path: LessionsPage.path,
        name: LessionsPage.name,
        pageBuilder: (context, state){

          final String subject = state.uri.queryParameters["subject"] ?? "English";
          final String subjectIcon = state.uri.queryParameters["subjectIcon"] ?? "assets/icons/mathematics_icon.svg";
          final LessionPageExtraParams extras = state.extra! as LessionPageExtraParams;

          return CustomTransitionPage(
              key: state.pageKey,
              child: LessionsPage(
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
            path: LessionDetailsPage.path,
            name: LessionDetailsPage.name,
            pageBuilder: (context,state){
              return CustomTransitionPage(
                  key: state.pageKey,
                  child: LessionDetailsPage(),
                  transitionsBuilder: routerTransition
              );
            },
            routes: [

              /// Assignment Submission page route
              GoRoute(
                path: AssignmentSubmissionPage.path,
                name: AssignmentSubmissionPage.name,
                pageBuilder: (context,state){
                  return CustomTransitionPage(
                      key: state.pageKey,
                      child: AssignmentSubmissionPage(),
                      transitionsBuilder: routerTransition
                  );
                },
              ),


              /// Quiz Submission page route
              GoRoute(
                path: QuizSubmissionPage.path,
                name: QuizSubmissionPage.name,
                pageBuilder: (context,state){
                  return CustomTransitionPage(
                      key: state.pageKey,
                      child: QuizSubmissionPage(),
                      transitionsBuilder: routerTransition
                  );
                },
              )

            ]
          ),

          /// Exams Submission page route
          GoRoute(
            path: ExamsSubmissionPage.path,
            name: ExamsSubmissionPage.name,
            pageBuilder: (context,state){
              return CustomTransitionPage(
                  key: state.pageKey,
                  child: ExamsSubmissionPage(),
                  transitionsBuilder: routerTransition
              );
            },
          )

        ]
    )

  ];

}