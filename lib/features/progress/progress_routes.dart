import 'package:go_router/go_router.dart';
import 'package:learning_management/config/routes/router_transition.dart';
import 'package:learning_management/features/progress/presentation/pages/progress_page.dart';

class ProgressRouter {
  const ProgressRouter._();

  static final List<GoRoute> routes = [

    /// Progress Page route
    GoRoute(
      path: ProgressPage.path,
      name: ProgressPage.name,
      pageBuilder: (context, state){
        return CustomTransitionPage(
            key: state.pageKey,
            child: ProgressPage(),
            transitionsBuilder: routerTransition
        );
      },
    )

  ];

}