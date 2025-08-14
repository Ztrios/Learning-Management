import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/ui_helpers/margins.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';

class NotificationItemView extends StatelessWidget {
  final String title;
  final String message;
  final String timeAgo;
  final Color color;
  const NotificationItemView({super.key,
    required this.title,
    required this.message,
    required this.timeAgo,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: margin12,
      child: Column(
        children: [
          Row(
            children: [

              CircleAvatar(
                backgroundColor: color.withValues(alpha: 0.2),
                child: Icon(Icons.notifications_none_rounded, color: color,),
              ),

              gap12,

              Column(
                crossAxisAlignment: crossStart,
                children: [
                  Text(
                    "Science Fair Registration",
                    style: AppTextStyles.titleSmall,
                  ),

                  Text(
                    "1 day ago",
                    style: AppTextStyles.caption,
                  )
                ],
              ),

            ],
          ),

          gap12,

          Text(
            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form",
            style: AppTextStyles.caption,
          ),

        ],
      ),
    );
  }
}
