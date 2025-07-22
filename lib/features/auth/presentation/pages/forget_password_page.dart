import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/helpers/validation/form_validations.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/presentation/pages/sign_in_page.dart';
import 'package:learning_management/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/text_forms/primary_text_forms_fields.dart';

class ForgetPasswordPage extends HookWidget {

  static String get path => "/forget-password";
  static String get name => "forget-password";

  const ForgetPasswordPage({super.key});

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
                "Forgot password",
                style: AppTextStyles.titleLarge,
              ),

              gap6,

              Text(
                "Please enter your email to reset the password",
                style: AppTextStyles.caption,
              ),

              gap24,

              PrimaryTextFormsFields(
                title: "Email",
                hintText: "Enter your email address",
                textInputType: TextInputType.emailAddress,
                validator: (value)=> FormValidation(
                    validationType: ValidationType.email,
                    formValue: value
                ).validate(),
              ),

              gap24,

              PrimaryButton(
                onPressed: () => context.push(SignInPage.path + ForgetPasswordPage.path + OTPVerificationPage.path),
                text: "Reset Password",
              )


            ],
          ),
        ),
      ),
    );
  }
}
