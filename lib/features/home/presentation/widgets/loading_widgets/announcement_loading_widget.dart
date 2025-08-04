import 'package:flutter/material.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/features/home/presentation/widgets/item_view/announcement_item_view.dart';
import 'package:learning_management/features/home/presentation/widgets/section_header.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnnouncementLoadingWidget extends StatelessWidget {
  const AnnouncementLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [

          SectionHeader(
            title: "Announcement",
            onPressed: (){},
          ),

          AnnouncementItemView(
            isExpanded: false,
            backgroundColor: AppColors.deepPurpleAccent,
            title: "Notice for Change in Exam Schedule",
            content:
            "This is to inform you that the Mid-Term Exam will be held from August 5 to August 12, 2025. "
                "Please check your exam schedule, bring your admit card and necessary materials, and arrive at least 15 minutes early.",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
