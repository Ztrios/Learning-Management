import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';

class FeeTypeSelection extends HookWidget {
  final bool isRegistrationDone;
  final void Function(List<int> values) selectedFeeType;
  const FeeTypeSelection({
    super.key,
    required this.isRegistrationDone,
    required this.selectedFeeType,
  });


  @override
  Widget build(BuildContext context) {

    final selectedIndexes = useState<List<int>>([0]);

    void toggleSelection(int index) {
      List<int> indexes = List.from(selectedIndexes.value);
      if (selectedIndexes.value.contains(index)) {
        indexes.remove(index);
      } else {
        indexes.add(index);
      }
      selectedIndexes.value = indexes;
      selectedFeeType(selectedIndexes.value);
    }

    return Visibility(
      visible: !isRegistrationDone,

      replacement: PrimaryButton(
        text: "Monthly Fee",
        background: AppColors.blueLight,
        textColor: Colors.white,
        strokeColor: AppColors.blueLight,
      ),

      child: Row(
        children: [
          // Registration Fee
          Expanded(
            child: PrimaryButton(
              onPressed: () => toggleSelection(0),
              text: "Registration Fee",
              background: selectedIndexes.value.contains(0) ? AppColors.blueLight : Colors.white,
              textColor: selectedIndexes.value.contains(0) ? Colors.white : AppColors.blueLight,
              strokeColor: AppColors.blueLight,
            ),
          ),

          gap24,

          // Monthly Fee
          Expanded(
            child: PrimaryButton(
              onPressed: () => toggleSelection(1),
              text: "Monthly Fee",
              background: selectedIndexes.value.contains(1) ? AppColors.blueLight : Colors.white,
              textColor: selectedIndexes.value.contains(1) ? Colors.white : AppColors.blueLight,
              strokeColor: AppColors.blueLight,
            ),
          ),
        ],
      ),
    );
  }
}
