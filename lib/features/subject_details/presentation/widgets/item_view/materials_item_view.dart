import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/helpers/helpers.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/margins.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/widgets/network_image_widget.dart';

class MaterialsItemView extends StatelessWidget {
  final String url;

  const MaterialsItemView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: padding12,
      decoration: BoxDecoration(
        borderRadius: radius4,
          border: Border.all(
              width: 1,
              color: AppColors.grey,
          )
      ),
      child: Row(
        children: [

          Icon(Icons.file_copy_outlined),

          gap12,

          Expanded(
            child: Text(
              Uri.parse(url).path.split("/").last,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
