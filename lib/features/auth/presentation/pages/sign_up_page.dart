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
import 'package:learning_management/core/helpers/helpers.dart';
import 'package:learning_management/core/helpers/toast_notification/toast_notifications.dart';
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
import 'package:learning_management/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:learning_management/features/auth/presentation/pages/sign_in_page.dart';
import 'package:learning_management/features/home/presentation/pages/home_page.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/dialogs/time_range_picker_dialog.dart';
import 'package:learning_management/widgets/text_forms/dropdown_text_form_fields.dart';
import 'package:learning_management/widgets/text_forms/primary_text_forms_fields.dart';
//import 'package:time_range_picker/time_range_picker.dart';


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
    final genderController = useMemoized(() => SingleValueDropDownController());
    final batchYearController = useMemoized(() => SingleValueDropDownController());
    final standardsController = useMemoized(() => SingleValueDropDownController());
    final sectionController = useMemoized(() => SingleValueDropDownController());
    final passwordController = useTextEditingController();


    final selectedStandardsID = useState<int?>(null);
    final selectedSectionID = useState<int?>(null);
    final picture = useState<File?>(null);

    final checkedTerms = useState<bool>(false);

    Future<void> uploadProfilePicture() async {
      picture.value = await FilePickerServices.uploadProfilePicture();
    }

    Future<void> signUp()async{

      if(!checkedTerms.value){
        ToastNotifications.showErrorToast(
          title: "Agreement Required",
          message: "You must agree to the Terms of Use and Privacy Policy",
          alignment: Alignment.topCenter
        );
        return;
      }

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
              gender: genderController.dropDownValue!.name.toUpperCase(),
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


    useEffect((){
      Future.microtask((){
        context.read<AuthBloc>().add(GetStandards());
      });
      return null;
    },[]);


    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc,AuthState>(
        listenWhen: (previous, current)=> previous.signUpStatus.isLoading,
        listener: (context, state){

          if(state.signUpStatus.isError){
            ToastNotifications.showErrorToast(
                title: "Failed.Try again!",
                message: "You can't accomplish sign up."
            );
          }
          //
          // if(state.signInStatus.isError){
          //   ToastNotifications.showErrorToast(
          //       title: "Failed.Try again!",
          //       message: "Your sign in is failed."
          //   );
          // }

          // if(state.signUpStatus.isSuccess && state.signInStatus.isSuccess){
          //   context.go(HomePage.path);
          // }else if(state.signUpStatus.isSuccess){
          //   context.go(SignInPage.path);
          // }

          if(state.signUpStatus.isSuccess){
            //context.go("${SignInPage.path}${ForgetPasswordPage.path}${OTPVerificationPage.path}/${phoneController.text}/true");
            context.pushNamed(OTPVerificationPage.name, pathParameters: {
              "phone" : phoneController.text,
              "fromSignUp": "true"
            });
          }

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
                            controller: genderController,
                            title: "Gender",
                            hintText: "Select Gender",
                            dropDownList: [
                              "Male",
                              "Female",
                              "Other"
                            ],
                            onChanged: (value){

                            },
                          ),


                          DropdownTextFormFields(
                            controller: standardsController,
                            title: "Class",
                            hintText: "Select Class",
                            dropDownList: (state.standardsEntity?.standardsData?.content).isNotNullAndNotEmpty ?
                            state.standardsEntity!.standardsData!.content!.map((standard){
                              return standard.name ?? "";
                            }).toList(): [],
                            onChanged: (value){
                              selectedStandardsID.value = (state.standardsEntity?.standardsData?.content).isNotNullAndNotEmpty ?
                              state.standardsEntity!.standardsData!.content!.singleWhereOrNull((standard) =>
                              standard.name == standardsController.dropDownValue?.name)?.id : null;
                              batchYearController.clearDropDown();
                              sectionController.clearDropDown();
                            },
                          ),


                          if(selectedStandardsID.value != null)
                          DropdownTextFormFields(
                            controller: batchYearController,
                            title: "Batch Year",
                            hintText: "Select Year",
                            dropDownList: List.generate(15, (year) =>
                                (2020 + year).toString()),
                            onChanged: (value){
                              if(batchYearController.dropDownValue?.name != null){
                                Map<String,dynamic> query = {
                                  "yearBatch" : batchYearController.dropDownValue?.name ?? "",
                                  "standardId" : selectedStandardsID.value
                                };
                                context.read<AuthBloc>().add(GetSections(query: query));
                                sectionController.clearDropDown();
                              }
                            },
                          ),

                          if(batchYearController.dropDownValue?.name != null && (state.sectionsEntity?.sectionsData?.content).isNotNullAndNotEmpty)
                            DropdownTextFormFields(
                            isLoading: state.status.isLoading,
                            controller: sectionController,
                            title: "Section",
                            hintText: "Select Section",
                            dropDownList: state.sectionsEntity!.sectionsData!.content!.map((section){
                              return section.sectionName ?? "";
                            }).toList(),
                            onChanged: (value){
                              selectedSectionID.value = state.sectionsEntity!.sectionsData!.content!.singleWhereOrNull((section) =>
                              section.sectionName == sectionController.dropDownValue?.name)?.id;
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

                    Row(
                      children: [
                        Checkbox(
                            value: checkedTerms.value,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: AppColors.grey),
                              borderRadius: BorderRadius.circular(6), // Rounded corners
                            ),
                            activeColor: AppColors.blueLight,
                            onChanged: (value)=> checkedTerms.value = value ?? false
                        ),


                        RichText(
                          text: TextSpan(
                            text: "I agree to the ",
                              style: AppTextStyles.caption.copyWith(
                                  color: AppColors.textPrimary
                              ),
                            children: [
                              WidgetSpan(
                                child: InkWell(
                                  onTap: ()=> Helpers.launchUri(uri: ""),
                                  child: Text(
                                    "Terms of use",
                                    style: AppTextStyles.caption.copyWith(
                                        color: AppColors.blueLight,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                )
                              ),

                              TextSpan(
                                text: " And ",
                                style: AppTextStyles.caption.copyWith(
                                    color: AppColors.textPrimary
                                ),
                              ),

                              WidgetSpan(
                                  child: InkWell(
                                    onTap: ()=> Helpers.launchUri(uri: ""),
                                    child: Text(
                                      "Privacy Policy.",
                                      style: AppTextStyles.caption.copyWith(
                                          color: AppColors.blueLight,
                                          decoration: TextDecoration.underline
                                      ),
                                    ),
                                  )
                              )

                            ]
                          )
                        )
                      ],
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
                          style: AppTextStyles.titleSmall,
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
