import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/margins.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/widgets/network_image_widget.dart';

class MCQItemView extends StatelessWidget {
  final String? image;
  const MCQItemView({
    super.key,
    this.image
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: marginV6,
      padding: padding12,
      decoration: BoxDecoration(
          borderRadius: radius12,
          border: Border.all(
              color: AppColors.deepOrange
          )
      ),
      child: Column(
        children: [

          Text(
            "Which trigonometric ratio should be used to find the length of the adjacent side?",
            style: AppTextStyles.titleSmall.copyWith(
                fontWeight: FontWeight.w900
            ),
          ),

          if(image != null)
            NetworkImageWidget(
              image ?? "",
            ),

          ...List.generate(4, (index){
            return CheckboxListTile(
              value: index == 1,
              onChanged: (value) {},
              controlAffinity: ListTileControlAffinity
                  .leading,
              title: Text("Option ${index + 1}"),
              activeColor: AppColors.deepGreen,
              contentPadding: padding0,
            );
          }),



        ],
      ),
    );
  }
}
