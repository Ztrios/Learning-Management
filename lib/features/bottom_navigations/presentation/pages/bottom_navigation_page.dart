import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/features/home/presentation/pages/home_page.dart';
import 'package:learning_management/features/progress/presentation/pages/progress_page.dart';
import 'package:learning_management/features/results/presentation/pages/results_page.dart';

class BottomNavigationPage extends HookWidget {
  static String get path => "/bottom-navigation";

  static String get name => "bottom-navigation";

  const BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState<int>(0);

    final List<Widget> navigationPages = [
      const HomePage(),
      const ProgressPage(),
      const ProgressPage(),
      const ResultsPage()
    ];

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

    return Scaffold(
      backgroundColor: AppColors.background,
      body: navigationPages[currentIndex.value],
      bottomNavigationBar: Container(
        height: 80.h,
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
          onTap: (index) => currentIndex.value = index,
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
