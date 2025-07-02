import 'package:flutter/material.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';

class AppTheme {
  AppTheme._(); // Private constructor to prevent instantiation

  /// **Light Theme**
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    // colorScheme: const ColorScheme.light(
    //   primary: AppColors.primary,
    //   primaryContainer: AppColors.primaryVariant,
    //   secondary: AppColors.secondary,
    //   secondaryContainer: AppColors.secondaryVariant,
    //   background: AppColors.background,
    //   surface: AppColors.surface,
    //   error: AppColors.error,
    //   onPrimary: AppColors.onPrimary,
    //   onSecondary: AppColors.onSecondary,
    //   onBackground: AppColors.onBackground,
    //   onSurface: AppColors.onSurface,
    //   onError: AppColors.onError,
    // ),
    // textTheme: const TextTheme(
    //   headline1: AppTextStyles.headline1,
    //   headline2: AppTextStyles.headline2,
    //   bodyText1: AppTextStyles.bodyText1,
    //   bodyText2: AppTextStyles.bodyText2,
    //   button: AppTextStyles.button,
    //   caption: AppTextStyles.caption,
    // ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        //foregroundColor: AppColors.onPrimary,
        //textStyle: AppTextStyles.button,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );

  /// **Dark Theme**
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    // scaffoldBackgroundColor: AppColors.darkBackground,
    // colorScheme: const ColorScheme.dark(
    //   primary: AppColors.primary,
    //   primaryContainer: AppColors.primaryVariant,
    //   secondary: AppColors.secondary,
    //   secondaryContainer: AppColors.secondaryVariant,
    //   background: AppColors.darkBackground,
    //   surface: AppColors.darkSurface,
    //   error: AppColors.error,
    //   onPrimary: AppColors.darkOnPrimary,
    //   onSecondary: AppColors.darkOnSecondary,
    //   onBackground: AppColors.darkOnBackground,
    //   onSurface: AppColors.darkOnSurface,
    //   onError: AppColors.darkOnError,
    // ),
    // textTheme: const TextTheme(
    //   headline1: AppTextStyles.headline1,
    //   headline2: AppTextStyles.headline2,
    //   bodyText1: AppTextStyles.bodyText1,
    //   bodyText2: AppTextStyles.bodyText2,
    //   button: AppTextStyles.button,
    //   caption: AppTextStyles.caption,
    // ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        //foregroundColor: AppColors.onPrimary,
        //textStyle: AppTextStyles.button,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
