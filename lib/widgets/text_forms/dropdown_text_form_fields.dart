import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/helpers/validation/form_validations.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/decoration.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';

class DropdownTextFormFields extends StatelessWidget {
  final String title;
  final String hintText;
  final bool? enableSearch;
  final bool? clearOption;
  final List<String> dropDownList;
  final SingleValueDropDownController controller;
  final Function(dynamic)? onChanged;
  const DropdownTextFormFields({
    super.key,
    this.clearOption,
    this.enableSearch,
    this.onChanged,
    required this.title,
    required this.hintText,
    required this.dropDownList,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: mainStart,
          children: [
            Text(
              title,
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.grey),
            ),
          ],
        ),

        gap4,

        DropDownTextField(
          controller: controller,
          clearOption: clearOption ?? false,
          enableSearch: enableSearch ?? dropDownList.length > 10,
          textStyle: AppTextStyles.bodyLarge,
          searchDecoration: const InputDecoration(
            hintText: "Search Item",
          ),
          textFieldDecoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.grey),
            border: primaryInputBorder,
            disabledBorder: primaryInputBorder,
            enabledBorder: primaryInputBorder,
            focusedBorder: primaryInputBorder,
            errorBorder: primaryInputBorder,
          ),
          listTextStyle: AppTextStyles.bodyMedium,
          validator: (value) => FormValidation(
            validationType: ValidationType.required,
            formValue: value,
          ).validate(),
          dropDownItemCount: 6,
          dropdownRadius: 6.r,
          dropDownList: dropDownList.map((item){
              return DropDownValueModel(
                  name: item,
                  value: item,
              );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
