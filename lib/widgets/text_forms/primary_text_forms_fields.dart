import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';

import '../../core/utils/ui_helpers/spacing.dart';

class PrimaryTextFormsFields extends StatelessWidget {
  final int? minLine;
  final String title;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const PrimaryTextFormsFields({
    super.key,
    required this.title,
    this.controller,
    this.hintText,
    this.minLine,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [

        Row(
          mainAxisAlignment: mainStart,
          children: [
            Text(
              title,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.grey
              ),
            ),
          ],
        ),

        gap4,

        TextFormField(
          controller: controller,
          minLines: minLine,
          maxLines: minLine,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.grey
            ),
            border: OutlineInputBorder(
                borderRadius: radius8,
                borderSide: BorderSide.none
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: radius8,
                borderSide: BorderSide(
                  width: 1.2.w,
                  color: AppColors.grey
                ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: radius8,
              borderSide: BorderSide(
                  width: 1.2.w,
                  color: AppColors.grey
              ),
            ),
            errorBorder:OutlineInputBorder(
              borderRadius: radius8,
              borderSide: BorderSide(
                  width: 1.2.w,
                  color: AppColors.grey
              ),
            ),

          ),
          validator: validator,
        )

      ],
    );
  }
}
