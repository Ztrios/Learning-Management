import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';

class SubjectItemView extends StatelessWidget {
  final String svgIcon;
  final String subject;
  final Color background;
  final Color shapeColor;

  const SubjectItemView({
    super.key,
    required this.svgIcon,
    required this.subject,
    required this.background,
    required this.shapeColor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingRight12,
      child: ClipRRect(
        borderRadius: radius16,
        child: Stack(
          children: [
            Container(
              width: 150.w,
              height: 120.h,
              padding: padding16,
              color: background,
              child: Column(
                crossAxisAlignment: crossStart,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  SvgPicture.asset(
                      svgIcon,
                    width: 30.w,
                    height: 30.w,
                  ),

                  Text(
                    subject,
                    style: AppTextStyles.titleMedium.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  )

                ],
              ),
            ),


            Positioned(
                top: -70,
                right: -40,
                child: SvgPicture.asset(
                  "assets/images/draw_shape.svg",
                  colorFilter: ColorFilter.mode(
                      shapeColor,
                      BlendMode.srcIn
                  ),
                )
            ),

            Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.more_vert,color: Colors.white)
                ),
            ),

          ],
        ),
      ),
    );
  }
}
