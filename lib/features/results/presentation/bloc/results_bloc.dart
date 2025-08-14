import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/features/results/domain/entities/results_entities.dart';
import 'package:learning_management/features/results/domain/repositories/results_repositories.dart';
import 'package:learning_management/features/results/domain/usecases/student_results_usecases.dart';
import 'package:learning_management/features/results/presentation/bloc/results_event.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

part 'results_state.dart';

class ResultsBloc extends Bloc<ResultsEvent,ResultsState>{
  ResultsBloc():super(ResultsState.initial()){
    on<GetStudentResults>(_onGetStudentResults);
  }

  Future<void> _onGetStudentResults(GetStudentResults event, Emitter<ResultsState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<StudentResultsUseCase>().call(params: event.studentId);
    result.fold(
        (error)=> emit(state.copyWith(status: Status.error, message: state.message)),
        (data)=> emit(state.copyWith(status: Status.success, resultsEntity: data))
    );
  }



}