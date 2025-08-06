import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/helpers/format_data/datetime_formatters.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/payments/data/models/payment_history_model.dart';
import 'package:learning_management/features/payments/presentation/bloc/payment_bloc.dart';
import 'package:learning_management/features/payments/presentation/bloc/payment_event.dart';
import 'package:learning_management/features/payments/presentation/widgets/bottom_sheet/payment_details_bottom_sheet.dart';
import 'package:learning_management/features/payments/presentation/widgets/fee_type_selection.dart';
import 'package:learning_management/features/payments/presentation/widgets/item_view/payment_item_view.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/circle_loading.dart';
import 'package:learning_management/widgets/empty_widget.dart';
import 'package:learning_management/widgets/text_forms/primary_text_forms_fields.dart';

class PaymentList extends HookWidget {
  const PaymentList({super.key});

  @override
  Widget build(BuildContext context) {

    void getPaymentHistory(){
      int? studentId = context.read<AuthBloc>().state.signInEntity?.signInData?.student?.id;
      if(studentId != null){
        context.read<PaymentBloc>().add(GetPaymentHistory(query: {
          "studentId" : studentId
        }));
      }
    }

    useEffect((){
      Future.microtask(()=> getPaymentHistory());
      return null;
    });

    return Expanded(
      child: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if(state.status.isLoading){
            return CircleLoadingWidget();
          }else if(state.status.isSuccess && (state.paymentHistoryEntity?.paymentHistoryData?.content).isNotNullAndNotEmpty){
            return Column(
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
                  child: BlocBuilder<PaymentBloc, PaymentState>(
                    builder: (context, state) {
                      return ListView.separated(
                        itemCount: 7,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          Content content = state.paymentHistoryEntity!.paymentHistoryData!.content![index];

                          return InkWell(
                              onTap: () => showPaymentDetailsBottomSheet(context: context, content: content),
                              child: PaymentItemView(
                                invoiceId: content.invoiceId ?? "--",
                                description: "",
                                paymentDate: DateTimeFormatters.formatDateV2(
                                    dateTime: content.paymentDate ??
                                        DateTime.now()),
                                totalAmount: (content.totalAmount ?? 00)
                                    .toString(),
                              )
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                      );
                    },
                  ),
                )

              ],
            );
          }else{
            return EmptyWidget(
                title: "No Payment History",
                message: "Payment history are not available at this moment"
            );
          }
        },
      ),
    );
  }
}
