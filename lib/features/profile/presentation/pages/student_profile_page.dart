import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/helpers/validation/form_validations.dart';
import 'package:learning_management/core/services/file_picker_services.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/data/models/sign_in_model.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/profile/data/models/student_profile_model.dart';
import 'package:learning_management/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:learning_management/features/profile/presentation/bloc/profile_event.dart';
import 'package:learning_management/features/profile/presentation/widgets/profile_header_widget.dart';
import 'package:learning_management/widgets/app_bars/secondary_app_bar.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/drawer/custom_drawer.dart';
import 'package:learning_management/widgets/error_widget/error_widget.dart';
import 'package:learning_management/widgets/network_image_widget.dart';
import 'package:learning_management/widgets/text_forms/primary_text_forms_fields.dart';
import 'package:skeletonizer/skeletonizer.dart';

class StudentProfilePage extends HookWidget {
  static String get path => "/student-profile";

  static String get name => "student-profile";

  const StudentProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final passwordFormKey = useMemoized(() => GlobalKey<FormState>());

    final selectedPicture = useState<File?>(null);

    final emailController = useTextEditingController();
    final studentNameController = useTextEditingController();
    final fathersNameController = useTextEditingController();
    final mothersNameController = useTextEditingController();
    final districtController = useTextEditingController();
    final phoneController = useTextEditingController();
    final passwordController = useTextEditingController();


    Future<void> uploadProfilePicture() async {
      selectedPicture.value = await FilePickerServices.uploadProfilePicture();
    }

    void setProfileData(ProfileState state){
      Profile? profile = state.studentProfileEntity?.profile;
      emailController.text = profile?.email ?? "";
      studentNameController.text = profile?.fullName ?? "";
      fathersNameController.text = profile?.fathersName ?? "";
      mothersNameController.text = profile?.mothersName ?? "";
      districtController.text = profile?.address ?? "";
      phoneController.text = profile?.phone ?? "";
    }


    void getStudentProfile() {
      int? studentId = context.read<AuthBloc>().state.signInEntity?.signInData?.student?.id;
      if (studentId != null) {
        context.read<ProfileBloc>().add(
          GetStudentProfile(studentId: studentId.toString()),
        );
      }
    }


    Future<void> updateStudentProfile() async {

      Student? student = context.read<AuthBloc>().state.signInEntity?.signInData?.student;
      if (student == null) return;
      if(!formKey.currentState!.validate()) return;

      Map<String,dynamic> updatedData = {
        "email": emailController.text,
        "fullName": studentNameController.text,
        "phone": phoneController.text,
        "address": districtController.text,
        "fathersName": fathersNameController.text,
        "mothersName": mothersNameController.text,
        "sectionId": student.section?.id,
      };

      if(passwordController.text.isNotEmpty && passwordFormKey.currentState!.validate()){
        updatedData.addEntries({
          "password": passwordController.text,
        }.entries);
      }

      Map<String,dynamic> body = {
        "dto" : jsonEncode(updatedData),
      };

      if(selectedPicture.value != null){
        body.addEntries({
          "file": await MultipartFile.fromFile(selectedPicture.value!.path),
        }.entries);
      }

      context.read<ProfileBloc>().add(
        UpdateStudentProfile(
            studentId: student.id.toString(),
            body: body
        ),
      );

    }


    useEffect(() {
      Future.microtask(() => getStudentProfile());
      return null;
    }, []);

    return Scaffold(
      endDrawer: CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            gap12,

            SecondaryAppBar(title: "Student Profile"),

            Expanded(
              child: Container(
                width: 1.sw,
                height: 1.sh,
                padding: padding24,
                child: BlocConsumer<ProfileBloc, ProfileState>(
                  listenWhen: (previous, current)=> current.studentProfileEntity != null,
                  listener: (context,state)=> setProfileData(state),
                  builder: (context, state) {
                
                    Profile? profile = state.studentProfileEntity?.profile;
                
                    if(state.status.isLoading){
                      return Center(child: CircularProgressIndicator(color: AppColors.blueLight));
                    }else if(state.status.isSuccess){
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                                        
                            ProfileHeaderWidget(
                              onTap: uploadProfilePicture,
                              selectedImageFile: selectedPicture.value,
                              studentImageUrl: profile?.imagePath ?? "",
                              studentName: profile?.fullName ?? "Not Fount",
                              studentId: profile?.id != null ? profile!.id.toString() : "Not Found",
                            ),
                                        
                            gap24,
                                        
                            Form(
                              key: formKey,
                              child: Column(
                                spacing: 10.h,
                                children: [
                                  PrimaryTextFormsFields(
                                    controller: emailController,
                                    title: "Email",
                                    hintText: "Enter your email address",
                                    textInputType: TextInputType.emailAddress,
                                    validator: (value) => FormValidation(
                                      validationType: ValidationType.email,
                                      formValue: value,
                                    ).validate(),
                                  ),
                                        
                                  PrimaryTextFormsFields(
                                    controller: studentNameController,
                                    title: "Student Name",
                                    hintText: "Enter your full name",
                                    textInputType: TextInputType.name,
                                    validator: (value) => FormValidation(
                                      validationType: ValidationType.name,
                                      formValue: value,
                                    ).validate(),
                                  ),
                                        
                                  PrimaryTextFormsFields(
                                    controller: fathersNameController,
                                    title: "Father's Name",
                                    hintText: "Enter your father's name",
                                    textInputType: TextInputType.name,
                                    validator: (value) => FormValidation(
                                      validationType: ValidationType.name,
                                      formValue: value,
                                    ).validate(),
                                  ),
                                        
                                  PrimaryTextFormsFields(
                                    controller: mothersNameController,
                                    title: "Mother's Name",
                                    hintText: "Enter your mother's name",
                                    textInputType: TextInputType.name,
                                    validator: (value) => FormValidation(
                                      validationType: ValidationType.name,
                                      formValue: value,
                                    ).validate(),
                                  ),
                                        
                                  PrimaryTextFormsFields(
                                    controller: districtController,
                                    title: "Own District",
                                    hintText: "Enter your home district",
                                    textInputType: TextInputType.name,
                                    validator: (value) => FormValidation(
                                      validationType: ValidationType.required,
                                      formValue: value,
                                    ).validate(),
                                  ),
                                        
                                  PrimaryTextFormsFields(
                                    controller: phoneController,
                                    title:
                                    "Mobile Number (WhatsApp is connected)",
                                    hintText: "Enter your updated mobile number",
                                    textInputType: TextInputType.phone,
                                    validator: (value) => FormValidation(
                                      validationType: ValidationType.phone,
                                      formValue: value,
                                    ).validate(),
                                  ),
                                        
                                        
                                  Form(
                                    key: passwordFormKey,
                                    child: Column(
                                      spacing: 10.h,
                                      children: [
                                        
                                        PrimaryTextFormsFields(
                                          controller: passwordController,
                                          title: "Password",
                                          hintText: "Enter your new password",
                                          textInputType: TextInputType.visiblePassword,
                                          showObscureButton: true,
                                          validator: (value)=> FormValidation(
                                              validationType: ValidationType.password,
                                              formValue: value
                                          ).validate(),
                                        ),
                                        
                                        
                                        PrimaryTextFormsFields(
                                          title: "Confirm Password",
                                          hintText: "Confirm your new password",
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
                                  )
                                        
                                ],
                              ),
                            ),
                                        
                            gap24,
                                        
                            PrimaryButton(
                                isLoading: state.status.isLoading,
                                onPressed: updateStudentProfile,
                                text: "Update Profile"
                            ),
                                        
                          ],
                        ),
                      );
                    }else if(state.status.isError){
                      return ErrorViewWidget(
                          message: "Something Went Wrong!"
                      );
                    }else{
                      return SizedBox.shrink();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
