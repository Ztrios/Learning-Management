import 'package:go_router/go_router.dart';
import 'package:learning_management/config/routes/router_transition.dart';
import 'package:learning_management/features/auth/presentation/pages/forget_password_page.dart';
import 'package:learning_management/features/auth/presentation/pages/sign_in_page.dart';
import 'package:learning_management/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:learning_management/features/auth/presentation/pages/reset_password_page.dart';
import 'package:learning_management/features/auth/presentation/pages/sign_up_page.dart';

class AuthRouter {
  AuthRouter._();

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
        path: SignInPage.path,
        name: SignInPage.name,
        pageBuilder: (context, state){
          return CustomTransitionPage(
              key: state.pageKey,
              child: SignInPage(),
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
              path: "${OTPVerificationPage.path}/:phone/:fromSignUp",
              name: OTPVerificationPage.name,
              pageBuilder: (context,state ){
                final String phone = state.pathParameters["phone"] ?? "";
                final bool fromSignUp = state.pathParameters["fromSignUp"] == "true";
                return CustomTransitionPage<void>(
                    key: state.pageKey,
                    child: OTPVerificationPage(
                      phone: phone,
                      fromSignUp: fromSignUp,
                    ),
                    transitionsBuilder: routerTransition
                );
              },
              routes: [

                /// Reset password page routes
                GoRoute(
                  path: "${ResetPasswordPage.path}/:resetToken",
                  name: ResetPasswordPage.name,
                  pageBuilder: (context,state ){

                    final String resetToken = state.pathParameters["resetToken"] ?? "";

                    return CustomTransitionPage<void>(
                        key: state.pageKey,
                        child: ResetPasswordPage(
                          resetToken: resetToken,
                        ),
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