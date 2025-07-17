import 'package:go_router/go_router.dart';
import 'package:learning_management/config/routes/router_transition.dart';
import 'package:learning_management/features/home/presentation/pages/home_page.dart';
import 'package:learning_management/features/home/presentation/pages/task_list_page.dart';
import 'package:learning_management/features/notifications/notification_routes.dart';

class HomeRouter {
  const HomeRouter._();

  static final List<GoRoute> routes = [

    /// Home Page Route
    GoRoute(
        path: HomePage.path,
        name: HomePage.name,
        pageBuilder: (context, state){
          return CustomTransitionPage(
              key: state.pageKey,
              child: HomePage(),
              transitionsBuilder: routerTransition
          );
        },
      routes: [

        /// Task List page routes
        GoRoute(
            path: TaskListPage.path,
            name: TaskListPage.name,
            pageBuilder: (context, state){
              return CustomTransitionPage(
                  key: state.pageKey,
                  child: TaskListPage(),
                  transitionsBuilder: routerTransition
              );
            }
        ),

      ]
    )

  ];

}