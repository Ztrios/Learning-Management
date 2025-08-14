import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/features/progress/data/models/progress_models.dart';
import 'package:learning_management/features/progress/domain/entities/progress_entities.dart';
import 'package:learning_management/features/progress/domain/usecases/progress_usecases.dart';
import 'package:learning_management/features/progress/presentation/bloc/progress_event.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';
import 'package:collection/collection.dart';

part 'progress_state.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState>{
  ProgressBloc():super(ProgressState.initial()){
    on<GetStudentProgress>(_onGetStudentProgress);
    on<SelectSubject>(_onSelectSubject);
  }

  Future<void> _onGetStudentProgress(GetStudentProgress event, Emitter<ProgressState> emit)async{
    emit(state.copyWith(status: Status.loading));
    var result = await sl<ProgressUseCase>().call(params: event.studentId);
    result.fold(
            (error)=> emit(state.copyWith(status: Status.error, message: state.message)),
            (data)=> emit(state.copyWith(
                status: Status.success,
                progressEntity: data,
                selectedSubject: data.subjectProgresses.isNotNullAndNotEmpty
                    ? data.subjectProgresses!.first
                    : null
            ))
    );
  }

  void _onSelectSubject(SelectSubject event, Emitter<ProgressState> emit){
    emit(state.copyWith(status: Status.loading));
    SubjectProgress? selectedProgress = state.progressEntity?.subjectProgresses
        ?.singleWhereOrNull((subject) => subject.subjectId == event.subjectId);
    emit(state.copyWith(status: Status.success, selectedSubject: selectedProgress ));
  }


}