import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/home/presentation/widgets/class_routine_widget.dart';
import 'package:learning_management/features/home/presentation/widgets/subject_list_widget.dart';
import 'package:learning_management/features/home/presentation/widgets/task_list_widget.dart';
import 'package:learning_management/features/payments/presentation/widgets/payment_notice_card.dart';
import 'package:learning_management/widgets/app_bars/primary_app_bars.dart';

class HomePage extends StatelessWidget {

  static String get path => "/home";
  static String get name => "home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          padding: paddingTop12,
          color: AppColors.background,
          child: Column(
            children: [

              PrimaryAppBar(),

              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: padding20,
                    child: Column(
                      crossAxisAlignment: crossStart,
                      children: [


                        PaymentNoticeCard(
                            message: "Your email couldn't be renewed because your payment didn’t work",
                            isRedNotice: true,
                            onPressed: (){}
                        ),

                        gap12,

                        ClassRoutineWidget(),

                        gap12,

                        TaskListWidget(),

                        gap12,

                        SubjectListWidget()


                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
