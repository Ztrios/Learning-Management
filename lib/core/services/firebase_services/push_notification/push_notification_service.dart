// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:learning_management/core/services/firebase_services/push_notification/notification_handlers_service.dart';
//
//
// sealed class PushNotificationService {
//   Future<void> initialize();
//   Future<void> requestPermissions();
// }
//
// class PushNotificationServiceImpl implements PushNotificationService {
//   static final PushNotificationServiceImpl _instance = PushNotificationServiceImpl._internal();
//
//   factory PushNotificationServiceImpl() => _instance;
//
//   PushNotificationServiceImpl._internal();
//
//   @override
//   Future<void> initialize() async {
//     await Firebase.initializeApp();
//
//     await AwesomeNotifications().initialize(
//       null,
//       [
//         NotificationChannel(
//           channelKey: "basic_channel",
//           channelName: "Basic Notifications",
//           channelDescription: "Notification channel for basic tests",
//           defaultColor: const Color(0xFF9D50DD),
//           ledColor: Colors.white,
//           importance: NotificationImportance.High,
//         )
//       ],
//       debug: true,
//     );
//
//     // FCM Background handler
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//     // Foreground messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       _createLocalNotification(message);
//     });
//
//
//     // Listen for when the user taps a push_notification to open the app.
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
//       NotificationHandlersService(message).notificationRedirection();
//     });
//
//   }
//
//   @override
//   Future<void> requestPermissions() async {
//     await FirebaseMessaging.instance.requestPermission();
//
//     final isAllowed = await AwesomeNotifications().isNotificationAllowed();
//     if (!isAllowed) {
//       await AwesomeNotifications().requestPermissionToSendNotifications();
//     }
//   }
//
//   static Future<void> _firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     await Firebase.initializeApp();
//     _instance._createLocalNotification(message);
//   }
//
//   void _createLocalNotification(RemoteMessage message) {
//     final title = message.data["title"] ?? message.notification?.title ??
//         "No Title";
//     final body = message.data["body"] ?? message.notification?.body ??
//         "No Body";
//     final imageUrl = message.data["image"] ??
//         message.notification?.android?.imageUrl;
//
//     AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: DateTime
//             .now()
//             .millisecondsSinceEpoch
//             .remainder(100000),
//         channelKey: "basic_channel",
//         title: title,
//         body: body,
//         notificationLayout: imageUrl != null
//             ? NotificationLayout.BigPicture
//             : NotificationLayout.Default,
//         bigPicture: imageUrl,
//       ),
//     );
//   }
// }
//
//
