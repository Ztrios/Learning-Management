import 'package:go_router/go_router.dart';
import 'package:learning_management/config/routes/router_transition.dart';
import 'package:learning_management/features/profile/presentation/pages/student_profile_page.dart';

class ProfileRouter {
  const ProfileRouter._();

  static final List<GoRoute> routes = [

    /// Student Profile Page Route
    GoRoute(
      path: StudentProfilePage.path,
      name: StudentProfilePage.name,
        pageBuilder: (context, state){
          return CustomTransitionPage(
              key: state.pageKey,
              child: StudentProfilePage(),
              transitionsBuilder: routerTransition
          );
        }
    ),

  ];

}