import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/margins.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/notifications/presentation/widgets/app_bar/notification_app_bar.dart';
import 'package:learning_management/features/notifications/presentation/widgets/item_view/notification_item_view.dart';

class NotificationsPage extends StatelessWidget {

  static String get path => "/notifications";
  static String get name => "notifications";

  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Column(
          children: [

            NotificationAppBar(),

            Expanded(
              child: Padding(
                padding: paddingH12,
                child: ListView.separated(
                  itemCount: 5,
                  padding: paddingTop6,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){},
                      splashColor: AppColors.randomColors().withValues(alpha: 0.5),
                      child: NotificationItemView(
                          title: "Science Fair Registration",
                          message: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form",
                          timeAgo: "1 day ago",
                          color: AppColors.randomColors()
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
