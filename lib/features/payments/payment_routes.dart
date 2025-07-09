import 'package:go_router/go_router.dart';
import 'package:learning_management/config/routes/router_transition.dart';
import 'package:learning_management/features/payments/presentation/pages/payment_page.dart';

class PaymentRouter {
  const PaymentRouter._();

  static List<GoRoute> routes = [

    /// Payment page route
    GoRoute(
      path: PaymentPage.path,
      name: PaymentPage.name,
      pageBuilder: (context,state){
        return CustomTransitionPage(
            key: state.pageKey,
            child: PaymentPage(),
            transitionsBuilder: routerTransition
        );
      },
    )


  ];

}