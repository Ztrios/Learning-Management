import 'package:flutter/material.dart';
import 'package:learning_management/features/lessons/presentation/widgets/item_view/quizzes_item_view.dart';

class QuizzesTabView extends StatelessWidget {
  const QuizzesTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context,index){
          return QuizzesItemView(
            title: "Assignment 1: Trigonometry",
            isCompleted: index < 2,
            status: index >= 2 ? "Missed" : "Submitted",
          );
        }
    );
  }
}
