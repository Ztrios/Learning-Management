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