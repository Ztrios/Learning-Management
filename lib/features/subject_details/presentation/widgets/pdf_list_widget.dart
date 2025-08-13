import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/helpers/helpers.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/margins.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';

class PdfListWidget extends StatelessWidget {
  final String title;
  final List<String> pdfUrls;
  const PdfListWidget({
    super.key,
    required this.title,
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
                mainAxisAlignment: mainStart,
                children: List.generate(pdfUrls.length, (index){
                  return Padding(
                    padding: padding10,
                    child: InkWell(
                      onTap: ()=> Helpers.launchUri(uri: pdfUrls[index]),
                      child: Column(
                        children: [
                          Container(
                            width: 110.w,
                            height: 90.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.grey.withValues(alpha: 0.1),
                              borderRadius: radius6,
                            ),
                            child: Image.asset(
                              "assets/icons/pdf_icon.png",
                              width: 40.w,
                              height: 40.w,
                            ),
                          ),

                          gap6,

                          Text(
                           "${title.length > 10 ? "${title.substring(0,10)}.." : title} pdf ${index+1}"
                          )

                        ],
                      ),
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
