import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';
import 'package:learning_management/widgets/network_image_widget.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final File? selectedImageFile;
  final String studentImageUrl;
  final String studentName;
  final String studentId;
  final VoidCallback onTap;

  const ProfileHeaderWidget({
    super.key,
    this.selectedImageFile,
    required this.studentImageUrl,
    required this.studentName,
    required this.studentId,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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

              if(selectedImageFile == null)
              NetworkImageWidget(
                studentImageUrl,
                width: 100.w,
                height: 100.w,
                borderRadius: radiusCircle,
              )
              else ClipRRect(
                borderRadius: radiusCircle,
                child: Image.file(
                  selectedImageFile!,
                  width: 100.w,
                  height: 100.w,
                ),
              ),


              Positioned(
                child: InkWell(
                  onTap: onTap,
                  child: CircleAvatar(
                    radius: 16.r,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.edit, size: 16.sp, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),

          gap12,

          Text(
            studentName,
            style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w900
            ),
          ),

          Text(
            "Student ID: $studentId",
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}
