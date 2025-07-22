import 'dart:io';
import 'package:collection/collection.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/helpers/format_data/datetime_formatters.dart';
import 'package:learning_management/core/helpers/functions/toast_notifications.dart';
import 'package:learning_management/core/helpers/validation/form_validations.dart';
import 'package:learning_management/core/services/file_picker_services.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_event.dart';
import 'package:learning_management/features/auth/presentation/pages/forget_password_page.dart';
import 'package:learning_management/features/auth/presentation/pages/sign_in_page.dart';
import 'package:learning_management/features/home/presentation/pages/home_page.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/dialogs/time_range_picker_dialog.dart';
import 'package:learning_management/widgets/text_forms/dropdown_text_form_fields.dart';
import 'package:learning_management/widgets/text_forms/primary_text_forms_fields.dart';
import 'package:time_range_picker/time_range_picker.dart';


class SignUpPage extends HookWidget {
  static String get path => "/sign-up";
  static String get name => "sign-up";

  const SignUpPage({super.key});



  @override
  Widget build(BuildContext context) {

    final scrollController = useScrollController();
    final formKey = useMemoized(()=> GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final studentNameController = useTextEditingController();
    final fathersNameController = useTextEditingController();
    final mothersNameController = useTextEditingController();
    final districtController = useTextEditingController();
    final phoneController = useTextEditingController();
    final batchYearController = useMemoized(() => SingleValueDropDownController());
    final sectionController = useMemoized(() => SingleValueDropDownController());
    final passwordController = useTextEditingController();


    final selectedSectionID = useState<int?>(null);
    final picture = useState<File?>(null);

    Future<void> uploadProfilePicture() async {
      picture.value = await FilePickerServices.uploadProfilePicture();
    }

    Future<void> signUp()async{
      if(picture.value != null){
        if(formKey.currentState!.validate()){

          context.read<AuthBloc>().add(SignUp(
              studentPhoto: picture.value!,
              email: emailController.text,
              studentName: studentNameController.text,
              fathersName: fathersNameController.text,
              mothersName: mothersNameController.text,
              district: districtController.text,
              phone: phoneController.text,
              batchYear: batchYearController.dropDownValue!.name,
              section: selectedSectionID.value!.toString(),
              password: passwordController.text
          ));
        }
      }else{
        scrollController.jumpTo(scrollController.position.minScrollExtent);
        ToastNotifications.showErrorToast(
            title: "Empty Profile Picture",
            message: "Profile picture is required.",
            alignment: Alignment.topCenter
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc,AuthState>(
        listener: (context, state){
          if(state.signUpStatus.isSuccess) context.go(SignInPage.path);
        },
        builder: (context,state) {
          return SafeArea(
            child: Container(
              width: 1.sw,
              height: 1.sh,
              padding: padding24,
              child: SingleChildScrollView(
                controller: scrollController,
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

                    gap24,

                    Form(
                      key: formKey,
                      child: Column(
                        spacing: 12.w,
                        children: [


                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [

                              if(picture.value != null)
                              ClipRRect(
                                borderRadius: radiusCircle,
                                child: Image.file(
                                  picture.value!,
                                  width: 120.w,
                                  height: 120.w,
                                  fit: BoxFit.cover,
                                ),
                              )else SvgPicture.asset(
                                "assets/icons/avatar_icon.svg",
                                width: 120.w,
                                height: 120.w,
                              ),

                              Positioned(
                                child: InkWell(
                                  onTap: uploadProfilePicture,
                                  child: CircleAvatar(
                                    radius: 16.r,
                                    backgroundColor: AppColors.blueLight,
                                    child: Icon(
                                        Icons.camera_alt_outlined,
                                        size: 16.sp,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),


                          PrimaryTextFormsFields(
                            controller: emailController,
                            title: "Email",
                            hintText: "Enter your email address",
                            textInputType: TextInputType.emailAddress,
                            validator: (value)=> FormValidation(
                                validationType: ValidationType.email,
                                formValue: value
                            ).validate(),
                          ),


                          PrimaryTextFormsFields(
                            controller: studentNameController,
                            title: "Student Name",
                            hintText: "Enter your full name",
                            textInputType: TextInputType.name,
                            validator: (value)=> FormValidation(
                              validationType: ValidationType.name,
                              formValue: value
                          ).validate(),

                          ),


                          PrimaryTextFormsFields(
                            controller: fathersNameController,
                            title: "Father's Name",
                            hintText: "Enter your father's name",
                            textInputType: TextInputType.name,
                            validator: (value)=> FormValidation(
                                validationType: ValidationType.name,
                                formValue: value
                            ).validate(),
                          ),


                          PrimaryTextFormsFields(
                            controller: mothersNameController,
                            title: "Mother's Name",
                            hintText: "Enter your mother's name",
                            textInputType: TextInputType.name,
                            validator: (value)=> FormValidation(
                                validationType: ValidationType.name,
                                formValue: value
                            ).validate(),
                          ),


                          PrimaryTextFormsFields(
                            controller: districtController,
                            title: "Own District",
                            hintText: "Enter your home district",
                            textInputType: TextInputType.name,
                            validator: (value)=> FormValidation(
                                validationType: ValidationType.required,
                                formValue: value
                            ).validate(),
                          ),


                          PrimaryTextFormsFields(
                            controller: phoneController,
                            title: "Mobile Number (WhatsApp is connected)",
                            hintText: "Enter your mobile number",
                            textInputType: TextInputType.phone,
                            validator: (value)=> FormValidation(
                                validationType: ValidationType.phone,
                                formValue: value
                            ).validate(),
                          ),


                          DropdownTextFormFields(
                            controller: batchYearController,
                            title: "Batch Year",
                            hintText: "Select Year",
                            dropDownList: List.generate(15, (year) =>
                                (2020 + year).toString()),
                            onChanged: (value){
                              context.read<AuthBloc>().add(
                                  GetSections(batchYear: batchYearController
                                      .dropDownValue!.name));
                              sectionController.clearDropDown();
                            },
                          ),


                          DropdownTextFormFields(
                            isLoading: state.status.isLoading,
                            controller: sectionController,
                            title: "Section",
                            hintText: "Select Section",
                            dropDownList: (state.sectionsEntity?.sectionsData?.content).isNotNullAndNotEmpty ?
                            state.sectionsEntity!.sectionsData!.content!.map((section){
                              return section.sectionName ?? "";
                            }).toList(): [],
                            onChanged: (value){
                              selectedSectionID.value = (state.sectionsEntity?.sectionsData?.content).isNotNullAndNotEmpty ?
                              state.sectionsEntity!.sectionsData!.content!.singleWhereOrNull((section) =>
                              section.sectionName == sectionController.dropDownValue?.name)?.id : null;
                            },
                          ),


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


                          PrimaryTextFormsFields(
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

                        ],
                      ),
                    ),

                    gap24,

                    PrimaryButton(
                      isLoading: state.signUpStatus.isLoading,
                      onPressed: signUp,
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
                          onPressed: ()=> context.go(SignInPage.path),
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
          );
        }
      ),
    );
  }
}
