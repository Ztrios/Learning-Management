import 'package:flutter/material.dart';
import 'package:learning_management/features/lessons/presentation/widgets/item_view/materials_item_view.dart';
import 'package:learning_management/features/lessons/presentation/widgets/pdf_viewer_widget.dart';
import 'package:learning_management/features/lessons/presentation/widgets/video_player_widget.dart';

class MaterialsTabView extends StatelessWidget {
  const MaterialsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> PdfViewerWidget()));
            },
            child: MaterialsItemView()
          );
        },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
