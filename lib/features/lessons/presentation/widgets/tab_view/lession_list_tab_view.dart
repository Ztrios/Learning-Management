import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/features/lessons/presentation/pages/lession_content_page.dart';
import 'package:learning_management/features/lessons/presentation/pages/lessions_page.dart';
import 'package:learning_management/features/lessons/presentation/widgets/item_view/lession_item_view.dart';

class LessionListTabView extends StatelessWidget {
  const LessionListTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: ()=> context.push(LessionsPage.path + LessionContentPage.path),
          child: LessionItemView(
            title: "Lesson $index: Integration",
            isCompleted: index < 3,
          ),
        );
      },
    );
  }
}
