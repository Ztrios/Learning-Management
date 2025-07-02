import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/config/routes/route_error_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


class AppRouter {
  AppRouter._(); // Private constructor to prevent instantiation

  /// Create GoRouter instance
  static final GoRouter routes = GoRouter(
    navigatorKey: navigatorKey,
    //initialLocation: SplashPage.path, // Default route
    debugLogDiagnostics: true,
    errorBuilder: (context,state)=> ErrorPage(state: state),
    redirect: (BuildContext context, GoRouterState state){
      return null;
    },
    routes: [

      // /// Onboarding Routes
      // ...OnboardingRouter.routes,
      // /// Bottom Navigation Routes
      // ...BottomNavigationRouter.routes,
      // /// Home Routes
      // ...HomeRouter.routes,
      // /// Description Routes
      // ...DetailsRoutes.routes,
      // /// Recipes Routes
      // ...RecipesRouter.routes,
      // /// Campaigns Routes
      // ...CampaignRouter.routes,
      // /// Order Routes
      // ...OrderRouter.routes,
      // /// Cart Routes
      // ...CartRouter.routes,
      // /// Profile Routes
      // ...SignupAndProfileRouter.routes

    ],
  );
}
