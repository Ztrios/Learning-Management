import 'package:flutter/material.dart';
import 'package:time_range_picker/time_range_picker.dart';

Future<TimeRange> showTimeRangePickerDialog(BuildContext context)async{
  return await showTimeRangePicker(
      context: context,
      start: const TimeOfDay(hour: 9, minute: 0),
      end: const TimeOfDay(hour: 12, minute: 0),
      disabledTime: TimeRange(
          startTime: const TimeOfDay(hour: 22, minute: 0),
          endTime: const TimeOfDay(hour: 5, minute: 0)
      ),
      disabledColor: Colors.red.withValues(alpha: 0.5),
      strokeWidth: 4,
      ticks: 24,
      ticksOffset: -7,
      ticksLength: 15,
      ticksColor: Colors.grey,
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