part of 'results_bloc.dart';

class ResultsState extends Equatable {
  final Status status;
  final String? message;
  final ResultsEntity? resultsEntity;

  const ResultsState({
    required this.status,
    required this.message,
    required this.resultsEntity
  });

  /// Initial state factory
  factory ResultsState.initial() => const ResultsState(
    status: Status.initial,
    message: null,
    resultsEntity: null,
  );

  /// Copy with new values
  ResultsState copyWith({
    Status? status,
    String? message,
    ResultsEntity? resultsEntity
  }) {
    return ResultsState(
      status: status ?? this.status,
      message: message ?? this.message,
      resultsEntity: resultsEntity ?? this.resultsEntity
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    status,
    message,
    resultsEntity
  ];
}
