import 'package:flutter/material.dart';
import 'package:learning_management/features/lessons/presentation/widgets/item_view/materials_item_view.dart';

class MaterialsTabView extends StatelessWidget {
  const MaterialsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
        itemBuilder: (context, index){
          return MaterialsItemView();
        },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
