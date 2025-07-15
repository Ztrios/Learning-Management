import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/helpers/validation/form_validations.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/authentication/presentation/pages/otp_verification_page.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/text_forms/primary_text_forms_fields.dart';

class ResetPasswordPage extends HookWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          padding: padding24,
          child: Column(
            children: [

              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.blueLight.withValues(alpha: 0.1),
                    child: IconButton(
                        onPressed: ()=> Navigator.pop(context),
                        icon: Padding(
                          padding: paddingLeft4,
                          child: Icon(
                            Icons.arrow_back_ios, color: AppColors.blueLight,),
                        )
                    ),
                  )
                ],
              ),


              gap48,

              Text(
                "Set a new password",
                style: AppTextStyles.titleLarge,
              ),

              gap6,

              Text(
                "Create a new password. Ensure it differs from previous ones for security",
                style: AppTextStyles.caption,
                textAlign: TextAlign.center,
              ),

              gap24,


              PrimaryTextFormsFields(
                title: "Password",
                hintText: "Enter your password",
                textInputType: TextInputType.visiblePassword,
                showObscureButton: true,
                validator: (value)=> FormValidation(
                    validationType: ValidationType.password,
                    formValue: value
                ).validate(),
              ),

              gap16,

              PrimaryTextFormsFields(
                title: "Confirm Password",
                hintText: "Confirm your password",
                textInputType: TextInputType.visiblePassword,
                showObscureButton: true,
                validator: (value){
                  return "";
                },
              ),

              gap24,

              PrimaryButton(
                onPressed: (){},
                text: "Update Password",
              )


            ],
          ),
        ),
      ),
    );
  }
}
