import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learning_management/features/lessons/presentation/widgets/item_view/exams_item_view.dart';
import 'package:learning_management/features/lessons/presentation/widgets/item_view/lession_item_view.dart';

class ExamListTabView extends StatelessWidget {
  const ExamListTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ExamItemView(
          showStar: Random().nextInt(10).isOdd,
          isCompleted: index < 3,
          title: "Monthly exam ${index+1}: April",
        );
      },
    );
  }
}
