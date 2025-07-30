import 'package:equatable/equatable.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/utils/enums/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/features/lessons/domain/entities/exams_list_entity.dart';
import 'package:learning_management/features/lessons/domain/entities/lessions_list_entity.dart';
import 'package:learning_management/features/lessons/domain/usecases/get_exams_list_usecase.dart';
import 'package:learning_management/features/lessons/domain/usecases/get_lessions_list_usecase.dart';
import 'package:learning_management/features/lessons/presentation/bloc/lessions_event.dart';

part 'lessions_state.dart';

class LessionsBloc extends Bloc<LessionsEvent, LessionsState>{
  LessionsBloc():super(LessionsState.initial()){
    on<GetLessionsList>(_onGetLessionsList);
    on<GetExamsList>(_onGetExamsList);
  }

  Future<void> _onGetLessionsList(GetLessionsList event, Emitter<LessionsState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<GetLessionsUseCase>().call(params: event.subjectId);
    result.fold(
            (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
            (data)=> emit(state.copyWith(status: Status.success, lessionsListEntity: data))
    );
  }


  Future<void> _onGetExamsList(GetExamsList event, Emitter<LessionsState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<GetExamsListUseCase>().call(params: event.subjectId);
    result.fold(
            (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
            (data)=> emit(state.copyWith(status: Status.success, examsListEntity: data))
    );
  }



}