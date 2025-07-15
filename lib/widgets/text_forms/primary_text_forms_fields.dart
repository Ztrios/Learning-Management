import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';


class PrimaryTextFormsFields extends HookWidget {
  final bool? showObscureButton;
  final int? minLine;
  final String title;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  final TextInputType? textInputType;

  final VoidCallback? onTap;

  const PrimaryTextFormsFields({
    super.key,
    required this.title,
    this.showObscureButton,
    this.controller,
    this.hintText,
    this.minLine,
    this.validator,
    this.onTap,
    this.textInputType
  });


  @override
  Widget build(BuildContext context) {


    final obscureText = useState<bool>(true);


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

        InkWell(
          onTap: onTap,
          child: TextFormField(
            controller: controller,
            // minLines: minLine,
            // maxLines: minLine,
            enabled: onTap == null,
            style: AppTextStyles.bodyLarge,
            obscureText: showObscureButton == true ? obscureText.value : false,
            keyboardType: textInputType,
            decoration: InputDecoration(
              suffixIcon: showObscureButton == true ? IconButton(
                onPressed: ()=> obscureText.value = !obscureText.value,
                icon: Icon(
                    obscureText.value == true ?
                  Icons.visibility_off : Icons.visibility
                )
              ): null,
              hintText: hintText,
              hintStyle: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.grey
              ),
              border: OutlineInputBorder(
                borderRadius: radius8,
                borderSide: BorderSide(
                    width: 1.2.w,
                    color: AppColors.grey
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: radius8,
                borderSide: BorderSide(
                    width: 1.2.w,
                    color: AppColors.grey
                ),
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
          ),
        )

      ],
    );
  }
}
