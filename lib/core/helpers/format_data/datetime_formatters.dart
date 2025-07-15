import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:timeago/timeago.dart' as timeago;
class DateTimeFormatters{
  const DateTimeFormatters._();


  static String formatTimeRange( BuildContext context, TimeRange timeRange){
    final localizations = MaterialLocalizations.of(context);
    String formattedStart = localizations.formatTimeOfDay(timeRange.startTime);
    String formattedEnd = localizations.formatTimeOfDay(timeRange.endTime);
    return "$formattedStart - $formattedEnd";
  }


  static String formatDate({DateTime? dateTime}) {
    try {
      return DateFormat("MMM dd, yyyy").format(dateTime ?? DateTime.now());
    } catch (e) {
      return "Invalid Date"; // Handle invalid date format
    }
  }

  static String formatDateV2({DateTime? dateTime}) {
    try {
      return DateFormat("dd MMMM yyyy").format(dateTime ?? DateTime.now());
    } catch (e) {
      return "Invalid Date"; // Handle invalid date format
    }
  }


  static String formatDayOfWeek({DateTime? dateTime}) {
    try {
      return DateFormat("EEEE").format(dateTime ?? DateTime.now());
    } catch (e) {
      return "Invalid Date"; // Handle invalid date format
    }
  }


  static String formatDateToTime({DateTime? dateTime}) {
    return DateFormat.jm().format(dateTime ?? DateTime.now()); // e.g., "10:00 AM"
  }


  static String timeAgoFromDate(DateTime dateTime, {String locale = 'en'}) {
    return timeago.format(dateTime, locale: locale);
  }


  static String formatDateTimeToJsStyle(DateTime dateTime) {
    final weekday = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][dateTime.weekday - 1];
    final month = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'][dateTime.month - 1];

    final year = dateTime.year;
    final day = dateTime.day.toString().padLeft(2, '0');
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final second = dateTime.second.toString().padLeft(2, '0');

    // Format timezone offset
    final offset = dateTime.timeZoneOffset;
    final hoursOffset = offset.inHours.abs().toString().padLeft(2, '0');
    final minutesOffset = (offset.inMinutes.abs() % 60).toString().padLeft(2, '0');
    final sign = offset.isNegative ? '-' : '+';

    return '$weekday $month $day $year $hour:$minute:$second GMT$sign$hoursOffset$minutesOffset (${dateTime.timeZoneName})';
  }


  static String convertTo24HourFormat(String time12h) {
    final inputFormat = DateFormat("hh:mm a");
    final outputFormat = DateFormat("HH:mm");

    final dateTime = inputFormat.parse(time12h);
    return outputFormat.format(dateTime);
  }


}