import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/features/routine/presentation/bloc/routine_event.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

part 'routine_state.dart';

class RoutineBloc extends Bloc<RoutineEvent, RoutineState>{
  RoutineBloc(): super(RoutineState.initial());
}