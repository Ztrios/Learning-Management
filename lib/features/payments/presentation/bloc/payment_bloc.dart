import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/features/payments/presentation/bloc/payment_event.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState>{
  PaymentBloc():super(PaymentState.initial());
}