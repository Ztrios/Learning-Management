import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/payments/presentation/pages/bottom_sheet/payment_bottom_sheet.dart';
import 'package:learning_management/features/payments/presentation/pages/list_view/payment_list.dart';
import 'package:learning_management/features/payments/presentation/widgets/payment_notice_card.dart';
import 'package:learning_management/widgets/app_bars/secondary_app_bar.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/drawer/custom_drawer.dart';

class PaymentPage extends StatelessWidget {
  static String get path => "/payment";
  static String get name => "payment";

  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [

              SecondaryAppBar(
                  title: "Payment",
              ),


              gap12,
              
              Expanded(
                child: Container(
                  width: 1.sw,
                  height: 1.sh,
                  padding: paddingH24,
                  child: Column(
                    children: [

                      PaymentNoticeCard(
                        isRedNotice: false,
                        message: "Monthly Payment of September 2025 Invoice ID: 234234566", 
                        onPressed: ()=> showPaymentBottomSheet(context),
                      ),

                      gap48,

                      PaymentList()


                    ],
                  ),
                ),
              )
              

            ],
          ),
        ),
      ),
    );
  }
}
