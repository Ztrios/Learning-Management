
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/constants/local_database_keys.dart';
import 'package:learning_management/learning_management_app.dart';


void main()async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  initServiceLocator();
  await Hive.initFlutter();
  await Hive.openBox(LocalDatabaseKeys.database);

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await sl<PushNotificationService>().initialize();

  runApp(LearningManagementApp());
}
