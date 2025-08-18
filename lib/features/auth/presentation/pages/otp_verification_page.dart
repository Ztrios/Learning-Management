import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/helpers/validation/form_validations.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/margins.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/presentation/pages/forget_password_page.dart';
import 'package:learning_management/features/auth/presentation/pages/sign_in_page.dart';
import 'package:learning_management/features/auth/presentation/pages/reset_password_page.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
//import 'package:pinput/pinput.dart';

class OTPVerificationPage extends HookWidget {

  static String get path => "/otp-verification";
  static String get name => "otp-verification";

  const OTPVerificationPage({super.key});

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
                "Check your email",
                style: AppTextStyles.titleLarge,
              ),

              gap6,


              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: AppTextStyles.caption,
                  children: [
                    TextSpan(
                      text: "We sent a reset link to ",
                    ),
                    TextSpan(
                      text: "contact@dscode...com",
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary
                      )
                    ),
                    TextSpan(
                      text: " enter 5 digit code that mentioned in the email",
                    )
                  ]
                ),
              ),

              gap48,
              //
              // Pinput(
              //   length: 5,
              //   separatorBuilder: (index) => const SizedBox(width: 8),
              //   hapticFeedbackType: HapticFeedbackType.lightImpact,
              //   keyboardType: TextInputType.number,
              //   defaultPinTheme: defaultPinTheme,
              //   submittedPinTheme: submittedPinTheme,
              //   //focusedPinTheme: focusedPinTheme,
              //   onCompleted: (pin) {
              //     debugPrint('onCompleted: $pin');
              //   },
              //   onChanged: (value) {
              //     debugPrint('onChanged: $value');
              //   },
              //   validator: (value)=> FormValidation(
              //       validationType: ValidationType.otp,
              //       formValue: value
              //   ).validate(),
              //   cursor: Container(
              //     width: 2.5.w,
              //     margin: margin12,
              //     color: AppColors.blueLight,
              //   ),
              // ),

              gap24,

              PrimaryButton(
                onPressed: ()=> context.pushReplacement(SignInPage.path + ForgetPasswordPage.path + OTPVerificationPage.path + ResetPasswordPage.path),
                text: "Verify Code",
              ),

              gap12,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    "Haven’t got the email yet?",
                    style: AppTextStyles.bodySmall,
                  ),

                  TextButton(
                    onPressed: (){},
                    child: Text(
                        "Resend email",
                        style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            decorationColor: AppColors.blueLight,
                            color: AppColors.blueLight
                        )
                    ),
                  )

                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}


// final defaultPinTheme = PinTheme(
//   width: 56,
//   height: 56,
//   textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
//   decoration: BoxDecoration(
//     border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
//     borderRadius: BorderRadius.circular(20),
//   ),
// );

// final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//   border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
//   borderRadius: BorderRadius.circular(8),
// );
//
// final submittedPinTheme = defaultPinTheme.copyWith(
//   decoration: defaultPinTheme.decoration,
// );