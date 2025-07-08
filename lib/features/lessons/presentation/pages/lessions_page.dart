import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/lessons/presentation/widgets/lession_header_widget.dart';
import 'package:learning_management/features/lessons/presentation/widgets/tab_bar/lession_tab_bar.dart';
import 'package:learning_management/widgets/app_bars/secondary_app_bar.dart';


class LessionPageExtraParams{
  final Color shapeColor;
  final Color background;

  const LessionPageExtraParams({
    required this.background,
    required this.shapeColor
  });

}

class LessionsPage extends StatelessWidget {
  static String get path => "/lession";
  static String get name => "lession";

  final String subject;
  final String subjectIcon;
  final Color shapeColor;
  final Color background;

  const LessionsPage({
    super.key,
    required this.subject,
    required this.subjectIcon,
    required this.background,
    required this.shapeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SecondaryAppBar(),
            Expanded(
              child: Container(
                width: 1.sw,
                padding: padding24,
                child: Column(
                  children: [

                    HeaderCard(
                      subject: subject,
                      subjectIcon: subjectIcon,
                      shapeColor: shapeColor,
                      background: background,
                    ),

                    gap6,

                    const Expanded(
                        child: LessionTabBar()
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

