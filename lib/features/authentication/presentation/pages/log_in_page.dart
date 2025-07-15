import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/helpers/validation/form_validations.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/bottom_navigations/presentation/pages/bottom_navigation_page.dart';
import 'package:learning_management/features/home/presentation/pages/home_page.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/text_forms/primary_text_forms_fields.dart';

class LogInPage extends HookWidget {
  static String get path => "/login";
  static String get name => "login";

  const LogInPage({super.key});



  @override
  Widget build(BuildContext context) {

    final formKey = useMemoized(()=> GlobalKey<FormState>());

    Future<void> logIn() async {
      if(formKey.currentState!.validate()){
        context.push(HomePage.path);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          padding: padding24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              gap48,

              Text(
                "Hi, Welcome Back! 👋",
                style: AppTextStyles.titleLarge.copyWith(
                    fontWeight: FontWeight.bold
                ),
              ),

              gap24,

              Form(
                key: formKey,
                child: Column(
                  spacing: 12.w,
                  children: [

                    PrimaryTextFormsFields(
                      title: "Email",
                      hintText: "Enter your email address",
                      textInputType: TextInputType.emailAddress,
                      validator: (value)=> FormValidation(
                          validationType: ValidationType.email,
                          formValue: value
                      ).validate(),
                    ),


                    PrimaryTextFormsFields(
                      title: "Password",
                      hintText: "Enter your password",
                      showObscureButton: true,
                      textInputType: TextInputType.visiblePassword,
                      validator: (value)=> FormValidation(
                          validationType: ValidationType.password,
                          formValue: value
                      ).validate(),
                    ),

                  ],
                ),
              ),

              Row(
                children: [
                  Checkbox(
                      value: true,
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.grey),
                        borderRadius: BorderRadius.circular(6), // Rounded corners
                      ),
                      activeColor: AppColors.blueLight,
                      onChanged: (value){}
                  ),

                  Text(
                    "Remember Me",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textPrimary
                    ),
                  ),

                  const Spacer(),

                  TextButton(
                    onPressed: (){},
                    child: Text(
                      "Forgot Password?",
                      style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.errorRed.withValues(alpha: 0.7)
                      )
                    )
                  )
                ],
              ),

              gap24,

              PrimaryButton(
                onPressed: logIn,
                text: "Login",
                textColor: Colors.white,
              ),


              const Spacer(),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    "Don’t have an account ?",
                    style: AppTextStyles.titleSmall,
                  ),

                  TextButton(
                    onPressed: (){},
                    child: Text(
                        "Sign Up",
                        style: AppTextStyles.titleSmall.copyWith(
                            decoration: TextDecoration.underline,
                            color: AppColors.deepPurpleAccent
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
