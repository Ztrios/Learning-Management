import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';

class AppTextStyles {
  AppTextStyles._(); // Private constructor to prevent instantiation

  static final TextStyle heading = GoogleFonts.poppins(
    fontSize: 25.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.onHeading
  );

  static final TextStyle headline = GoogleFonts.poppins(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.onHeadLine
  );


  static final TextStyle title = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600, // Semibold
    color: AppColors.onTitle
  );

  static final TextStyle titleWithOrangeColor = GoogleFonts.poppins(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600, // Semibold
      color: AppColors.primary
  );

  static final TextStyle subtitle = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.onSubtitle
  );

  static final TextStyle bodyText = GoogleFonts.poppins(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.onBody
  );

  static final TextStyle caption = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.onCaptions
  );

  static final TextStyle button = GoogleFonts.poppins(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.surface
  );

  static final TextStyle buttonWithOrangeColor = GoogleFonts.poppins(
      fontSize: 15.sp,
      fontWeight: FontWeight.w500, // Medium
      color: AppColors.primary
  );

}
