import 'package:equatable/equatable.dart';

sealed class PaymentEvent extends Equatable{}

class GetInvoice extends PaymentEvent{

  final String studentId;

  GetInvoice({required this.studentId});

  @override
  List<Object?> get props => [
    studentId
  ];

}


class GetPaymentHistory extends PaymentEvent{

  final Map<String, dynamic> query;

  GetPaymentHistory({required this.query});

  @override
  List<Object?> get props => [
    query
  ];

}