import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/authentication/presentation/pages/log_in_page.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/text_forms/primary_text_forms_fields.dart';

class SignUpPage extends StatelessWidget {
  static String get path => "/";
  //static String get path => "/sign-up";
  static String get name => "sign-up";

  const SignUpPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          padding: padding24,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                    
                    
                Text(
                  "Create an account",
                  style: AppTextStyles.titleLarge.copyWith(
                    fontWeight: FontWeight.bold
                  ),
                ),

                gap6,

                Text(
                  "Connect with your friends today!",
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.grey
                  ),
                ),
            
                gap12,

                Column(
                  spacing: 12.w,
                  children: [

                    PrimaryTextFormsFields(
                      title: "Email",
                      hintText: "Enter your email address",
                    ),


                    PrimaryTextFormsFields(
                      title: "Student Name",
                      hintText: "Enter your full name",
                    ),


                    PrimaryTextFormsFields(
                      title: "Father's Name",
                      hintText: "Enter your father's name",
                    ),


                    PrimaryTextFormsFields(
                      title: "Mother's Name",
                      hintText: "Enter your mother's name",
                    ),


                    PrimaryTextFormsFields(
                      title: "Own District",
                      hintText: "Enter your home district",
                    ),


                    PrimaryTextFormsFields(
                      title: "Mobile Number (WhatsApp is connected)",
                      hintText: "Enter your mobile number",
                    ),

                    PrimaryTextFormsFields(
                      title: "Batch Time",
                      hintText: "e.g., 10:00 AM - 12:00 PM",
                    ),



                    PrimaryTextFormsFields(
                      title: "Password",
                      hintText: "Enter your password",
                      showObscureButton: true
                    ),


                    PrimaryTextFormsFields(
                      title: "Confirm Password",
                      hintText: "Confirm your password",
                      showObscureButton: true
                    ),


                  ],
                ),

                gap24,

                PrimaryButton(
                  text: "Sign Up",
                  textColor: Colors.white,
                ),
                

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      "Already have an account? ",
                      style: AppTextStyles.titleSmall.copyWith(
                          decoration: TextDecoration.underline
                      ),
                    ),

                    TextButton(
                      onPressed: ()=> context.go(LogInPage.path),
                      child: Text(
                          "Login",
                          style: AppTextStyles.titleSmall.copyWith(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
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
      ),
    );
  }
}
