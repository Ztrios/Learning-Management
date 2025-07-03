import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/config/routes/app_routes.dart';
import 'package:learning_management/core/bloc/app_bloc_providers.dart';
import 'package:learning_management/core/theme/app_theme.dart';
import 'package:toastification/toastification.dart';


class LearningManagementApp extends StatelessWidget {
  const LearningManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Screen util is used for make
    /// Pixel perfect responsive
    /// User Interface according with screen height and width
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: ToastificationWrapper(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: AppRouter.routes,
        ),
      ),
    );
  }
}


