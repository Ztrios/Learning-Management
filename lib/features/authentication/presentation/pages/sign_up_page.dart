import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/helpers/format_data/datetime_formatters.dart';
import 'package:learning_management/core/helpers/functions/toast_notifications.dart';
import 'package:learning_management/core/helpers/validation/form_validations.dart';
import 'package:learning_management/core/services/file_picker_services.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/authentication/presentation/pages/log_in_page.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/dialogs/time_range_picker_dialog.dart';
import 'package:learning_management/widgets/text_forms/primary_text_forms_fields.dart';
import 'package:time_range_picker/time_range_picker.dart';


class SignUpPage extends HookWidget {
  static String get path => "/";
  //static String get path => "/sign-up";
  static String get name => "sign-up";

  const SignUpPage({super.key});



  @override
  Widget build(BuildContext context) {

    final scrollController = useScrollController();
    final formKey = useMemoized(()=> GlobalKey<FormState>());
    final batchTimeController = useTextEditingController();
    final picture = useState<File?>(null);

    Future<void> uploadProfilePicture() async {
      picture.value = await FilePickerServices.uploadProfilePicture();
    }

    Future<void> signUp()async{
      if(picture.value != null){
        if(formKey.currentState!.validate()){
          context.go(LogInPage.path);
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
      body: SafeArea(
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
                        title: "Email",
                        hintText: "Enter your email address",
                        validator: (value)=> FormValidation(
                            validationType: ValidationType.email,
                            formValue: value
                        ).validate(),
                      ),


                      PrimaryTextFormsFields(
                        title: "Student Name",
                        hintText: "Enter your full name",
                        validator: (value)=> FormValidation(
                          validationType: ValidationType.name,
                          formValue: value
                      ).validate(),

                      ),


                      PrimaryTextFormsFields(
                        title: "Father's Name",
                        hintText: "Enter your father's name",
                        validator: (value)=> FormValidation(
                            validationType: ValidationType.name,
                            formValue: value
                        ).validate(),
                      ),


                      PrimaryTextFormsFields(
                        title: "Mother's Name",
                        hintText: "Enter your mother's name",
                        validator: (value)=> FormValidation(
                            validationType: ValidationType.name,
                            formValue: value
                        ).validate(),
                      ),


                      PrimaryTextFormsFields(
                        title: "Own District",
                        hintText: "Enter your home district",
                        validator: (value)=> FormValidation(
                            validationType: ValidationType.required,
                            formValue: value
                        ).validate(),
                      ),


                      PrimaryTextFormsFields(
                        title: "Mobile Number (WhatsApp is connected)",
                        hintText: "Enter your mobile number",
                        validator: (value)=> FormValidation(
                            validationType: ValidationType.phone,
                            formValue: value
                        ).validate(),
                      ),

                      PrimaryTextFormsFields(
                        controller: batchTimeController,
                        onTap: () async {
                          TimeRange timeRange = await showTimeRangePickerDialog(context);
                          batchTimeController.text = DateTimeFormatters.formatTimeRange(context, timeRange);
                        },
                        title: "Batch Time",
                        hintText: "e.g., 10:00 AM - 12:00 PM",
                        validator: (value)=> FormValidation(
                            validationType: ValidationType.required,
                            formValue: value
                        ).validate(),
                      ),



                      PrimaryTextFormsFields(
                        title: "Password",
                        hintText: "Enter your password",
                        showObscureButton: true,
                        validator: (value)=> FormValidation(
                            validationType: ValidationType.password,
                            formValue: value
                        ).validate(),
                      ),


                      PrimaryTextFormsFields(
                        title: "Confirm Password",
                        hintText: "Confirm your password",
                        showObscureButton: true,
                        validator: (value){
                          return "";
                        },
                      ),

                      // gap2,
                      //
                      // InkWell(
                      //   onTap: uploadProfilePciture,
                      //   child: DottedBorder(
                      //     options: RoundedRectDottedBorderOptions(
                      //       dashPattern: [5, 5],
                      //       strokeWidth: 2,
                      //       color: AppColors.blueLight,
                      //       strokeCap: StrokeCap.round,
                      //       radius: Radius.circular(10.r),
                      //     ),
                      //     child: SizedBox(
                      //       width: 1.sw,
                      //       height: 100.h,
                      //       child: Column(
                      //         crossAxisAlignment: crossCenter,
                      //         mainAxisAlignment: mainCenter,
                      //         children: [
                      //
                      //           Icon(Icons.upload,color: AppColors.blueLight, size: 35.sp),
                      //
                      //           Text(
                      //             "Click to upload your picture",
                      //             style: AppTextStyles.titleSmall,
                      //           ),
                      //
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // )


                    ],
                  ),
                ),

                gap24,

                PrimaryButton(
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
