import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';

class SecondaryAppBar extends StatelessWidget {
  final String title;
  const SecondaryAppBar({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingH16,
      child: Row(
        mainAxisAlignment: mainSpaceBetween,
        children: [

          IconButton(
              onPressed: ()=> context.pop(),
              icon: Icon(Icons.arrow_back_ios,color: AppColors.blueLight)
          ),

          Text(
              title,
            style: AppTextStyles.titleMedium.copyWith(
              color: AppColors.blueLight,
              fontWeight: FontWeight.w900
            ),
          ),

          Builder(
            builder: (context) {
              return IconButton(
                  onPressed: ()=> Scaffold.of(context).openEndDrawer(),
                  icon: SvgPicture.asset(
                    "assets/icons/menu_icon.svg",
                  )
              );
            }
          )

        ],
      ),
    );
  }
}
