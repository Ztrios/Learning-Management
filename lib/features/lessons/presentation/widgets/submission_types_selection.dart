import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';

class SubmissionTypeSelection extends StatefulWidget {
  const SubmissionTypeSelection({super.key});

  @override
  State<SubmissionTypeSelection> createState() => _SubmissionTypeSelectionState();
}

class _SubmissionTypeSelectionState extends State<SubmissionTypeSelection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // PDF Submission Tab
        Expanded(
          child: SizedBox(
            height: 35.h,
            child: PrimaryButton(
              onPressed: () {
                setState(() => selectedIndex = 0);
              },
              text: "PDF Submission",
              background: selectedIndex == 0 ? AppColors.deepOrange : Colors.white,
              textColor: selectedIndex == 0 ? Colors.white : AppColors.deepOrange,
              strokeColor: AppColors.deepOrange,
            ),
          ),
        ),

        gap2,

        // Photo Submission Tab
        Expanded(
          child: SizedBox(
            height: 35.h,
            child: PrimaryButton(
              onPressed: () {
                setState(() => selectedIndex = 1);
              },
              text: "Photo Submission",
              background: selectedIndex == 1 ? AppColors.deepOrange : Colors.white,
              textColor: selectedIndex == 1 ? Colors.white : AppColors.deepOrange,
              strokeColor: AppColors.deepOrange,
            ),
          ),
        ),
      ],
    );
  }
}
