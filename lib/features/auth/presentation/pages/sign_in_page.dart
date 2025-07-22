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
import 'package:learning_management/features/auth/presentation/pages/forget_password_page.dart';
import 'package:learning_management/features/auth/presentation/pages/sign_up_page.dart';
import 'package:learning_management/features/bottom_navigation/presentation/pages/bottom_navigation_page.dart';
import 'package:learning_management/features/home/presentation/pages/home_page.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/text_forms/primary_text_forms_fields.dart';

class SignInPage extends HookWidget {
  static String get path => "/sign-in";
  static String get name => "sign-in";

  const SignInPage({super.key});



  @override
  Widget build(BuildContext context) {

    final formKey = useMemoized(()=> GlobalKey<FormState>());
    final userNameController = useTextEditingController();
    final passwordController = useTextEditingController();

    Future<void> logIn() async {
      if(formKey.currentState!.validate()){
        context.read<AuthBloc>().add(SignIn(
            userName: userNameController.text.trim(),
            password: passwordController.text
        ));
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context,state){
          if(state.signInStatus.isSuccess) context.go(HomePage.path);
        },
        builder: (context, state) {
          return SafeArea(
            child: Container(
              width: 1.sw,
              height: 1.sh,
              padding: padding24,
              child: SingleChildScrollView(
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
                            controller: userNameController,
                            title: "User Name",
                            hintText: "Enter your User Name",
                            textInputType: TextInputType.emailAddress,
                            validator: (value)=> FormValidation(
                                validationType: ValidationType.required,
                                formValue: value
                            ).validate(),
                          ),


                          PrimaryTextFormsFields(
                            controller: passwordController,
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
                          onPressed: ()=> context.pushNamed(ForgetPasswordPage.name),
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
                      isLoading: state.signInStatus.isLoading,
                      onPressed: logIn,
                      text: "Login",
                      textColor: Colors.white,
                    ),


                    gap6,


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(
                          "Don’t have an account ?",
                          style: AppTextStyles.titleSmall,
                        ),

                        TextButton(
                          onPressed: ()=> context.go(SignUpPage.path),
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
      ),
    );
  }
}
