import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:learning_management/config/routes/app_routes.dart';
import 'package:learning_management/core/constants/local_database_keys.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';

class GlobalFunctions{
  const GlobalFunctions._();


  static void showSuccessToast(String message) {
    toastification.show(
      overlayState: navigatorKey.currentState?.overlay,
      type: ToastificationType.success,
      style: ToastificationStyle.minimal,
      title: Text('Success'),
      description: Text(message),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: Duration(seconds: 3),
      icon: Icon(Icons.check_circle, color: Colors.green),
    );
  }


  static void showErrorToast({required String title, required String message}) {
    toastification.show(
      overlayState: navigatorKey.currentState?.overlay,
      type: ToastificationType.error,
      style: ToastificationStyle.minimal,
      title: Text(title),
      description: Text(message),
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.bottomCenter,
      icon: const Icon(Icons.error,),
    );
  }



  static void showApiErrorToast(int statusCode, String message) {
    toastification.show(
      overlayState: navigatorKey.currentState?.overlay,
      type: ToastificationType.error,
      style: ToastificationStyle.minimal,
      title: Text("Status Code: $statusCode"),
      description: Text(message),
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.topCenter,
      icon: const Icon(Icons.error,),
    );
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


  static Future<void> launchUri({required String uri}) async {
    final Uri url = Uri.parse(uri);

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication, // Opens in browser or relevant app
      );
    } else {
      throw 'Could not launch $uri';
    }
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



  static void shareLink(String url, {String? message}) {
    final content = message != null ? "$message\n$url" : url;
    Share.share(content);
  }


  static Future<String?> pasteFromClipboard(TextEditingController controller) async {
    final clipboardData = await Clipboard.getData('text/plain');
    if (clipboardData != null && clipboardData.text != null) {
      controller.text = clipboardData.text!;
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
      return clipboardData.text;
    }
    return null;
  }


}