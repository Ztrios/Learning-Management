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

class ToastNotifications{
  const ToastNotifications._();


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


}