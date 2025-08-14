import 'package:go_router/go_router.dart';
import 'package:learning_management/config/routes/router_transition.dart';
import 'package:learning_management/features/onboarding/presentation/pages/onboarding_page.dart';

class OnboardingRouter {
  const OnboardingRouter._();

  static final List<GoRoute> routes = [

    /// Onboarding Page Route
    GoRoute(
      path: OnboardingPage.path,
      name: OnboardingPage.name,
      pageBuilder: (context,state ){
        return CustomTransitionPage<void>(
            key: state.pageKey,
            child: OnboardingPage(),
            transitionsBuilder: routerTransition
        );
      },
    ),

  ];

}