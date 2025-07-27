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


  static DateTime getStartOfBDWeek() {
    // Dart: Monday = 1, ..., Saturday = 6, Sunday = 7
    final DateTime dateTime = DateTime.now();
    final daysToSubtract = (dateTime.weekday == DateTime.saturday) ? 0 : (dateTime.weekday % 7) + 1;
    return DateTime(dateTime.year, dateTime.month, dateTime.day).subtract(Duration(days: daysToSubtract));
  }


  static DateTime getEndOfBDWeek() {
    final start = getStartOfBDWeek();
    return start.add(const Duration(days: 6));
  }


  static String formatDayOfWeek({DateTime? dateTime}) {
    try {
      return DateFormat("EEEE").format(dateTime ?? DateTime.now());
    } catch (e) {
      return "Invalid Date"; // Handle invalid date format
    }
  }

  static String formatDayOfWeekShort({DateTime? dateTime}) {
    try {
      return DateFormat("EEE").format(dateTime ?? DateTime.now()).toUpperCase();
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


  static String convertTo24HourFormat(String time12h) {
    final inputFormat = DateFormat("hh:mm a");
    final outputFormat = DateFormat("HH:mm");

    final dateTime = inputFormat.parse(time12h);
    return outputFormat.format(dateTime);
  }

  static String formatLocalTime(String timeString) {
    try {
      final now = DateTime.now();
      final parsedTime = DateFormat("HH:mm:ss").parse(timeString);
      final fullDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        parsedTime.hour,
        parsedTime.minute,
        parsedTime.second,
      );
      return DateFormat.jm().format(fullDateTime); // e.g. "4:04 PM"
    } catch (e) {
      return timeString; // fallback if parsing fails
    }
  }


}