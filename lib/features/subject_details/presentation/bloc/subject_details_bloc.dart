import 'package:equatable/equatable.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/utils/enums/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/features/subject_details/domain/entities/assignment_details_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/assignment_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/exam_details_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/exams_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/lession_details_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/lessions_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/quiz_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/usecases/assignment_submission_usecase.dart';
import 'package:learning_management/features/subject_details/domain/usecases/get_assignment_details_usecase.dart';
import 'package:learning_management/features/subject_details/domain/usecases/get_assignment_list_usecase.dart';
import 'package:learning_management/features/subject_details/domain/usecases/get_exam_details_usecase.dart';
import 'package:learning_management/features/subject_details/domain/usecases/get_exams_list_usecase.dart';
import 'package:learning_management/features/subject_details/domain/usecases/get_lession_details_usecase.dart';
import 'package:learning_management/features/subject_details/domain/usecases/get_lessions_list_usecase.dart';
import 'package:learning_management/features/subject_details/domain/usecases/get_quiz_list_usecase.dart';
import 'package:learning_management/features/subject_details/domain/usecases/submit_exam_usecase.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_event.dart';

part 'subject_details_state.dart';

class SubjectDetailsBloc extends Bloc<SubjectDetailsEvent, SubjectDetailsState>{
  SubjectDetailsBloc():super(SubjectDetailsState.initial()){
    on<GetLessionsList>(_onGetLessionsList);
    on<GetLessionDetails>(_onGetLessionDetails);
    on<GetAssignmentList>(_onGetAssignmentList);
    on<GetAssignmentDetails>(_onGetAssignmentDetails);
    on<AssignmentSubmit>(_onAssignmentSubmit);
    on<GetQuizList>(_onGetQuizList);
    on<GetExamsList>(_onGetExamsList);
    on<GetExamsDetails>(_onGetExamsDetails);
    on<SubmitExam>(_onSubmitExam);
  }

  Future<void> _onGetLessionsList(GetLessionsList event, Emitter<SubjectDetailsState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<GetLessionsUseCase>().call(params: event.subjectId);
    result.fold(
            (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
            (data)=> emit(state.copyWith(status: Status.success, lessionsListEntity: data))
    );
  }


  Future<void> _onGetLessionDetails(GetLessionDetails event, Emitter<SubjectDetailsState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<GetLessionDetailsUseCase>().call(params: event.lessionId);
    result.fold(
            (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
            (data)=> emit(state.copyWith(status: Status.success, lessionDetailsEntity: data))
    );
  }

  Future<void> _onGetAssignmentList(GetAssignmentList event, Emitter<SubjectDetailsState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<GetAssignmentListUseCase>().call(params: event.lessionId);
    result.fold(
            (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
            (data)=> emit(state.copyWith(status: Status.success, assignmentListEntity: data))
    );
  }

  Future<void> _onGetAssignmentDetails(GetAssignmentDetails event, Emitter<SubjectDetailsState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<GetAssignmentDetailsUseCase>().call(params: event.assignmentId);
    result.fold(
            (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
            (data)=> emit(state.copyWith(status: Status.success, assignmentDetailsEntity: data))
    );
  }


  Future<void> _onAssignmentSubmit(AssignmentSubmit event, Emitter<SubjectDetailsState> emit) async {
    emit(state.copyWith(assignmentSubmissionStatus: Status.loading));
    var result = await sl<AssignmentSubmissionUseCase>().call(params: event.body);
    result.fold(
            (error)=> emit(state.copyWith(assignmentSubmissionStatus: Status.error, message: error.message)),
            (data)=> emit(state.copyWith(assignmentSubmissionStatus: Status.success))
    );
  }


  Future<void> _onGetQuizList(GetQuizList event, Emitter<SubjectDetailsState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<GetQuizListUseCase>().call(params: event.lessionId);
    result.fold(
            (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
            (data)=> emit(state.copyWith(status: Status.success, quizListEntity: data))
    );
  }


  Future<void> _onGetExamsList(GetExamsList event, Emitter<SubjectDetailsState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<GetExamsListUseCase>().call(params: event.subjectId);
    result.fold(
            (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
            (data)=> emit(state.copyWith(status: Status.success, examsListEntity: data))
    );
  }

  Future<void> _onGetExamsDetails(GetExamsDetails event, Emitter<SubjectDetailsState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<GetExamDetailsUseCase>().call(params: event.examId);
    result.fold(
            (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
            (data)=> emit(state.copyWith(status: Status.success, examDetailsEntity: data))
    );
  }


  Future<void> _onSubmitExam(SubmitExam event, Emitter<SubjectDetailsState> emit) async {
    emit(state.copyWith(examSubmissionStatus: Status.loading));
    var result = await sl<SubmitExamUseCase>().call(params: event.body);
    result.fold(
            (error)=> emit(state.copyWith(examSubmissionStatus: Status.error, message: error.message)),
            (data)=> emit(state.copyWith(examSubmissionStatus: Status.success))
    );
  }



}