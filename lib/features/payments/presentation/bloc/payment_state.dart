part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final Status status;
  final String? message;
  final InvoiceEntity? invoiceEntity;
  const PaymentState({
    required this.status,
    required this.message,
    required this.invoiceEntity
  });

  /// Initial state factory
  factory PaymentState.initial() => const PaymentState(
    status: Status.initial,
    message: null,
    invoiceEntity: null
  );

  /// Copy with new values
  PaymentState copyWith({
    Status? status,
    String? message,
    InvoiceEntity? invoiceEntity
  }) {
    return PaymentState(
      status: status ?? this.status,
      message: message ?? this.message,
      invoiceEntity: invoiceEntity ?? this.invoiceEntity
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    status,
    message,
    invoiceEntity
  ];
}
