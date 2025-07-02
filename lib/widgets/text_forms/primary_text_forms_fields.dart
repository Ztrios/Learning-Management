import 'package:flutter/material.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
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
              title.toUpperCase(),
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
            filled: true,
            fillColor: AppColors.greyBackground,
            border: OutlineInputBorder(
                borderRadius: radius8,
                borderSide: BorderSide.none
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: radius8,
                borderSide: BorderSide.none
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: radius8,
                borderSide: BorderSide.none
            ),
            errorBorder:OutlineInputBorder(
                borderRadius: radius8,
                borderSide: BorderSide.none
            ),

          ),
          validator: validator,
        )

      ],
    );
  }
}
