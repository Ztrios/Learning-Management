import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/features/progress/presentation/bloc/progress_event.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

part 'progress_state.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState>{
  ProgressBloc():super(ProgressState.initial());
}