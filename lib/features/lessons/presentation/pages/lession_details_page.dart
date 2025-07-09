import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';
import 'package:learning_management/features/lessons/presentation/pages/tab_bar/lession_details_tab_bar.dart';
import 'package:learning_management/features/lessons/presentation/widgets/item_view/lession_item_view.dart';
import 'package:learning_management/widgets/app_bars/secondary_app_bar.dart';
import 'package:learning_management/widgets/drawer/custom_drawer.dart';

class LessionDetailsPage extends StatelessWidget {

  static String get path => "/lession-details";
  static String get name => "lession-details";

  const LessionDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
        
              const SecondaryAppBar(
                title: "Lesson 1: Integration",
              ),

              Expanded(
                child: Container(
                  width: 1.sw,
                  height: 1.sh,
                  padding: paddingH24,
                  child: Column(
                    children: [

                      LessionItemView(
                        title: "Lesson 1: Integration",
                        isCompleted: true
                      ),

                      Expanded(
                        child: LessionContentTabBar(),
                      )

                    ],
                  ),
                ),
              )
        
        
            ],
          ),
        ),
      ),
    );
  }
}
