import 'package:flutter/material.dart';
import 'package:learning_management/features/subject_details/presentation/widgets/item_view/mcq_item_view.dart';

class McqListView extends StatelessWidget {
  const McqListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index) =>
              MCQItemView(
                image: index.isEven ? "https://media.geeksforgeeks.org/wp-content/uploads/20220905181228/FormationofMagnesiumChloride.jpg" : null
              )
      ),
    );
  }
}
