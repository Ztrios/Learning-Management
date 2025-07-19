part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final Status status;
  final String? message;

  const PaymentState({
    required this.status,
    required this.message,
  });

  /// Initial state factory
  factory PaymentState.initial() => const PaymentState(
    status: Status.initial,
    message: null,
  );

  /// Copy with new values
  PaymentState copyWith({
    Status? status,
    String? message,
  }) {
    return PaymentState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [status, message];
}
