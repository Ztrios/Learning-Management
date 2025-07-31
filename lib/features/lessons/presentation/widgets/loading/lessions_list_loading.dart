import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learning_management/features/lessons/presentation/widgets/item_view/lession_item_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LessionsListLoading extends HookWidget {
  const LessionsListLoading({super.key});

  @override
  Widget build(BuildContext context) {

    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: 10,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return LessionItemView(
            title: "Lesson $index: Integration",
            isCompleted: index < 3,
            totalQuizzes: 0,
            quizAttends: 0,
            totalAssignments: 0,
            assignmentSubmitted: 0,
          );
        },
      ),
    );
  }
}
