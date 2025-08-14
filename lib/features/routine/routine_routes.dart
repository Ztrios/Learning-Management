import 'package:go_router/go_router.dart';
import 'package:learning_management/config/routes/router_transition.dart';
import 'package:learning_management/features/routine/presentation/pages/routine_page.dart';

class RoutineRouter {
  const RoutineRouter._();

  static final List<GoRoute> routes = [

    /// Routine page routes
    GoRoute(
      path: RoutinePage.path,
      name: RoutinePage.name,
      pageBuilder: (context, state){
        return CustomTransitionPage(
            key: state.pageKey,
            child: RoutinePage(),
            transitionsBuilder: routerTransition
        );
      },
    )

  ];

}