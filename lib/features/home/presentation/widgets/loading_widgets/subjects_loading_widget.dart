import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/home/presentation/widgets/item_view/subject_item_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SubjectsLoadingWidget extends StatelessWidget {
  const SubjectsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        width: 1.sw,
        height: 170.h,
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Text(
              "Subjects",
              style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.bold
              ),
            ),

            Text(
              "Recommendations for you",
              style: AppTextStyles.caption,
            ),

            gap12,

            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SubjectItemView(
                      subject: "English",
                      svgIcon: "assets/icons/history_icon.svg",
                      background: Colors.grey,
                      shapeColor: Colors.grey,
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
