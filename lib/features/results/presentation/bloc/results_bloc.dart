import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/features/results/presentation/bloc/results_event.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

part 'results_state.dart';

class ResultsBloc extends Bloc<ResultsEvent,ResultsState>{
  ResultsBloc():super(ResultsState.initial());
}