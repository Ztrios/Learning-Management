import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/features/home/domain/entities/subject_entity.dart';
import 'package:learning_management/features/home/domain/entities/tasks_entity.dart';
import 'package:learning_management/features/home/domain/usecases/get_student_subjects_usecase.dart';
import 'package:learning_management/features/home/domain/usecases/get_students_tasks_usecase.dart';
import 'package:learning_management/features/home/presentation/bloc/home_event.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc():super(HomeState.initial()){
    on<InitialEvent>(_onInitialEvent);
    on<GetStudentTasks>(_onGetStudentTasks);
    on<GetStudentSubjects>(_onGetStudentSubjects);
  }

  Future<void> _onInitialEvent(InitialEvent event, Emitter<HomeState> emit) async {}


  Future<void> _onGetStudentTasks(GetStudentTasks event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<GetStudentTasksUseCase>().call(params: event.sectionId);
    result.fold(
        (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
        (data)=> emit(state.copyWith(status: Status.success, tasksEntity: data))
    );
  }

  Future<void> _onGetStudentSubjects(GetStudentSubjects event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<GetStudentSubjectsUseCase>().call(params: event.studentId);
    result.fold(
        (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
        (data)=> emit(state.copyWith(status: Status.success, subjectsEntity: data))
    );
  }




}