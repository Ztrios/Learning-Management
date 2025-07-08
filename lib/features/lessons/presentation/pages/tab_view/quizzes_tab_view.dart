import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/features/lessons/presentation/pages/lession_details_page.dart';
import 'package:learning_management/features/lessons/presentation/pages/lessions_page.dart';
import 'package:learning_management/features/lessons/presentation/pages/quiz_submission_page.dart';
import 'package:learning_management/features/lessons/presentation/widgets/item_view/quizzes_item_view.dart';

class QuizzesTabView extends StatelessWidget {
  const QuizzesTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context,index){
          return InkWell(
            onTap: ()=> context.push(LessionsPage.path + LessionDetailsPage.path + QuizSubmissionPage.path),
            child: QuizzesItemView(
              title: "Assignment 1: Trigonometry",
              isCompleted: index < 2,
              status: index >= 2 ? "Missed" : "Submitted",
            ),
          );
        }
    );
  }
}
