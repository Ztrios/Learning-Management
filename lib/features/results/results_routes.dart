import 'package:go_router/go_router.dart';
import 'package:learning_management/config/routes/router_transition.dart';
import 'package:learning_management/features/results/presentation/pages/results_page.dart';

class ResultsRouter {
  const ResultsRouter._();

  static final List<GoRoute> routes = [

    /// Results page routes
    GoRoute(
      path: ResultsPage.path,
      name: ResultsPage.name,
      pageBuilder: (context, state){
        return CustomTransitionPage(
            key: state.pageKey,
            child: ResultsPage(),
            transitionsBuilder: routerTransition
        );
      },
    )

  ];

}