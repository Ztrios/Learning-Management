import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/features/home/presentation/widgets/item_view/subject_item_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SubjectsLoadingWidget extends StatelessWidget {
  const SubjectsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 120.h,
      child: Skeletonizer(
        enabled: true,
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
    );
  }
}
