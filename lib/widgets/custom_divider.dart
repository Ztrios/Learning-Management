import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  const CustomDivider({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.w,
      height: height,
      color: Colors.white70,
    );
  }
}
