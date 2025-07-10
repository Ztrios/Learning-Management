import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/widgets/app_bars/secondary_app_bar.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/drawer/custom_drawer.dart';
import 'package:learning_management/widgets/network_image_widget.dart';
import 'package:learning_management/widgets/text_forms/primary_text_forms_fields.dart';

class StudentProfilePage extends StatelessWidget {

  static String get path => "/student-profile";
  static String get name => "student-profile";

  const StudentProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      // Profile Picture and Name with background
                      Container(
                        width: double.infinity,
                        padding: paddingV24,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50, // 🎨 background color
                          borderRadius: radius12,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                NetworkImageWidget(
                                  "https://www.apeejay.edu/panchsheel/images/achievements/2021/Brem-Dutt-Memorial-Pan/Brem-Dutt-Memorial-Pan-1.jpg",
                                  width: 100.w,
                                  height: 100.w,
                                  borderRadius: radiusCircle,
                                ),
                                Positioned(
                                  child: CircleAvatar(
                                    radius: 16.r,
                                    backgroundColor: Colors.blue,
                                    child: Icon(Icons.edit, size: 16.sp, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),

                            gap12,

                            Text(
                              "Sakib Hossain",
                              style: AppTextStyles.bodyLarge.copyWith(
                                fontWeight: FontWeight.w900
                              ),
                            ),

                            Text(
                              "Student ID: STU123456",
                              style: AppTextStyles.bodyMedium,
                            ),
                          ],
                        ),
                      ),

                      gap24,

                      // Read-only form fields
                      Column(
                        spacing: 10.h,
                        children: [
                          _buildReadOnlyField(label: "Name", value: "Sajib Hasan"),
                          _buildReadOnlyField(label: "Email", value: "sajib@example.com"),
                          _buildReadOnlyField(label: "Father's Name", value: "Md. Abdul Hossain"),
                          _buildReadOnlyField(label: "Mother's Name", value: "Fatema Begum"),
                          _buildReadOnlyField(label: "District",value:  "Dhaka"),
                          _buildReadOnlyField(label: "Mobile Number",value: "+8801777777777"),
                          _buildReadOnlyField(label: "Batch", value: "Batch 23"),
                          _buildReadOnlyField(label: "Password", value: "5456560465", showObscureButton: true),
                        ],
                      ),

                      gap24,

                      PrimaryButton(
                        text: "Update Profile",
                      )

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReadOnlyField({required String label, required String value, bool? showObscureButton}) {
    return PrimaryTextFormsFields(
      controller: TextEditingController(text: value),
      title: label,
      showObscureButton: showObscureButton,
    );
  }
}
