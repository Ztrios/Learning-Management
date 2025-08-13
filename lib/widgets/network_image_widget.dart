import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';

class NetworkImageWidget extends StatelessWidget {
  final String url;
  final bool showPlayButton;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;

  const NetworkImageWidget(this.url, {
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.showPlayButton = false
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? radius6,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: url,
            width: width,
            height: height,
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return SvgPicture.asset(
                  "assets/icons/avatar_icon.svg"
              );
            },
            errorWidget: (context, url, error) {
              return SvgPicture.asset(
                "assets/icons/avatar_icon.svg"
              );
            },
          ),

          if(showPlayButton)
            Icon(
                Icons.play_arrow_rounded,
                color: AppColors.blueLight,
              size: 40.sp,
            )

        ],
      ),
    );
  }
}
