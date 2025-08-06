import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';

class MonthSelectionDropdown extends HookWidget {
  final List<String> months;
  final void Function(int selectedIndex) onMonthSelected;
  final int? initialIndex;

  const MonthSelectionDropdown({
    super.key,
    required this.months,
    required this.onMonthSelected,
    this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {

    final selectedMonth = useState<String>(
      initialIndex != null ? months[initialIndex!] : months.first,
    );


    useEffect((){
      Future.microtask(()=> onMonthSelected(initialIndex ?? 0));
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
        child: DropdownButton<String>(
          value: selectedMonth.value,
          icon: Icon(Icons.keyboard_arrow_down,
              color: AppColors.deepBlue, size: 25.sp),
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.bold),
          onChanged: (value) {
            if (value != null) {
              selectedMonth.value = value;
              onMonthSelected(months.indexOf(value));
            }
          },
          items: months.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ),
    );
  }
}
