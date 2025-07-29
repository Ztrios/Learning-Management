import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/features/profile/domain/entities/student_profile_entity.dart';
import 'package:learning_management/features/profile/domain/usecases/get_student_profile_usecase.dart';
import 'package:learning_management/features/profile/domain/usecases/update_student_profile_usecase.dart';
import 'package:learning_management/features/profile/presentation/bloc/profile_event.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>{
  ProfileBloc():super(ProfileState.initial()){
    on<GetStudentProfile>(_onGetStudentProfile);
    on<UpdateStudentProfile>(_onUpdateStudentProfile);
  }

  Future<void> _onGetStudentProfile(GetStudentProfile event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<GetStudentProfileUseCase>().call(params: event.studentId);
    result.fold(
        (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
        (data)=> emit(state.copyWith(status: Status.success, studentProfileEntity: data))
    );
  }

  Future<void> _onUpdateStudentProfile(UpdateStudentProfile event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: Status.loading));
    UpdateStudentProfileParams updateStudentProfileParams = UpdateStudentProfileParams(
        studentId: event.studentId,
        body: event.body
    );
    var result = await sl<UpdateStudentProfileUseCase>().call(params: updateStudentProfileParams);
    result.fold(
            (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
            (data)=> emit(state.copyWith(status: Status.success, studentProfileEntity: data))
    );
  }


}