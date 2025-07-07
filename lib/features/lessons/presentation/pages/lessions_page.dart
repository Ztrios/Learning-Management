import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/widgets/app_bars/secondary_app_bar.dart';



class LessionPageExtraParams{
  final Color shapeColor;
  final Color background;

  const LessionPageExtraParams({
    required this.background,
    required this.shapeColor
  });

}

class LessionsPage extends StatelessWidget {
  static String get path => "/lession";
  static String get name => "lession";

  final String subject;
  final String subjectIcon;
  final Color shapeColor;
  final Color background;

  const LessionsPage({
    super.key,
    required this.subject,
    required this.subjectIcon,
    required this.background,
    required this.shapeColor
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [

            SecondaryAppBar(),

            Expanded(
              child: Container(
                width: 1.sw,
                height: 1.sh,
                padding: padding24,
                child: Column(
                  children: [

                    Padding(
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
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [

                                  SvgPicture.asset(
                                      subjectIcon
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
                                top: -60,
                                right: -30,
                                child: SvgPicture.asset(
                                  "assets/images/draw_shape.svg",
                                  colorFilter: ColorFilter.mode(
                                      shapeColor,
                                      BlendMode.srcIn
                                  ),
                                )
                            ),

                          ],
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
