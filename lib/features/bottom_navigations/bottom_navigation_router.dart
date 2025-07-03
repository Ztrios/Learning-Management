import 'package:go_router/go_router.dart';
import 'package:learning_management/config/routes/router_transition.dart';
import 'package:learning_management/features/bottom_navigations/presentation/pages/bottom_navigation_page.dart';
import 'package:learning_management/features/home/presentation/pages/home_page.dart';

class BottomNavigationRouter {
  const BottomNavigationRouter._();

  static final List<GoRoute> routes = [

    /// Bottom Navigation page routes
    GoRoute(
        path: BottomNavigationPage.path,
        name: BottomNavigationPage.name,
        pageBuilder: (context, state){
          return CustomTransitionPage(
              key: state.pageKey,
              child: BottomNavigationPage(),
              transitionsBuilder: routerTransition
          );
        }
    )

  ];

}