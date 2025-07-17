import 'package:go_router/go_router.dart';
import 'package:learning_management/config/routes/router_transition.dart';
import 'package:learning_management/features/notifications/presentation/pages/notifications_page.dart';

class NotificationsRouter {
  const NotificationsRouter._();

  static final List<GoRoute> routes = [

    /// Notification page routes
    GoRoute(
      path: NotificationsPage.path,
      name: NotificationsPage.name,
      pageBuilder: (context, state){
        return CustomTransitionPage(
            key: state.pageKey,
            child: NotificationsPage(),
            transitionsBuilder: routerTransition
        );
      },
    )

  ];

}