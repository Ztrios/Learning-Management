import 'package:flutter/material.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:time_range_picker/time_range_picker.dart';

Future<TimeRange> showTimeRangePickerDialog(BuildContext context)async{
  return await showTimeRangePicker(
      context: context,
      fromText: "Start Time",
      toText: "End Time",
      start: const TimeOfDay(hour: 9, minute: 0),
      end: const TimeOfDay(hour: 12, minute: 0),
      disabledTime: TimeRange(
          startTime: const TimeOfDay(hour: 22, minute: 0),
          endTime: const TimeOfDay(hour: 5, minute: 0)
      ),
      disabledColor: Colors.red.withValues(alpha: 0.5),
      timeTextStyle: AppTextStyles.titleMedium.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w900
      ),
      activeTimeTextStyle: AppTextStyles.titleLarge.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w900
      ),
      strokeWidth: 4,
      ticks: 24,
      ticksOffset: -7,
      ticksLength: 15,
      ticksColor: Colors.grey,
      selectedColor: AppColors.blueLight,
      use24HourFormat: false,
      minDuration: Duration(hours: 1),
      labels: [
        "12 am",
        "3 am",
        "6 am",
        "9 am",
        "12 pm",
        "3 pm",
        "6 pm",
        "9 pm"
      ].asMap().entries.map((e) {
        return ClockLabel.fromIndex(
            idx: e.key, length: 8, text: e.value);
      }).toList(),
      labelOffset: 35,
      rotateLabels: false,
      padding: 80
  );
}