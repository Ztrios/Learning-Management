import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';

class SubmissionTypeSelection extends HookWidget {
  final Function(int indext) onChanged;
  const SubmissionTypeSelection({
    super.key,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {

    final selectedIndex = useState<int>(0);

    return Row(
      children: [
        // PDF Submission Tab
        Expanded(
          child: SizedBox(
            height: 35.h,
            child: PrimaryButton(
              onPressed: () {
                selectedIndex.value = 0;
                onChanged(0);
              },
              text: "PDF Submission",
              background: selectedIndex.value == 0 ? AppColors.deepOrange : Colors.white,
              textColor: selectedIndex.value == 0 ? Colors.white : AppColors.deepOrange,
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
                selectedIndex.value = 1;
                onChanged(1);
              },
              text: "Photo Submission",
              background: selectedIndex.value == 1 ? AppColors.deepOrange : Colors.white,
              textColor: selectedIndex.value == 1 ? Colors.white : AppColors.deepOrange,
              strokeColor: AppColors.deepOrange,
            ),
          ),
        ),
      ],
    );
  }
}
