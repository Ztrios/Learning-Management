import 'package:go_router/go_router.dart';
import 'package:learning_management/config/routes/router_transition.dart';
import 'package:learning_management/features/authentication/presentation/pages/forget_password_page.dart';
import 'package:learning_management/features/authentication/presentation/pages/log_in_page.dart';
import 'package:learning_management/features/authentication/presentation/pages/otp_verification_page.dart';
import 'package:learning_management/features/authentication/presentation/pages/reset_password_page.dart';
import 'package:learning_management/features/authentication/presentation/pages/sign_up_page.dart';

class AuthenticationRouter {
  AuthenticationRouter._();

  static final List<GoRoute> routes = [

    /// Sign Up Page Route
    GoRoute(
        path: SignUpPage.path,
        name: SignUpPage.name,
        pageBuilder: (context,state ){
          return CustomTransitionPage<void>(
              key: state.pageKey,
              child: SignUpPage(),
              transitionsBuilder: routerTransition
          );
        },
    ),

    /// LogIn Page Route
    GoRoute(
        path: LogInPage.path,
        name: LogInPage.name,
        pageBuilder: (context, state){
          return CustomTransitionPage(
              key: state.pageKey,
              child: LogInPage(),
              transitionsBuilder: routerTransition
          );
        },
      routes: [

        /// Forget Password Page Routes
        GoRoute(
          path: ForgetPasswordPage.path,
          name: ForgetPasswordPage.name,
          pageBuilder: (context,state ){
            return CustomTransitionPage<void>(
                key: state.pageKey,
                child: ForgetPasswordPage(),
                transitionsBuilder: routerTransition
            );
          },
          routes: [

            /// OTP verification page routes
            GoRoute(
              path: OTPVerificationPage.path,
              name: OTPVerificationPage.name,
              pageBuilder: (context,state ){
                return CustomTransitionPage<void>(
                    key: state.pageKey,
                    child: OTPVerificationPage(),
                    transitionsBuilder: routerTransition
                );
              },
              routes: [

                /// Reset password page routes
                GoRoute(
                  path: ResetPasswordPage.path,
                  name: ResetPasswordPage.name,
                  pageBuilder: (context,state ){
                    return CustomTransitionPage<void>(
                        key: state.pageKey,
                        child: ResetPasswordPage(),
                        transitionsBuilder: routerTransition
                    );
                  },
                ),

              ]
            ),
          ]
        ),
      ]
    )

  ];

}