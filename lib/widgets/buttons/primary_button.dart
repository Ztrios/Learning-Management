import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';


class PrimaryButton extends StatelessWidget {
  final bool? isLoading;
  final String? text;
  final double? width;
  final double? height;
  final Alignment? alignment;
  final EdgeInsets? padding;
  final BorderRadius? radius;
  final Color? textColor;
  final Color? background;
  final Color? strokeColor;
  final VoidCallback? onPressed;

  const PrimaryButton({
    super.key,
    this.isLoading,
    this.text,
    this.width,
    this.height,
    this.alignment,
    this.padding,
    this.radius,
    this.textColor,
    this.background,
    this.onPressed,
    this.strokeColor
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width ?? 1.sw,
        height: height ?? 50.h,
        alignment: alignment ?? Alignment.center,
        padding: padding ?? paddingH16,
        decoration: ShapeDecoration(
          color: background ?? AppColors.primary,
          shape: RoundedRectangleBorder(
              borderRadius: radius ?? radius8,
            side: strokeColor != null ? BorderSide(
              width: 1.w,
              color: strokeColor!
            ):BorderSide.none
          ),
        ),
        child: isLoading == true ?
        Center(
            child: SizedBox(
                child: CircularProgressIndicator(
                    color: Colors.white
                )
            )
        ) : Text(
          text ?? "Continue",
          style: AppTextStyles.button.copyWith(color: textColor),
        ),
      ),
    );
  }
}
