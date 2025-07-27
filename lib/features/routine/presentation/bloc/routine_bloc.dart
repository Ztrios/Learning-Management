import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/features/routine/domain/entities/class_routine_entities.dart';
import 'package:learning_management/features/routine/domain/usecases/get_class_routines_usecase.dart';
import 'package:learning_management/features/routine/presentation/bloc/routine_event.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

part 'routine_state.dart';

class RoutineBloc extends Bloc<RoutineEvent, RoutineState>{
  RoutineBloc(): super(RoutineState.initial()){
    on<GetClassRoutines>(_onGetClassRoutines);
  }

  Future<void> _onGetClassRoutines(GetClassRoutines event, Emitter<RoutineState> emit) async {
    emit(state.copyWith(status: Status.loading, selectedDate: event.selectedDateTime));
    GetClassRoutineParams getClassRoutineParams = GetClassRoutineParams(
        sectionId: event.sectionID,
        dateTime: event.selectedDateTime
    );
    var result = await sl<GetClassRoutinesUseCase>().call(params: getClassRoutineParams);
    result.fold(
            (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
            (data)=> emit(state.copyWith(status: Status.success, classRoutineEntity: data))
    );
  }


}