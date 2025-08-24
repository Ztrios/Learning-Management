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
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/text_forms/primary_text_forms_fields.dart';

class ResetPasswordPage extends HookWidget {

  static String get path => "/reset-password";
  static String get name => "reset-password";

  final String resetToken;
  const ResetPasswordPage({
    super.key,
    required this.resetToken
  });

  @override
  Widget build(BuildContext context) {

    final formKey = useMemoized(()=> GlobalKey<FormState>());
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();


    void resetPassword() {
      if (formKey.currentState!.validate()) {
        context.read<AuthBloc>().add(ResetPassword(
            resetToken: resetToken,
            newPassword: passwordController.text
        ));
      }
    }


    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          padding: padding24,
          child: Form(
            key: formKey,
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
                  controller: passwordController,
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
                  controller: confirmPasswordController,
                  title: "Confirm Password",
                  hintText: "Confirm your password",
                  textInputType: TextInputType.visiblePassword,
                  showObscureButton: true,
                  validator: (value){
                    if(passwordController.text == value) {
                      return null;
                    } else {
                      return"Confirm password doesn't match!";
                    }
                  },
                ),

                gap24,

                BlocConsumer<AuthBloc, AuthState>(
                  listenWhen: (previous, current)=> previous.resetPasswordStatus.isLoading && current.resetPasswordStatus.isSuccess,
                  listener: (context, state){
                    context.pushReplacementNamed(SignInPage.name);
                  },
                  builder: (context, state) {
                    return PrimaryButton(
                      isLoading: state.resetPasswordStatus.isLoading,
                      onPressed: resetPassword,
                      text: "Update Password",
                    );
                  },
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
