import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/features/authentication/data/models/student_model.dart';
import 'package:learning_management/features/authentication/domain/entities/sign_in_entity.dart';
import 'package:learning_management/features/authentication/domain/entities/student_entity.dart';
import 'package:learning_management/features/authentication/domain/usecases/sign_in_usecase.dart';
import 'package:learning_management/features/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:learning_management/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

part  'package:learning_management/features/authentication/presentation/bloc/authentication_state.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent,AuthenticationState>{
  AuthenticationBloc():super(AuthenticationState.initial()){
    on<SignIn>(_onSignIn);
    on<SignUp>(_onSignUp);
  }


  Future<void> _onSignIn(SignIn event,Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(signInStatus: Status.loading));
    Map<String,dynamic> body = {
      "username" : event.userName,
      "password" : event.password
    };
    var result = await sl<SignInUseCase>().call(params: body);
    result.fold(
        (error)=> emit(state.copyWith(signInStatus: Status.error, message: error.toString())),
        (data)=> emit(state.copyWith(
            signInStatus: Status.success,
            signInEntity: data,
            studentEntity: data.signInData?.student != null ?
              StudentModel.fromJson(data.signInData!.student!.toJson()).toEntity() : null
        ))
    );
  }


  Future<void> _onSignUp(SignUp event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(signInStatus: Status.loading));

    Map<String,dynamic> body = {
      "file" : await MultipartFile.fromFile(event.studentPhoto.path),
      "dto" : jsonEncode(
          {
            "email": event.email,
            "fullName": event.studentName,
            "fathersName": event.fathersName,
            "mothersName": event.mothersName,
            "address": event.district,
            "phone": event.phone,
            "yearBatch": event.batchYear,
            "sectionId": event.section,
            "password": event.password,
          }
      )
    };
    var result = await sl<SignUpUseCase>().call(params: body);
    result.fold(
            (error) => emit(state.copyWith(signInStatus: Status.error, message: error.message)),
        (data) => emit(state.copyWith(signInStatus: Status.success, studentEntity: data))
    );
  }



}