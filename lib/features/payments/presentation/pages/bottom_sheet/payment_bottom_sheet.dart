import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';
import 'package:learning_management/features/payments/presentation/widgets/bottom_sheet_title.dart';
import 'package:learning_management/features/payments/presentation/widgets/fee_type_selection.dart';
import 'package:learning_management/features/payments/presentation/widgets/payment_row_widget.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';


void showPaymentBottomSheet(BuildContext context){
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context){
        return PaymentBottomSheet();
      }
  );
}

class PaymentBottomSheet extends HookWidget {
  const PaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {

    final paymentDuration = useState<String>("1 Month");

    final List<String> months = [
      "1 Month",
      "2 Months",
      "3 Months",
      "6 Months",
      "12 Months"
    ];

    final outlineBorder = OutlineInputBorder(
      borderRadius: radius12,
      borderSide: BorderSide(width: 1.5.w, color: AppColors.blueLight),
    );

    Widget titleText(String text, {Color? color}) => Text(
      text,
      style: AppTextStyles.titleMedium.copyWith(color: color),
    );

    return Container(
      width: 1.sw,
      height: 600.h,
      padding: padding24,
      decoration: BoxDecoration(borderRadius: radius16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header Row
          BottomSheetTitle(),

          gap12,

          /// Month Selection Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleText("Payment for month"),
              Container(
                height: 30.h,
                padding: paddingH6,
                decoration: BoxDecoration(
                  borderRadius: radius6,
                  border: Border.all(width: 1.w, color: AppColors.blueLight),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: paymentDuration.value,
                    icon: Icon(Icons.keyboard_arrow_down, color: AppColors.deepBlue,
                        size: 25.sp),
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.bold),
                    onChanged: (value) {
                      if (value != null) {
                        paymentDuration.value = value;
                      }
                    },
                    items: months.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),

          gap12,
          const Divider(),
          gap12,

          /// Fee Selection Widget
          const FeeTypeSelection(),

          gap12,
          const Divider(),
          gap12,

          /// Coupon Input
          titleText("Apply Coupon"),
          gap6,
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40.h,
                  child: TextField(
                    decoration: InputDecoration(
                      border: outlineBorder,
                      enabledBorder: outlineBorder,
                      focusedBorder: outlineBorder,
                      errorBorder: outlineBorder,
                    ),
                  ),
                ),
              ),
              gap12,
              SizedBox(
                width: 100.w,
                height: 40.h,
                child: PrimaryButton(
                  onPressed: () {},
                  text: "Apply",
                ),
              ),
            ],
          ),

          gap12,

          /// Payment Summary
          PaymentRowWidget(label: "Payment Amount",value:  "6000/-"),
          PaymentRowWidget(label: "Discount", value:  "400/-"),
          PaymentRowWidget(label: "Total", value: "5600/-", highlight: true),

          const Spacer(),

          /// Final Button
          PrimaryButton(text: "Pay 5600 Tk"),

          gap12,
        ],
      ),
    );
  }


}
