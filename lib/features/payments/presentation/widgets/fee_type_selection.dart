import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';

class FeeTypeSelection extends StatefulWidget {
  const FeeTypeSelection({super.key});

  @override
  State<FeeTypeSelection> createState() => _FeeTypeSelectionState();
}

class _FeeTypeSelectionState extends State<FeeTypeSelection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // PDF Submission Tab
        Expanded(
          child: SizedBox(
            child: PrimaryButton(
              onPressed: () {
                setState(() => selectedIndex = 0);
              },
              text: "Registration Fee",
              background: selectedIndex == 0 ? AppColors.blueLight : Colors.white,
              textColor: selectedIndex == 0 ? Colors.white : AppColors.blueLight,
              strokeColor: AppColors.blueLight,
            ),
          ),
        ),

        gap24,

        // Photo Submission Tab
        Expanded(
          child: SizedBox(
            child: PrimaryButton(
              onPressed: () {
                setState(() => selectedIndex = 1);
              },
              text: "Monthly Fee",
              background: selectedIndex == 1 ? AppColors.blueLight : Colors.white,
              textColor: selectedIndex == 1 ? Colors.white : AppColors.blueLight,
              strokeColor: AppColors.blueLight,
            ),
          ),
        ),
      ],
    );
  }
}
