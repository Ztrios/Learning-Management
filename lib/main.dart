
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/constants/local_database_keys.dart';
import 'package:learning_management/core/services/firebase_services/push_notification/push_notification_service.dart';
import 'package:learning_management/learning_management_app.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await Hive.initFlutter();
  await Hive.openBox(LocalDatabaseKeys.database);

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await sl<PushNotificationService>().initialize();

  runApp(LearningManagementApp());
}
