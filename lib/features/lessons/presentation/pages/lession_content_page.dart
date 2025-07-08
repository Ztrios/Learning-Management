import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';
import 'package:learning_management/features/lessons/presentation/pages/tab_bar/lession_content_tab_bar.dart' show LessionContentTabBar;
import 'package:learning_management/features/lessons/presentation/widgets/item_view/lession_item_view.dart';
import 'package:learning_management/widgets/app_bars/secondary_app_bar.dart';

class LessionContentPage extends StatelessWidget {

  static String get path => "/lession-content";
  static String get name => "lession-content";

  const LessionContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
        
              const SecondaryAppBar(),

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
                          child: LessionContentTabBar()
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
