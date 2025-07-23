import 'package:flutter/material.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/features/home/presentation/widgets/item_view/announcement_item_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnnouncementLoadingWidget extends StatelessWidget {
  const AnnouncementLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      key: UniqueKey(),
      child: AnnouncementItemView(
        backgroundColor: AppColors.grey,
        title: "Notice for Change in Exam Schedule",
        content: "This is to inform you that the Mid-Term Exam will be held from August 5 to August 12, 2025. ",
        onPressed: () {},
      ),
    );
  }
}
