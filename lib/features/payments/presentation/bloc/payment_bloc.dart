import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/features/payments/domain/entities/invoice_entity.dart';
import 'package:learning_management/features/payments/domain/entities/payment_history_entity.dart';
import 'package:learning_management/features/payments/domain/usecases/get_invoice_usecase.dart';
import 'package:learning_management/features/payments/domain/usecases/get_payment_history_usecase.dart';
import 'package:learning_management/features/payments/presentation/bloc/payment_event.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState>{
  PaymentBloc():super(PaymentState.initial()){
    on<GetInvoice>(_onGetInvoice);
    on<GetPaymentHistory>(_onGetPaymentHistory);
  }

  Future<void> _onGetInvoice(GetInvoice event, Emitter<PaymentState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<GetInvoiceUseCase>().call(params: event.studentId);
    result.fold(
        (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
        (data)=> emit(state.copyWith(status: Status.success, invoiceEntity: data))
    );
  }

  Future<void> _onGetPaymentHistory(GetPaymentHistory event, Emitter<PaymentState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<GetPaymentHistoryUseCase>().call(params: event.query);
    result.fold(
            (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
            (data)=> emit(state.copyWith(status: Status.success, paymentHistoryEntity: data))
    );
  }

}