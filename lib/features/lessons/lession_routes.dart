import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/config/routes/router_transition.dart';
import 'package:learning_management/features/lessons/presentation/pages/lession_content_page.dart';
import 'package:learning_management/features/lessons/presentation/pages/lessions_page.dart';

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
          GoRoute(
            path: LessionContentPage.path,
            name: LessionContentPage.name,
            pageBuilder: (context,state){
              return CustomTransitionPage(
                  key: state.pageKey,
                  child: LessionContentPage(),
                  transitionsBuilder: routerTransition
              );
            }
          )
        ]
    ),

  ];

}