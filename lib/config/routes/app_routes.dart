import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/config/routes/route_error_page.dart';
import 'package:learning_management/features/authentication/authentication_routes.dart';
import 'package:learning_management/features/authentication/presentation/pages/sign_up_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


class AppRouter {
  AppRouter._(); // Private constructor to prevent instantiation

  /// Create GoRouter instance
  static final GoRouter routes = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: SignUpPage.path, // Default route
    debugLogDiagnostics: true,
    errorBuilder: (context,state)=> ErrorPage(state: state),
    redirect: (BuildContext context, GoRouterState state){
      return null;
    },
    routes: [

      /// Authentication Routes
      ...AuthenticationRouter.routes,

    ],
  );
}
