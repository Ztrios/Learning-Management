part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final Status status;
  final String? message;
  final InvoiceEntity? invoiceEntity;
  final PaymentEntity? paymentEntity;
  final PaymentHistoryEntity? paymentHistoryEntity;

  const PaymentState({
    required this.status,
    required this.message,
    required this.invoiceEntity,
    required this.paymentEntity,
    required this.paymentHistoryEntity
  });

  /// Initial state factory
  factory PaymentState.initial() => const PaymentState(
    status: Status.initial,
    message: null,
    invoiceEntity: null,
    paymentEntity: null,
    paymentHistoryEntity: null
  );

  /// Copy with new values
  PaymentState copyWith({
    Status? status,
    String? message,
    InvoiceEntity? invoiceEntity,
    PaymentEntity? paymentEntity,
    PaymentHistoryEntity? paymentHistoryEntity
  }) {
    return PaymentState(
      status: status ?? this.status,
      message: message ?? this.message,
      invoiceEntity: invoiceEntity ?? this.invoiceEntity,
      paymentEntity: paymentEntity ?? this.paymentEntity,
      paymentHistoryEntity: paymentHistoryEntity ?? this.paymentHistoryEntity
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    status,
    message,
    invoiceEntity,
    paymentEntity,
    paymentHistoryEntity
  ];
}
