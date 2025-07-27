import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/widgets/empty_widget.dart';

class EmptyResultsWidget extends StatelessWidget {
  const EmptyResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 380.h,
      padding: padding24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: radius16,
        color: AppColors.deepGreen,
      ),
      child: EmptyWidget(
        title: "No Results Found!",
        message: "Results are not available at this moment.",
        textColor: Colors.white,
      ),
    );
  }
}
