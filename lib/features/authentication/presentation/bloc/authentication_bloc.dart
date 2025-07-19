import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

part  'package:learning_management/features/authentication/presentation/bloc/authentication_state.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent,AuthenticationState>{
  AuthenticationBloc():super(AuthenticationState.initial());
}