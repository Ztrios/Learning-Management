import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_event.dart';
import 'package:learning_management/features/home/presentation/pages/home_page.dart';
import 'package:learning_management/features/progress/presentation/pages/progress_page.dart';
import 'package:learning_management/features/results/presentation/pages/results_page.dart';
import 'package:learning_management/features/routine/presentation/pages/routine_page.dart';
import 'package:learning_management/widgets/drawer/custom_drawer.dart';

class BottomNavigationPage extends HookWidget {

  final Widget child;
  const BottomNavigationPage({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState<int>(0);

    void onTap(int index){
      currentIndex.value = index;
      switch (index) {
        case 0:
          context.go(HomePage.path);
        case 1:
          context.go(RoutinePage.path);
        case 2:
          context.go(ProgressPage.path);
        case 3:
          context.go(ResultsPage.path);
      }
    }


    void initialIndex() {
      final location = GoRouter.of(context).state.path;
      if (location == HomePage.path) {
        currentIndex.value = 0;
      } else if (location == RoutinePage.path) {
        currentIndex.value = 1;
      } else if (location == ProgressPage.path) {
        currentIndex.value = 2;
      } else if (location == ResultsPage.path) {
        currentIndex.value = 3;
      }
    }


    Color getColor() {
      switch (currentIndex.value) {
        case 0:
          return AppColors.blueLight;
        case 1:
          return AppColors.deepOrange;
        case 2:
          return AppColors.deepPurpleAccent;
        case 3:
          return AppColors.deepGreen;
        default:
          return AppColors.grey;
      }
    }

    final ColorFilter colorFilter = ColorFilter.mode(
      getColor(),
      BlendMode.srcIn,
    );


    useEffect((){
      initialIndex();
      return null;
    },[]);


    return Scaffold(
      backgroundColor: AppColors.background,
      endDrawer: CustomDrawer(),
      body: child,
      bottomNavigationBar: Container(
        height: 90.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 20,
              offset: Offset(0, -2),
              spreadRadius: 4,
            )
          ]
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex.value,
          backgroundColor: Colors.white,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 100,
          selectedLabelStyle: AppTextStyles.bodySmall.copyWith(
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: AppTextStyles.bodySmall.copyWith(
            fontWeight: FontWeight.bold,
          ),
          selectedItemColor: getColor(),
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              backgroundColor: Colors.white,
              icon: SvgPicture.asset(
                "assets/icons/home_icon.svg",
                colorFilter: currentIndex.value == 0 ? colorFilter : null,
              ),
            ),


            BottomNavigationBarItem(
              label: "Routine",
              icon: SvgPicture.asset(
                "assets/icons/routine_icon.svg",
                colorFilter: currentIndex.value == 1 ? colorFilter : null,
              ),
            ),


            BottomNavigationBarItem(
              label: "Progress",
              icon: SvgPicture.asset(
                "assets/icons/progress_icon.svg",
                colorFilter: currentIndex.value == 2 ? colorFilter : null,
              ),
            ),


            BottomNavigationBarItem(
              label: "Results",
              icon: SvgPicture.asset(
                "assets/icons/result_icon.svg",
                width: 20.w,
                height: 20.w,
                colorFilter: currentIndex.value == 3 ? colorFilter : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
