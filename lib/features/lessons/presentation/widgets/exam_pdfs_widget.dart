import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/margins.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';

class ExamPdfsWidget extends StatelessWidget {
  final List<String> pdfUrls;
  const ExamPdfsWidget({
    super.key,
    required this.pdfUrls
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 1.sw,
        child: Column(
          children: [

            gap6,

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: pdfUrls.map((url){
                  return Container(
                    width: 110.w,
                    height: 90.h,
                    alignment: Alignment.center,
                    margin: marginRight10,
                    decoration: BoxDecoration(
                      color: AppColors.grey.withValues(alpha: 0.1),
                      borderRadius: radius6,
                    ),
                    child: Image.asset(
                      "assets/icons/pdf_icon.png",
                      width: 40.w,
                      height: 40.w,
                    ),
                  );
                }).toList(),
              ),
            ),

            gap6
          ],
        ),
      );
  }
}
