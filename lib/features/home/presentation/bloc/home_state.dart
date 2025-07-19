part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Status status;
  final String? message;

  const HomeState({
    required this.status,
    required this.message,
  });

  /// Initial state factory
  factory HomeState.initial() => const HomeState(
    status: Status.initial,
    message: null,
  );

  /// Copy with new values
  HomeState copyWith({
    Status? status,
    String? message,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [status, message];
}
