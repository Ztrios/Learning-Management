import 'package:go_router/go_router.dart';
import 'package:learning_management/config/routes/router_transition.dart';
import 'package:learning_management/features/bottom_navigations/presentation/pages/bottom_navigation_page.dart';
import 'package:learning_management/features/home/home_routes.dart';
import 'package:learning_management/features/home/presentation/pages/home_page.dart';
import 'package:learning_management/features/progress/progress_routes.dart';
import 'package:learning_management/features/results/results_routes.dart';
import 'package:learning_management/features/routine/routine_routes.dart';

class BottomNavigationRouter {
  const BottomNavigationRouter._();

  static final List<ShellRoute> routes = [

    /// Bottom Navigation page routes
    ShellRoute(
        pageBuilder: (context, state, child){
          return CustomTransitionPage(
              key: state.pageKey,
              child: BottomNavigationPage(child: child),
              transitionsBuilder: routerTransition
          );
        },
        routes: [

          /// Home Routes
          ...HomeRouter.routes,

          /// Routine page routes,
          ...RoutineRouter.routes,

          /// Progress Routes
          ...ProgressRouter.routes,

          /// Results Routes
          ...ResultsRouter.routes

        ]
    )

  ];

}