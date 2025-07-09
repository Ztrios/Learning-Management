import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';

class PaymentNoticeCard extends StatelessWidget {
  final bool isRedNotice;
  final String message;
  final VoidCallback onPressed;
  const PaymentNoticeCard({
    super.key,
    this.isRedNotice = false,
    required this.message,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: padding16,
      decoration: BoxDecoration(
          color: (isRedNotice ? AppColors.errorRed : AppColors.blueLight).withValues(alpha: 0.1),
          borderRadius: radius16,
          border: Border.all(
              width: 1.w,
              color: (isRedNotice ? AppColors.errorRed : AppColors.blueLight)
          )
      ),
      child: Column(
        children: [
          Text(
            message,
            style: AppTextStyles.caption.copyWith(
                color: isRedNotice ? AppColors.errorRed : AppColors.textPrimary
            ),
          ),

          gap4,

          Row(
            mainAxisAlignment: mainSpaceBetween,
            children: [

              if(isRedNotice == false)
              Text(
                "Amount: 2000/-",
                style: AppTextStyles.titleMedium,
              ),

              const Spacer(),

              SizedBox(
                width: 100.w,
                height: 35.h,
                child: PrimaryButton(
                  onPressed: onPressed,
                  text: "Pay Now",
                  background: (isRedNotice ? AppColors.errorRed : AppColors.blueLight),
                ),
              )

            ],
          )
        ],
      ),
    );
  }
}
