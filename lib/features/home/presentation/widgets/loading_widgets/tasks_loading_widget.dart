import 'package:flutter/material.dart';
import 'package:learning_management/features/home/presentation/widgets/item_view/task_item_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TasksLoadingWidget extends StatelessWidget {
  const TasksLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
        child: ListView.builder(
          itemCount: 7,
            itemBuilder: (context, index){
              return TaskItemView(
                  quantity: 10,
                  type: "ASSIGNMENT",
                  title: "Chapter 1: Instruction",
                  subject: "Mathematics",
                  svgAsset: "assets/images/math_assignment.svg",
                  onTap: (){}
              );
            }
        )
    );
  }
}
