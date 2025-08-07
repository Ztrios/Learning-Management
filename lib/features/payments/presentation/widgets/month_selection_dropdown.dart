import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';

class MonthSelectionDropdown extends HookWidget {
  final List<int> months;
  final void Function(int selectedMonth) onMonthSelected;

  const MonthSelectionDropdown({
    super.key,
    required this.months,
    required this.onMonthSelected,
  });

  @override
  Widget build(BuildContext context) {

    final selectedMonth = useState<int>(months.first);

    useEffect((){
      Future.microtask(()=> onMonthSelected(months.first));
      return null;
    },[]);

    return Container(
      height: 30.h,
      padding: paddingH6,
      decoration: BoxDecoration(
        borderRadius: radius6,
        border: Border.all(width: 1.w, color: AppColors.blueLight),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: selectedMonth.value,
          icon: Icon(Icons.keyboard_arrow_down,
              color: AppColors.deepBlue, size: 25.sp),
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.bold),
          onChanged: (value) {
            if (value != null) {
              selectedMonth.value = value;
              onMonthSelected(selectedMonth.value);
            }
          },
          items: months.map((item) {
            return DropdownMenuItem<int>(
              value: item,
              child: Text("$item ${item > 1 ? "Month" : "Months"}"),
            );
          }).toList(),
        ),
      ),
    );
  }
}
