import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/payments/presentation/widgets/fee_type_selection.dart';
import 'package:learning_management/features/payments/presentation/widgets/item_view/payment_item_view.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/text_forms/primary_text_forms_fields.dart';

class PaymentList extends StatelessWidget {
  const PaymentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [

          Row(
            mainAxisAlignment: mainSpaceBetween,
            children: [
              Text(
                "Invoice ID",
                style: AppTextStyles.titleSmall,
                textAlign: TextAlign.center,
              ),

              Text(
                "Description",
                style: AppTextStyles.titleSmall,
                textAlign: TextAlign.center,
              ),

              Text(
                "Paid At",
                style: AppTextStyles.titleSmall,
                textAlign: TextAlign.center,
              ),

              Text(
                "Amount",
                style: AppTextStyles.titleSmall,
                textAlign: TextAlign.center,
              ),

              gap4,

            ],
          ),

          Divider(
            thickness: 2.w,
            color: AppColors.blueLight,
          ),


          Expanded(
            child: ListView.separated(
              itemCount: 7,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      // print("HelLO");
                      // showBottomSheet(
                      //     context: context,
                      //     builder: (context){
                      //       return ;
                      //     }
                      // );
                    },
                    child: PaymentItemView()
                  );
                },
                separatorBuilder: (context, index)=> const Divider(),
            ),
          )


        ],
      ),
    );
  }
}
