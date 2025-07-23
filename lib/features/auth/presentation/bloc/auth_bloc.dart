import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/features/auth/data/models/student_model.dart';
import 'package:learning_management/features/auth/domain/entities/sections_entity.dart';
import 'package:learning_management/features/auth/domain/entities/sign_in_entity.dart';
import 'package:learning_management/features/auth/domain/entities/student_entity.dart';
import 'package:learning_management/features/auth/domain/repositories/auth_repositories.dart';
import 'package:learning_management/features/auth/domain/usecases/get_signin_entity_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/save_signin_entity_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/sections_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_event.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

part 'package:learning_management/features/auth/presentation/bloc/auth_state.dart';


class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc():super(AuthState.initial()){
    on<SignIn>(_onSignIn);
    on<SignUp>(_onSignUp);
    on<GetSections>(_onGetSections);
    on<GetSignInEntity>(_onGetSignInEntity);
    on<SaveSignInEntity>(_onSaveInEntity);
  }


  Future<void> _onSignIn(SignIn event,Emitter<AuthState> emit) async {
    emit(state.copyWith(signInStatus: Status.loading));
    Map<String,dynamic> body = {
      "username" : event.userName,
      "password" : event.password
    };
    var result = await sl<SignInUseCase>().call(params: body);
    result.fold(
        (error)=> emit(state.copyWith(signInStatus: Status.error, message: error.message)),
        (data){
          emit(state.copyWith(
              signInStatus: Status.success,
              signInEntity: data,
              studentEntity: data.signInData?.student != null ?
              StudentModel.fromJson(data.signInData!.student!.toJson()).toEntity() : null
          ));
          if(event.rememberStudent) add(SaveSignInEntity());
        }
    );
  }


  Future<void> _onSignUp(SignUp event, Emitter<AuthState> emit) async {
    emit(state.copyWith(signUpStatus: Status.loading));

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
            (error) => emit(state.copyWith(signUpStatus: Status.error, message: error.message)),
        (data) => emit(state.copyWith(signUpStatus: Status.success, studentEntity: data))
    );
  }


  Future<void> _onGetSections(GetSections event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<SectionsUseCase>().call(params: event.batchYear);
    result.fold(
        (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
        (data)=> emit(state.copyWith(status: Status.success, sectionsEntity: data))
    );
  }


  Future<void> _onSaveInEntity(SaveSignInEntity event,Emitter<AuthState> emit) async {
    emit(state.copyWith(signInStatus: Status.loading));
    var result = await sl<SaveSignInEntityUseCase>().call(params: state.signInEntity);
    result.fold(
            (error)=> emit(state.copyWith(signInStatus: Status.error, message: error.message)),
            (data){
              emit(state.copyWith(signInStatus: Status.success));
            }
    );
  }


  Future<void> _onGetSignInEntity(GetSignInEntity event,Emitter<AuthState> emit) async {
    //emit(state.copyWith(signInStatus: Status.loading));
    var result = await sl<GetSignInEntityUseCase>().call();
    result.fold(
            (error)=> emit(state.copyWith(signInStatus: Status.error, message: error.toString())),
            (data)=> emit(state.copyWith(
              signInStatus: Status.success,
            signInEntity: data,
            studentEntity: data?.signInData?.student != null ?
            StudentModel.fromJson(data!.signInData!.student!.toJson()).toEntity() : null
        ))
    );
  }



}