import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/features/lessons/presentation/bloc/lessions_event.dart';

part 'lessions_state.dart';

class LessionsBloc extends Bloc<LessionsEvent, LessionsState>{
  LessionsBloc():super(LessionsState.initial());
}