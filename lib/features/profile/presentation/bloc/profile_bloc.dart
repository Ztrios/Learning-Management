import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/features/profile/presentation/bloc/profile_event.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>{
  ProfileBloc():super(ProfileState.initial());
}