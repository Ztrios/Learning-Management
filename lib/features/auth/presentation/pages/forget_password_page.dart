import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/helpers/validation/form_validations.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_event.dart';
import 'package:learning_management/features/auth/presentation/pages/sign_in_page.dart';
import 'package:learning_management/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:learning_management/features/auth/presentation/pages/sign_up_page.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/text_forms/primary_text_forms_fields.dart';

class ForgetPasswordPage extends HookWidget {
  static String get path => "/forget-password";

  static String get name => "forget-password";

  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    //final userNameController = useTextEditingController();
    final phoneController = useTextEditingController();
    //final passwordController = useTextEditingController();

    // void resetPassword() {
    //   if (formKey.currentState!.validate()) {
    //     context.read<AuthBloc>().add(
    //       ResetPassword(
    //         userName: userNameController.text.trim(),
    //         password: passwordController.text.trim(),
    //         phone: phoneController.text.trim(),
    //       ),
    //     );
    //   }
    // }


    void sendOtp(){
      if(formKey.currentState!.validate()){
        context.read<AuthBloc>().add(SendOTP(phone: phoneController.text));
      }
    }


    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listenWhen: (previous, current)=> previous.sendingOtpStatus.isLoading && current.sendingOtpStatus.isSuccess,
          listener: (context, state) {
            if(state.sendingOtpStatus.isSuccess){
              context.go("${SignInPage.path + ForgetPasswordPage.path + OTPVerificationPage.path}/${phoneController.text}");
            }
          },
          builder: (context, state){
            return Container(
              width: 1.sw,
              height: 1.sh,
              padding: padding24,
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.blueLight.withValues(
                          alpha: 0.1,
                        ),
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Padding(
                            padding: paddingLeft4,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.blueLight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  gap48,

                  Text("Forgot password", style: AppTextStyles.titleLarge),

                  gap6,

                  Text(
                    "Please enter your phone to reset the password",
                    style: AppTextStyles.caption,
                  ),

                  gap24,

                  Form(
                    key: formKey,
                    child: Column(
                      spacing: 12.w,
                      children: [
                        // PrimaryTextFormsFields(
                        //   controller: userNameController,
                        //   title: "User Name",
                        //   hintText: "Enter your user name",
                        //   textInputType: TextInputType.emailAddress,
                        //   validator: (value) => FormValidation(
                        //     validationType: ValidationType.required,
                        //     formValue: value,
                        //   ).validate(),
                        // ),

                        PrimaryTextFormsFields(
                          controller: phoneController,
                          title: "Phone",
                          hintText: "Enter your phone number",
                          textInputType: TextInputType.emailAddress,
                          validator: (value) => FormValidation(
                            validationType: ValidationType.required,
                            formValue: value,
                          ).validate(),
                        ),

                        // PrimaryTextFormsFields(
                        //   controller: passwordController,
                        //   title: "Password",
                        //   hintText: "Enter your new password",
                        //   showObscureButton: true,
                        //   textInputType: TextInputType.visiblePassword,
                        //   validator: (value) => FormValidation(
                        //     validationType: ValidationType.password,
                        //     formValue: value,
                        //   ).validate(),
                        // ),
                        //
                        // PrimaryTextFormsFields(
                        //   title: "Confirm Password",
                        //   hintText: "Confirm your new password",
                        //   textInputType: TextInputType.visiblePassword,
                        //   showObscureButton: true,
                        //   validator: (value) {
                        //     if (passwordController.text == value) {
                        //       return null;
                        //     } else {
                        //       return "Confirm password doesn't match!";
                        //     }
                        //   },
                        // ),
                      ],
                    ),
                  ),

                  gap24,

                  PrimaryButton(
                    isLoading: state.sendingOtpStatus.isLoading,
                    //onPressed: () => context.push(SignInPage.path + ForgetPasswordPage.path + OTPVerificationPage.path),
                    //onPressed: resetPassword,
                    onPressed: sendOtp,
                    text: "Reset Password",
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account ?",
                        style: AppTextStyles.titleSmall,
                      ),

                      TextButton(
                        onPressed: () => context.go(SignUpPage.path),
                        child: Text(
                          "Sign Up",
                          style: AppTextStyles.titleSmall.copyWith(
                            decoration: TextDecoration.underline,
                            color: AppColors.deepPurpleAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
