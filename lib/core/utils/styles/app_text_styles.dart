import 'package:flutter/material.dart';

class AppTextStyles {
  const AppTextStyles._();

  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
