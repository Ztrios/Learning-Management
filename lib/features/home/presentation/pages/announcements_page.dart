import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/home/presentation/widgets/item_view/announcement_item_view.dart';
import 'package:learning_management/widgets/app_bars/secondary_app_bar.dart';

class AnnouncementsPage extends StatelessWidget {
  static String get path => "/announcements";
  static String get name => "announcements";

  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
        
              SecondaryAppBar(
                  title: "Announcement"
              ),

              gap12,

              Expanded(
                child: Padding(
                  padding: paddingH16,
                  child: ListView.builder(
                    itemCount: 5,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: paddingBottom12,
                          child: AnnouncementItemView(
                            title: "Exam Instructions Released",
                            content: "Please read all the guidelines carefully before attending the upcoming exams...",
                            backgroundColor: AppColors.deepPurpleAccent,
                            onPressed: () {
                              // Open detailed page
                            },
                          ),
                        );
                      }
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
