import 'package:flutter/material.dart';
import 'package:learning_management/features/home/data/models/todays_class_model.dart';
import 'package:learning_management/features/routine/presentation/widgets/item_view/routine_list_item_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ClassRoutinesLoadingWidget extends StatelessWidget {
  const ClassRoutinesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
          itemCount: 5,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return RoutineListItemView(
              isActive: false,
              startTime: "2.00 PM",
              endTime: "3.00 PM",
              subject: "English",
              topic: "Chapter 2: Introduction",
              meetingId: "Z28ASFASI",
              meetingPassword: "152642302",
              meetingLink: "https://www.domain.com",
              teacherName: "Sajib Hasan",
            );
          }
      ),
    );
  }
}
