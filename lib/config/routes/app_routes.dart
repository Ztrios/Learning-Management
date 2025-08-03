import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/config/routes/route_error_page.dart';
import 'package:learning_management/config/routes/router_transition.dart';
import 'package:learning_management/features/auth/auth_routes.dart';
import 'package:learning_management/features/auth/presentation/pages/sign_in_page.dart';
import 'package:learning_management/features/auth/presentation/pages/sign_up_page.dart';
import 'package:learning_management/features/bottom_navigation/bottom_navigation_routes.dart';
import 'package:learning_management/features/home/home_routes.dart';
import 'package:learning_management/features/subject_details/subject_details_routes.dart';
import 'package:learning_management/features/notifications/notification_routes.dart';
import 'package:learning_management/features/onboarding/onboarding_routes.dart';
import 'package:learning_management/features/payments/payment_routes.dart';
import 'package:learning_management/features/profile/presentation/profile_routes.dart';
import 'package:learning_management/features/splash/presentation/pages/splash_page.dart';
import 'package:learning_management/features/splash/splash_routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


class AppRouter {
  AppRouter._(); // Private constructor to prevent instantiation

  /// Create GoRouter instance
  static final GoRouter routes = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: SplashPage.path, // Default route
    debugLogDiagnostics: true,
    errorBuilder: (context,state)=> ErrorPage(state: state),
    redirect: (BuildContext context, GoRouterState state){
      return null;
    },
    routes: [
      /// Splash Routes
      ...SplashRouter.routes,

      /// Onboarding Routes
      ...OnboardingRouter.routes,

      /// auth Routes
      ...AuthRouter.routes,

      /// Bottom Navigation Routes
      ...BottomNavigationRouter.routes,

      /// Lession Routes
      ...SubjectDetailsRouter.routes,

      /// Payment Routes
      ...PaymentRouter.routes,

      /// Profile Routes
      ...ProfileRouter.routes,

      /// Notification routes
      ...NotificationsRouter.routes

    ]
  );
}
