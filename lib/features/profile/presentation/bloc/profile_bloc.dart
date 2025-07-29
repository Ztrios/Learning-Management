import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/features/profile/domain/entities/student_profile_entity.dart';
import 'package:learning_management/features/profile/domain/usecases/get_student_profile_usecase.dart';
import 'package:learning_management/features/profile/presentation/bloc/profile_event.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>{
  ProfileBloc():super(ProfileState.initial()){
    on<GetStudentProfile>(_onGetStudentProfile);
  }

  Future<void> _onGetStudentProfile(GetStudentProfile event, Emitter<ProfileState> emit) async {
    var result = await sl<GetStudentProfileUseCase>().call(params: event.studentId);
    result.fold(
        (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
        (data)=> emit(state.copyWith(status: Status.success, studentProfileEntity: data))
    );
  }

}