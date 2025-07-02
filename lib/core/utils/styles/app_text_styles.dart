import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle heading1 = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle heading2 = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static TextStyle title = GoogleFonts.poppins(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
  );

  static TextStyle subtitle = GoogleFonts.poppins(
    fontSize: 8.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static TextStyle caption = GoogleFonts.poppins(
    fontSize: 6.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textGrey,
  );


  static TextStyle button = GoogleFonts.poppins(
    fontSize: 8.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
